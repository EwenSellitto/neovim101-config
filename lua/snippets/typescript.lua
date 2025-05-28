local l = require "luasnip"
local s = l.snippet
local t = l.text_node
local i = l.insert_node

local function controller_route(method)
  method = method:lower():gsub("^%l", string.upper) or "Get"

  return {
    t { "@" .. method .. "(" },
    i(1, "route"),
    t { ")", "async " },
    i(2, "methodName"),
    t { "(" },
    i(3, "req: Request"),
    t { ") {", "" },
    i(4, "// method content"),
    t { "", "}" },
  }
end

return {
  s("dto", {
    t { "export class " },
    i(1, "ClassName"),
    t { "Dto {", "" },
    i(2, "// class content"),
    t { "", "}" },
  }),

  s("get", controller_route "get"),
  s("post", controller_route "post"),
  s("put", controller_route "put"),
  s("patch", controller_route "patch"),
  s("delete", controller_route "delete"),

  s("@Session", {
    t { "@Session() session: SessionContainer," },
  }),
}
