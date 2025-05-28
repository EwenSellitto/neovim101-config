local options = {
  notify = {
    enabled = false,
  },
  sp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = false,
  },
  lsp = {
    progress = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
  },
}

return options
