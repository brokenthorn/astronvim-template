-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- These two themes have the widest feature set, incl. semantic highlighting,
  -- they are frequently maintained and have support for tons of plugins:
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.snippet.nvim-snippets" },

  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },

  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.ocaml" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.sql" },

  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },

  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  -- { import = "astrocommunity.git.git-blame-nvim" }, -- inline git blame

  -- Splitting/joining lines of code using Tree Sitter:
  { import = "astrocommunity.editing-support.treesj" },
}
