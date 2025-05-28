local l = require "luasnip"
local s = l.snippet
local t = l.text_node
local i = l.insert_node
local r = l.rep

return {
  s("run", {
    t { "- name: " },
    i(1, "Name"),
    t { "", "  run: " },
    i(2, "Command"),
  }),
}
