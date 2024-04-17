require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = {
    "flake8",
    "black",

    "prettier",

    "beautysh",
    "shellcheck",

    "clang-format",
    "cpplint",

    "luacheck",

    -- LSP
    "pyright",
    -- "pylyzer",
    "clangd",
    "htmlhint",
    "stylua",
    "base-language-server",
    "bibtex-tidy",
    "html-lsp",
    "texlab",
    },
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
