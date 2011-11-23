layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

shifty.config.defaults = {
    layout = awful.layout.suit.tile.bottom,
    nmaster   = 2,
    ncol = 1,
    mwfact = 0.75,
    exclusive = false,
    guess_name = true,
    guess_position = true,
}

shifty.config.tags = {
    main = {
        init      = true,
        mwfact    = 0.75,
        persist   = true,
        screen    = 1,
        position  = 1,
    },
    web = {
        exclusive = true,
        screen    = 2,
        position  = 2,
        spawn     = browser,
    },
    misc = {
        init     = true,
        position = 3,
    },
    media = {
        layout    = awful.layout.suit.float,
        exclusive = false,
        position  = 8,
    },
    office = {
        layout   = awful.layout.suit.tile,
        position = 5,
    },
}

shifty.config.apps = {
    {
        match = {
            "Navigator",
            "Vimperator",
            "Gran Paradiso",
        },
        tag = "web",
    },
    {
        match = {
            "OpenOffice.*",
            "Abiword",
            "Gnumeric",
        },
        tag = "office",
    },
    {
        match = {
            "Mplayer.*",
            "Mirage",
            "gimp",
            "gtkpod",
            "Ufraw",
            "easytag",
        },
        tag = "media",
        nopopup = true,
    },
    {
        match = {
            "MPlayer",
            "Gnuplot",
            "galculator",
        },
        float = true,
    },
    {
        match = {
            terminal,
        },
        honorsizehints = false,
        slave = true,
    },
    {
        match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
                end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
            )
    },
}

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
