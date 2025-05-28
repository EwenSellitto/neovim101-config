require("sonarlint").setup {
  server = {
    cmd = {
      "sonarlint-language-server",
      -- Ensure that sonarlint-language-server uses stdio channel
      "-stdio",
      "-analyzers",
      vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjs.jar",
      vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
      vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarhtml.jar",
      vim.fn.expand "$MASON/share/sonarlint-analyzers/sonariac.jar",
    },
  },

  filetypes = {
    "python",
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "css",
    "dockerfile",
  },
}
