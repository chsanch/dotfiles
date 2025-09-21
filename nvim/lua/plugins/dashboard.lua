return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██████   █████                   █████   █████ █████ ██████   ██████
░░██████ ░░███                   ░░███   ░░███ ░░███ ░░██████ ██████ 
 ░███░███ ░███   ██████   ██████  ░███    ░███  ░███  ░███░█████░███ 
 ░███░░███░███  ███░░███ ███░░███ ░███    ░███  ░███  ░███░░███ ░███ 
 ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░░░  ░███ 
 ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███      ░███ 
 █████  ░░█████░░██████ ░░██████     ░░███      █████ █████     █████
░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░     ░░░░░ 
                                                                     
                                                                     
                                                                     ]],
      },
      -- sections = {
      --   { section = "header" },
      --   { section = "keys", gap = 1, padding = 1 },
      --   { section = "startup" },
      -- },

      sections = {
        {
          section = "terminal",
          cmd = "ascii-image-converter ~/.config/nvim/nvim.png --color -b --threshold 1",
          -- cmd = "chafa ~/.config/nvim/nvim12-m.png --format symbols --symbols vhalf --animate=false",
          height = 17,
          padding = 1,
        },
        -- {
        --   section = "terminal",
        --   cmd = "fortune -s | cowsay",
        --   padding = 1,
        -- },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
          -- { section = "startup" },
        },
      },
    },
  },
}
