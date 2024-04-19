require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = {
    "flake8",
    "black",

    "beautysh",
    "shellcheck",

    "prettier",

    "clang-format",
    "cpplint",

    "luacheck",

    -- LSP
    -- "pyright",
    -- "clangd",
    -- "html-lsp",
    -- "htmlhint",
    -- "stylua",
    -- "base-language-server",
    -- "bibtex-tidy",
    -- "texlab",
    },
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
