require "nvchad.mappings"

local M = {}

local function compile_and_run()
  local current_file_directory = vim.fn.expand "%:p:h"
  local file_name = vim.fn.expand "%:t:r"
  local file_name_exe = vim.fn.expand "%:t"
  vim.cmd ":w"
  if vim.bo.filetype == "c" then
    vim.cmd(
      ":split | wincmd < | horizontal resize 12 | terminal"
        .. "!cd "
        .. current_file_directory
        .. " && clang --debug "
        .. file_name_exe
        .. " -o "
        .. file_name
        .. " -lm && "
        .. current_file_directory
        .. "/"
        .. file_name
    )
  elseif vim.bo.filetype == "cpp" then
    vim.cmd(
      ":split | wincmd < | horizontal resize 12 | terminal"
        .. "!cd "
        .. current_file_directory
        .. " && clang++ --debug "
        .. file_name_exe
        .. " -o "
        .. file_name
        .. " && "
        .. current_file_directory
        .. "/"
        .. file_name
    )
  elseif vim.bo.filetype == "python" then
    vim.cmd(
      ":split | wincmd < | horizontal resize 12 | terminal"
        .. "!cd "
        .. current_file_directory
        .. " && python "
        .. file_name_exe
    )
  elseif vim.bo.filetype == "html" then
    vim.cmd(
      ":split | wincmd < | horizontal resize 6 | terminal"
        .. "!cd "
        .. current_file_directory
        .. " && live-server "
        .. file_name_exe
    )
  else
    print "Unsupported file type for compilation and running."
  end
end

-- Key Mappings
local map = vim.keymap.set

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })
map("n", "<leader>mm", "<cmd> Mason<CR>", { desc = "Mason" })

map("n", "<F5>", compile_and_run, { desc = "Compile and run" })

map("n", "<C-d>", "<C-d>zz", { desc = "Downward middle" })
map("n", "<C-u>", "<C-u>zz", { desc = "Upward middle" })

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

-- map("n", "<leader>at", "<cmd> AerialToggle<CR>", { desc = "Aerial Toggle" })
-- map("n", "<leader>an", "<cmd> AerialNext<CR>", { desc = "Aerial next" })
-- map("n", "<leader>ap", "<cmd> AerialPrev<CR>", { desc = "Aerial previous" })

-- map("n", "<leader>tc", function()
--   local current_file_directory = vim.fn.expand "%:p:h"
--   require("nvterm.terminal").send("cd " .. current_file_directory, "horizontal")
--   vim.cmd ":wincmd j"
-- end, { desc = "Toggle terminal to current file's directory" })

-- map("n", "<leader>tp", function()
--     require("telescope").extensions.projects.projects({})
-- end, { desc = "Telescope projects" })
-- map("n", "<leader>tb", function()
--     require("telescope").extensions.file_browser.file_browser({})
-- end, { desc = "Telescope file browser" })

map("n", "<C-x>", function()
  vim.api.nvim_feedkeys('"_dd', "n", false)
end, { desc = "Delete to black hole register" })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start/continue debugger" })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Run DAP Python test" })

-- Custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

return M
