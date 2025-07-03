local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- clone if lazy does not exist
if not (vim.uv or vim.loop).fs_stat(path) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", path })
end
vim.opt.rtp:prepend(path)

require("lazy").setup(
  {
    { import = "config.plugins" },
    { import = "config.plugins.lsp" }
  },
  {
    checker = { enabled = true, notify = true },
    change_detections = { notify = true },
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
  }
)
