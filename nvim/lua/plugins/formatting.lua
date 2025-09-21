local config = { "prettier", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      javascript = config,
      typescript = config,
      html = config,
      ["html.edge"] = config,
      ["javascript.glimmer"] = config,
      ["typescript.glimmer"] = config,
    },
    notify_on_error = false,
    formatters = {
      -- We don't want to enable prettierd
      -- because it requires global installation, and then
      -- we can't even have projects without prettier
      -- NOTE: make sure prettier (and prettierd) are not installed globally
      prettier = {
        require_cwd = true,
      },
    },
  },
}
