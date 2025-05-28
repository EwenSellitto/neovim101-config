local l = require "luasnip"
local s = l.snippet
local t = l.text_node
local i = l.insert_node
local r = l.rep

return {
  s("snippet_file", {
    t {
      "local l = require 'luasnip'",
      "local s = l.snippet",
      "local t = l.text_node",
      "local i = l.insert_node",
      "local r = l.rep",
      "",
      "return {}",
    },
  }),
}
