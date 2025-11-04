return {{
    'goolord/alpha-nvim',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'
        dashboard.section.header.val =
            {[[ _____ ______       ___    ___      ________  ________  ________   ________ ___  ________     ]],
             [[|\   _ \  _   \    |\  \  /  /|    |\   ____\|\   __  \|\   ___  \|\  _____\\  \|\   ____\    ]],
             [[\ \  \\\__\ \  \   \ \  \/  / /    \ \  \___|\ \  \|\  \ \  \\ \  \ \  \__/\ \  \ \  \___|    ]],
             [[ \ \  \\|__| \  \   \ \    / /      \ \  \    \ \  \\\  \ \  \\ \  \ \   __\\ \  \ \  \  ___  ]],
             [[  \ \  \    \ \  \   \/  /  /        \ \  \____\ \  \\\  \ \  \\ \  \ \  \_| \ \  \ \  \|\  \ ]],
             [[   \ \__\    \ \__\__/  / /           \ \_______\ \_______\ \__\\ \__\ \__\   \ \__\ \_______\]],
             [[    \|__|     \|__|\___/ /             \|_______|\|_______|\|__| \|__|\|__|    \|__|\|_______|]],
             [[                  \|___|/                                                                     ]],
             [[                                                                                              ]],
             [[                                                                                              ]],
             [[ ________      ___    ___      ___      ___ ________  ___   _________  ________  ___          ]],
             [[|\   __  \    |\  \  /  /|    |\  \    /  /|\   __  \|\  \ |\___   ___\\   __  \|\  \         ]],
             [[\ \  \|\ /_   \ \  \/  / /    \ \  \  /  / | \  \|\  \ \  \\|___ \  \_\ \  \|\  \ \  \        ]],
             [[ \ \   __  \   \ \    / /      \ \  \/  / / \ \  \\\  \ \  \    \ \  \ \ \   _  _\ \  \       ]],
             [[  \ \  \|\  \   \/  /  /        \ \    / /   \ \  \\\  \ \  \____\ \  \ \ \  \\  \\ \  \____  ]],
             [[   \ \_______\__/  / /           \ \__/ /     \ \_______\ \_______\ \__\ \ \__\\ _\\ \_______\]],
             [[    \|_______|\___/ /             \|__|/       \|_______|\|_______|\|__|  \|__|\|__|\|_______|]],
             [[             \|___|/                                                                      ]],
             [[                                                                                              ]],
             [[                                                                                              ]]}
        dashboard.section.buttons.val = {dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                                         dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>")}
        local handle = io.popen('fortune')
        local fortune = handle:read("*a")
        handle:close()
        dashboard.section.footer.val = fortune

        dashboard.config.opts.noautocmd = true

        vim.cmd [[autocmd User AlphaReady echo 'ready']]

        alpha.setup(dashboard.config)
    end

}}
