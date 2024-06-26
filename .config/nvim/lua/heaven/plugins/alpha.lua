return{
  "goolord/alpha-nvim",
  config = function ()
    local dashboard = require("alpha.themes.dashboard")

    require'alpha'.setup(dashboard.config)
    -- Set header
    dashboard.section.header.val = {
      -- "███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ",
      -- "███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄",
      -- "███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███",
      -- "███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
      -- "███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███",
      -- "███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
      -- "███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███",
      -- " ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ",
      --
      -- " .--..--..--..--..--..--..--..--..--..--..--..--. ",
      -- "/ .. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \",
      -- "\ \/\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ \/ /",
      -- " \/ /`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'\/ / ",
      -- " / /\                                        / /\ ",
      -- "/ /\ \   ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.    / /\ \",
      -- "\ \/ /  •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪   \ \/ /",
      -- " \/ /   ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·    \/ / ",
      -- " / /\   ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌    / /\ ",
      -- "/ /\ \  ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀ ▀▀  █▪▀▀▀   / /\ \",
      -- "\ \/ /                                      \ \/ /",
      -- " \/ /                                        \/ / ",
      -- " / /\.--..--..--..--..--..--..--..--..--..--./ /\ ",
      -- "/ /\ \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \/\ \",
      -- "\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `'\ `' /",
      -- " `--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--'`--' "
      --
      "▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌",
      "▐                                         ▌",
      "▐     ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.     ▌",
      "▐    •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪    ▌",
      "▐    ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·    ▌",
      "▐    ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌    ▌",
      "▐    ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀ ▀▀  █▪▀▀▀    ▌",
      "▐                                         ▌",
      "▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌"
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "p", "󰉋  > Projects", ":cd ~/Desktop/Projects | Neotree<CR>"),
      dashboard.button( "SPC t f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
      dashboard.button( "SPC t r", "  > Recent"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | Neotree<CR>"),
      dashboard.button( "q", "  > Quit", ":qa<CR>"),
    }


    dashboard.section.footer.val = {
      "I hope that someone gets my message in a bottle",
    }
  end
}
