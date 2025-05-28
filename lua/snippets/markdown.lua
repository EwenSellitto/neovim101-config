local l = require "luasnip"
local s = l.snippet
local t = l.text_node
local i = l.insert_node
local r = l.rep

local function code_block(lang)
  return {
    t { "```" .. lang, "" },
    i(1),
    t { "", "```" },
  }
end

return {
  filetype = { "markdown", "codecompanion" },

  s("code_ts", code_block "ts"),
  s("code_js", code_block "js"),
  s("code_py", code_block "py"),
  s("code_rs", code_block "rs"),

  s("ued", {
    t { "use @editor to apply the changes" },
  }),
}
