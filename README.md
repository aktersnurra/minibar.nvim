# minibar.nvim

A minimalistic winbar.

# Configuration

You can specify which filetypes to ignore and what events to trigger the
winbar on, e.g.:
```lua

  require("minibar").setup {
    ["ignore-filetypes"] = {"help",
                            "startify",
                            "dashboard",
                            "packer",
                            "neogitstatus",
                            "NvimTree",
                            "Trouble",
                            "alpha",
                            "lir",
                            "Outline",
                            "NeogitStatus",
                            "NeogitCommitMessage",
                            "NeogitNotification",
                            "NeogitCommitView",
                            "spectre_panel"}
      ["events"] = {"CursorMoved",
                    "CursorHold",
                    "BufWinEnter",
                    "BufFilePost",
                    "InsertEnter",
                    "BufWritePost",
                    "TabClosed"}
  }
```
