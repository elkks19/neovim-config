local keymap = vim.keymap

-- SOME UTILITIES
keymap.set("i", "jk", "<esc>", { desc = "return to normal mode", silent = true })
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "clear highlights", silent = true })
keymap.set('n', '<leader>so', ':update<cr> :source<cr>', { desc = "save a file and then source it", silent = true })
keymap.set({'n', 'i', 'v'}, '<C-s>', '<cmd>update<cr>', { desc = "save a file only if there are change", silent = true })

-- NEW FILE
keymap.set('n', '<C-n>', '<cmd>enew<cr>', { desc = "Create a new file", silent = true })

-- SPLIT WINDOWS STUFF
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>si", "<C-w>=", { desc = "balance windows" })
keymap.set("n", "<leader>sc", ":close<CR>", { desc = "close window" })

-- OPEN A NEW TAB
keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "open a new tab" })
keymap.set("n", "<M-t>", "<CMD>tabnew<CR>", { desc = "open a new tab" })
-- CLOSE A TAB
keymap.set({ "n", "i" }, "<A-w>", "<CMD>tabclose<CR>", { desc = "close tab" })

-- MOVE BETWEEN TABS USING ALT AND DOT OR COMMA
keymap.set({ "n", "v", "i" }, "<A-.>", "<cmd>tabn<CR>", { desc = "move to the next tab" })
keymap.set({ "n", "v", "i" }, "<A-,>", "<cmd>tabp<CR>", { desc = "move to the next tab" })

-- MOVE TABS TO THE RIGHT OR LEFT POSITION
keymap.set("n", "<A-S-,>", ":-tabmove<cr>", { desc = "move tab to the left" })
keymap.set("n", "<A-S-.>", ":+tabmove<cr>", { desc = "move tab to the right" })

-- SWITCH TO THE nth TAB USING ALT + NUMBER
keymap.set("n", "<A-1>", "1gt")
keymap.set("n", "<A-2>", "2gt")
keymap.set("n", "<A-3>", "3gt")
keymap.set("n", "<A-4>", "4gt")
keymap.set("n", "<A-5>", "5gt")
keymap.set("n", "<A-6>", "6gt")
keymap.set("n", "<A-7>", "7gt")
keymap.set("n", "<A-8>", "8gt")
keymap.set("n", "<A-9>", "9gt")
keymap.set("n", "<A-0>", "0gt")

-- BORRAR LA PALABRA A LA IZQUIERDA DEL CURSOR CON CTRL+BACKSPACE
keymap.set("i", "<C-BS>", "<C-w>", { desc = "delete word to the left of the cursor" })

-- MOVER LA LINEA ABAJO O ARRIBA USANDO ESPACIO Y j o k
-- USANDO CONTROL + ALT Y j o k (que considero es mas comodo)
keymap.set("n", "<C-M-k>", ":m .-2<CR>==", { desc = "move line up" })
keymap.set("n", "<C-M-j>", ":m .+1<CR>==", { desc = "move line down" })
-- MOVER LA SELECCION DE LINEAS ABAJO O ARRIBA USANDO CONTROL + ALT Y j o k
keymap.set("v", "<C-M-k>", ":m '<-2<CR>gv=gv", { desc = "move selected lines down(v)" })
keymap.set("v", "<C-M-j>", ":m '>+1<CR>gv=gv", { desc = "move selected lines up(v)" })

-- MOVE A WINDOW TO A NEW TAB
keymap.set("n", "<C-M-t>", "<C-w>T", { desc = "move window to a new tab (there must be more than one window)" })
