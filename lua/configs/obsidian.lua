require("obsidian").setup {
  ui = { enable = false },
  workspaces = {
    {
      name = "notes",
      path = "~/Documents/notes/",
    },
  },
  new_notes_location = "current_dir",
  completion = {
    nvim_cmp = true,
    min_chars = 2,
    prepend_note_id = true,
  },
  mappings = {
    ["<leader>of"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ["<leader>od"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  note_frontmatter_func = function(note)
    local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  templates = {
    folder = "99 - Meta/Templates/",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
    tags = "",
  },

  wiki_link_func = function(opts)
    if opts.id == nil then
      return string.format("[[%s]]", opts.label)
    elseif opts.label ~= opts.id then
      return string.format("[[%s|%s]]", opts.id, opts.label)
    else
      return string.format("[[%s]]", opts.id)
    end
  end,
}
