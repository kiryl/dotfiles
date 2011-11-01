
/* 
  Resolves IP addresses to hostnames and hostnames to IP addresses.

  Copyright (C) 2000 MySQL AB
  Copyright (C) 2002,2003,2006 Dmitry V. Levin <ldv@altlinux.org>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#define RESOLVE_VERSION "2.2"

#ifndef _GNU_SOURCE
# define _GNU_SOURCE
#endif

#include <stdio.h>
#include <errno.h>
#include <error.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <getopt.h>

static int silent;
static int status;
static unsigned int timeout;

static struct option long_options[] = {
	{"silent", no_argument, 0, 's'},
	{"timeout", required_argument, 0, 't'},
	{"help", no_argument, 0, 'h'},
	{"version", no_argument, 0, 'V'},
	{0, 0, 0, 0}
};

static void
print_version(void)
{
	printf("%s version %s\n", program_invocation_short_name,
	       RESOLVE_VERSION);
}

static void __attribute__ ((__noreturn__))
usage(int rc)
{
	printf("Usage: %s [OPTION]... <hostname or IP address>...\n",
	       program_invocation_short_name);
	puts("Get hostname based on IP address or IP address based on hostname.\n");
	puts("\
  -s, --silent   Be more silent.\n\
  -t NUMBER, --timeout=NUMBER\n\
                 Terminate after NUMBER of seconds.\n\
  -h, --help     Displays this help and exits.\n\
  -V, --version  Displays version information and exits.\n");

	exit(rc);
}

static struct hostent *
gethostbyaddr_with_timeout(const void *addr, int len, int type)
{
	struct hostent *hp;

	if (timeout)
		alarm(timeout);
	hp = gethostbyaddr(addr, len, type);
	if (timeout)
		alarm(0);

	return hp;
}

static struct hostent *
gethostbyname_with_timeout(const char *name)
{
	struct hostent *hp;

	if (timeout)
		alarm(timeout);
	hp = gethostbyname(name);
	if (timeout)
		alarm(0);

	return hp;
}

static void
print_hostbyaddr(const char *name, const char *addr, int len, int type)
{
	struct hostent *hp;

	if ((hp = gethostbyaddr_with_timeout(addr, len, type)))
	{
		char  **aliases;

		if (silent)
		{
			puts(hp->h_name);
			return;
		}

		printf("Host name%s of %s: %s",
		       *hp->h_aliases ? "s" : "", name, hp->h_name);
		for (aliases = hp->h_aliases; *aliases; ++aliases)
			printf(", %s", *aliases);
		putchar('\n');
	} else
	{
		status = 2;
		error(EXIT_SUCCESS, 0, "unable to resolve: %s: %s", name,
		      h_errno ? hstrerror(h_errno) : strerror(errno));
	}
}

static void
resolve_addr4(const char *name, struct in_addr *inp)
{
	if (inp->s_addr == INADDR_ANY)
	{
		puts("any");
		return;
	}

	if (inp->s_addr == INADDR_LOOPBACK)
	{
		puts("loopback");
		return;
	}

	if (inp->s_addr == INADDR_BROADCAST)
	{
		puts("broadcast");
		return;
	}

	print_hostbyaddr(name, (const char *) inp, sizeof(*inp), AF_INET);
}

static void
resolve_addr6(const char *name, struct in6_addr *inp)
{
	if (IN6_IS_ADDR_UNSPECIFIED(inp->s6_addr32))
	{
		puts("any");
		return;
	}

	if (IN6_IS_ADDR_LOOPBACK(inp->s6_addr32))
	{
		puts("loopback");
		return;
	}

	print_hostbyaddr(name, (const char *) inp, sizeof(*inp), AF_INET6);
}

static const char *
my_inet_ntop(int af, const void *src)
{
	static char dst[INET6_ADDRSTRLEN];

	if (AF_INET6 == af)
	{
		struct in6_addr *in = (struct in6_addr *) src;

		if (IN6_IS_ADDR_V4MAPPED(in->s6_addr32))
		{
			af = AF_INET;
			src = &in->s6_addr32[3];
		}
	}

	return inet_ntop(af, src, dst, sizeof(dst));
}

static void
resolve_name(const char *name)
{
	struct hostent *hp = gethostbyname_with_timeout(name);

	if (!hp)
	{
		status = 2;
		error(EXIT_SUCCESS, 0, "unable to resolve: %s: %s", name,
		      h_errno ? hstrerror(h_errno) : strerror(errno));
		return;
	}

	if (silent)
	{
		puts(my_inet_ntop(hp->h_addrtype, hp->h_addr_list[0]));
	} else
	{
		char  **p;

		printf("IP address%s of %s:",
		       hp->h_addr_list[0] && hp->h_addr_list[1] ? "es" : "",
		       name);
		for (p = hp->h_addr_list; *p; ++p)
		{
			printf(" %s", my_inet_ntop(hp->h_addrtype, *p));
		}
		putchar('\n');
	}
}

typedef union
{
	struct in_addr in4;
	struct in6_addr in6;
} in_46_addr;

static void
alarm_handler(int signo)
{
	_exit(2);
}

static unsigned int
str2int(const char *str)
{
	unsigned long delay = 0;
	char   *p = NULL;

	errno = 0;
	delay = strtoul(str, &p, 10);
	if (!*str || *p || errno || !delay || delay >= UINT_MAX)
	{
		error(EXIT_SUCCESS, errno ? : EINVAL, "%s", str);
		usage(EXIT_FAILURE);
	}
	return delay;
}

int
main(int ac, char **av)
{
	int     c;

	while ((c = getopt_long(ac, av, "?st:hV", long_options, 0)) != EOF)
	{
		switch (c)
		{
			case 's':
				silent = 1;
				break;
			case 't':
				if (signal(SIGALRM, alarm_handler) == SIG_ERR)
					error(EXIT_FAILURE, errno, "signal");
				timeout = str2int(optarg);
				break;
			case 'V':
				print_version();
				exit(EXIT_SUCCESS);
			case 'h':
				usage(EXIT_SUCCESS);
			default:
				usage(EXIT_FAILURE);
		}
	}
	ac -= optind;
	av += optind;
	if (ac <= 0)
		usage(EXIT_FAILURE);

	while (ac--)
	{
		const char *name = *(av++);
		in_46_addr dst;

		if (inet_pton(AF_INET, name, &dst) > 0)
			resolve_addr4(name, &dst.in4);
		else if (inet_pton(AF_INET6, name, &dst) > 0)
			resolve_addr6(name, &dst.in6);
		else
			resolve_name(name);
	}

	return status;
}
