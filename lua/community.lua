-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- Add the community repository of plugin specifications FIRST!
  "AstroNvim/astrocommunity",

  -- import/override with your plugins folder:
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua" },

  -- example of importing an entire language pack:
  -- these packs can set up things such as Treesitter, Language Servers, additional language specific plugins, and more!
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
  --
  -- Lua Language Pack - https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/lua
  { import = "astrocommunity.pack.lua" },
  -- JSON and JSONC Pack
  { import = "astrocommunity.pack.json" },
  -- Markdown Language Pack - adds markdown TS parsers, marksman LSP, prettierd formatter
  { import = "astrocommunity.pack.markdown" },
  -- OCaml Langauge Pack - https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/ocaml
  -- { import = "astrocommunity.pack.ocaml" },
  -- Rust Language Pack - https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/rust
  -- { import = "astrocommunity.pack.rust" },
  -- SQL Language Pack - https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/sql
  -- { import = "astrocommunity.pack.sql" },
  -- TailwindCSS Language Pack - https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/tailwindcss
  -- { import = "astrocommunity.pack.tailwindcss" },
  -- TypeScript Language Pack
  { import = "astrocommunity.pack.typescript-all-in-one" },
  -- YAML Language Pack
  { import = "astrocommunity.pack.yaml" },

  -- Snippets integrated natively, uses friendly-snippets for expansion
  { import = "astrocommunity.snippet.nvim-snippets" },

  -- Open in GitHub (file or repo) commands
  { import = "astrocommunity.git.openingh-nvim" },
  -- Git Diff View, split panes, easier merge conflict solving, etc.
  { import = "astrocommunity.git.diffview-nvim" },
  -- Git Blame view inline
  { import = "astrocommunity.git.git-blame-nvim" },

  -- Find and Replace:
  { import = "astrocommunity.search.grug-far-nvim" },
}
