----------------------
-- Syntax Highlighting
----------------------
return {
  -- autoclose and autorename tags
  {
    "windwp/nvim-ts-autotag",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "typescript.glimmer",
          "javascript.glimmer",
          "javascriptreact",
          "typescriptreact",
          "markdown",
          "glimmer",
          "handlebars",
          "hbs",
          "svelte",
          "vue",
        },
      },
      ensure_installed = {
        -- Web Languages
        "javascript",
        "typescript",
        "html",
        "css",
        "regex",
        -- Web Framework Languages
        "glimmer",
        "glimmer_javascript",
        "glimmer_typescript",
        "svelte",
        "astro",
        -- Documentation Languages
        "markdown",
        "markdown_inline",
        "jsdoc",
        -- Configuration Languages
        "toml",
        "jsonc",
        "yaml",
        "dockerfile",
        "lua",
        "vim",
        -- Scripting Languages
        "commonlisp",
        "bash",
        -- Languages
        "ruby",
        "c",
        "cmake",
        "rust",
        "go",
        "python",
        -- Specifically for the treesitter AST
        "query",
        -- Utility Syntaxes
        "diff",
        "jq",
        "git_rebase",
        "gitcommit",
        "gitignore",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },

  "nvim-treesitter/nvim-treesitter-context",

  -- Comments in embedded languages via treesitter
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
}
