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
    -- "stylua"
    },
    automatic_installation = false,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
