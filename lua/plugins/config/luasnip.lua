local map = vim.keymap.set
local g = vim.g
g.mapleader = ","
local ls = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load()
map({ "i", "s" }, "<C-k>", function() ls.expand() end, { silent = true })
-- map({ "i", "s" }, "<C-w>", function() ls.jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-b>", function() ls.jump(-1) end, { silent = true })
map({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
