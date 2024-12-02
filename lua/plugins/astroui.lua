-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- https://github.com/AstroNvim/astroui
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  lazy = false,
  priority = 10000,

  ---@type AstroUIOpts
  opts = {
    -- AstroTheme:
    -- https://github.com/AstroNvim/astrotheme
    -- Supports: astrodark, astrolight, astromars
    -- colorscheme = "astrodark",

    -- latte, frappe, macchiato, mocha, increasing order of contrast:
    -- colorscheme = "catppuccin-mocha",

    colorscheme = "kanagawa-wave",
  },
}
