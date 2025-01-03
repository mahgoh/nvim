-- <C-b>  File tree (neo-tree)
-- gcc    Line-comment toggle
-- gbc    Block-comment toggle

local opts = { noremap = true, silent = true }

-- Small terminal
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
-- exit with shift escape
vim.keymap.set("t", "<S-Esc>", "<C-\\><C-n>")

-- Move text up and down (Alt-j/k)
vim.keymap.set("n", "∆", "<Esc>:m .-2<CR>==")
vim.keymap.set("n", "º", "<Esc>:m .+1<CR>==")
vim.keymap.set("i", "∆", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "º", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("v", "º", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "∆", ":m '<-2<CR>gv=gv")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Split window
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")

-- Fast exit
vim.keymap.set("i", "jj", "<ESC>")

-- Window resizing with arrows
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<C-w>", ":bdelete<CR>")

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>")

-- Blame
vim.keymap.set("n", "<leader>bt", "<CMD>Gitsigns toggle_current_line_blame<cr>")

-- Go err nil
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Neorg
vim.keymap.set("n", "<leader>nm", ":Neorg workspace main<CR>")
vim.keymap.set("n", "<leader>ne", ":Neorg workspace edu<CR>")
vim.keymap.set("n", "<leader>nw", ":Neorg workspace work<CR>")
vim.keymap.set("n", "<leader>nb", ":Neorg workspace badminton<CR>")
vim.keymap.set("n", "<leader>nc", ":Neorg toggle-concealer<CR>")
vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>")

-- Obsidian
vim.keymap.set("n", "<leader>os", vim.cmd.ObsidianSearch)
vim.keymap.set("n", "<leader>heute", vim.cmd.ObsidianToday)
vim.keymap.set("n", "<leader>geste", vim.cmd.ObsidianYesterday)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ds", vim.cmd.Neogen) -- describe

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      })
    end

    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>bf", function() vim.lsp.buf.format() end, opts)
  end
})
