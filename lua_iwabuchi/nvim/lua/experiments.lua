#!/usr/bin/env lua
--
-- FileName:     experiments
-- Author:       8ucchiman
-- Email:        8ucchiman@gmail.com
-- CreatedDate:  2023-08-04 00:47:41
-- LastModified: 2023-01-23 14:18:33 +0900
-- Reference:    https://zenn.dev/botamotch/articles/46bd760b44c6a2
--               https://zenn.dev/kawarimidoll/articles/7e986ceb6802fc
-- autocmdに関するドキュメント: https://vim-jp.org/vimdoc-ja/autocmd.html

-- vim.api.nvim_command('set runtimepath^=.')



local Window = {}

function Window:new()
    local w = {}
    w.bufnr = vim.api.nvim_create_buf(false, true)  -- 一時バッファ作成
    return w
end


local win = Window.new()

local M = {}
--M.Window = Window

function M.nvim_open_win()
    h = vim.opt.lines['_value'] - vim.o.cmdheight
    w = vim.o.columns

    vim.api.nvim_open_win(
    win.bufnr,
    true,               -- ウィンドウに移動するか
    {
        relative="cursor",    -- editor/win/cursor/mouse
        anchor="SW",
        width=80,             -- ウィンドウの幅
        height=30,            -- ウィンドウの高さ
        col=w-80-5,           -- 右からの距離
        row=h-30-3,           -- 上からの距離
        focusable=true,
    })
end

function M.term_split()
    vim.api.nvim_command('split | wincmd j | resize 10 | terminal')
end


local api = vim.api
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local yankGrp = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

--vim.api.nvim_create_user_command('T', 'split | wincmd j | resize 10 | terminal', {nargs=0})

-- バッファの新規作成でコマンド実行
autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    command = "echo 'Entering a C or C++ file'",
})
-- 起動後に文字列を出力
--autocmd("VimEnter", {
--    command = "echo '8ucchiman was here!'",
--})


-- 起動後にコールバック軌道
--autocmd("VimEnter", {
--    callback = M.term_split
--    --command = 
--})

--autocmd("VimEnter", {
--    command = "buffer 1"
--})


--autocmd('BufWritePre', {
--    pattern = '',
--    command = ":%s/\\s\\+$//e",
--})



local mt = {
    __add = complex_add,
    __mul = complex_multiply,
}

local function complex(real, imaginary)
    local result = {
        real = real,
        imaginary = imaginary,
    }
    setmetatable(result, mt)
    return result
end

-- バッファの数
vim.cmd('echo len(filter(range(1, bufnr("$")), "buflisted(v:val)"))')

--vim.cmd('buffers')
--vim.cmd([[
--    let g:multiline_list = [
--        \ 1,
--        \ 2,
--        \ 3,
--        \ ]
--    echo g:multiline_list
--]])

--v = {
--    name="feifei",
--    age=28,
--    sex="female"
--}
--
--setmetatable(v, {memo1="test1", memo2="test2"})
--
--for key, val in pairs(v) do
--    print(key, val)
--end

--print(vim.api.nvim_get_current_win())
--print(vim.api.nvim_buf_get_name(1))
--print(tostring(vim.api.nvim_get_current_line()))

vim.cmd("set runtimepath+=$HOME/common/lib/schedule.nvim")
vim.cmd('source $HOME/common/lib/schedule.nvim/plugin/schedule.lua')

return M

