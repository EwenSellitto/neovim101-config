local options = {
  pkgs = {
    -- general stuff
    "sonarlint-language-server",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "prisma-language-server",
    -- "vetur-vls",
    "eslint-lsp",

    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",
    -- "cmake-language-server",

    -- python stuff
    "mypy",
    "pyright",
    "black",

    -- rust
    "codelldb",

    -- Bash
    "bash-language-server",

    -- debug
    "js-debug-adapter",
    "debugpy",
    "bash-debug-adapter",
  },
}

return options
