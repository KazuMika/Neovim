require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = {
        "flake8",
        -- "clang_format",
        "black",
        "stylua",
        "luacheck",
        -- "autopep8",
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
