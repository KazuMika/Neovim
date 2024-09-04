require("mason").setup()

require("mason-null-ls").setup {
  ensure_installed = {

    -- Lineter
    "prettier",
    "shellcheck",
    "cpplint",
    "luacheck",
    -- "vale",

    -- Formatter
    "clang-format",
    "shfmt",
    -- "latexindent",
    --stylua install with cargo

    -- LSP
    "pyright",
    --"jedi-language-server",
    --"pylyzer",
    "clangd",
    "lua-language-server",

    -- "html-lsp",
  },
  automatic_installation = false,
  handlers = {},
}
require("null-ls").setup {
  sources = {
    -- local null_present, null_ls = pcall(require, "null-ls")
    -- null_ls_sources.latexindent,
    -- null_ls_sources.chktex,
    -- Diagnostics
    -- Anything not supported by mason.
  },
}
