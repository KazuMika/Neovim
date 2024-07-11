require("mason").setup()

require("mason-null-ls").setup {
  ensure_installed = {

    -- Lineter
    "prettier",
    "shellcheck",
    "cpplint",
    "luacheck",

    -- Formatter
    "clang-format",
    "shfmt",
    --stylua install with cargo

    -- LSP
    "pyright",
    "clangd",
    "lua-language-server",

    -- "html-lsp",
  },
  automatic_installation = false,
  handlers = {},
}
require("null-ls").setup {
  sources = {
    -- Anything not supported by mason.
  },
}
