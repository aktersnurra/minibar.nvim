local opts = require("minibar.opts")
local function concat(tbl)
  return table.concat(tbl, ",")
end
local function create_general_table(seq_tbl)
  local tbl = {}
  for _, v in ipairs(seq_tbl) do
    tbl[v] = true
  end
  return tbl
end
local events = opts.events
local ignore_filetypes = opts["ignore-filetypes"]
local function is_empty(arg)
  return ((arg == nil) or (arg == ""))
end
local function get_filetype()
  return vim.bo.filetype
end
local function get_filename()
  return vim.fn.expand("%:t")
end
local function ignore()
  return vim.tbl_contains(ignore_filetypes, get_filetype())
end
local function get_winbar()
  if ((ignore() ~= true) and (is_empty(get_filename()) == false)) then
    print(ignore())
    print(get_filename())
    return vim.api.nvim_set_option_value("winbar", (" " .. "%t%m"), {scope = "local"})
  else
    vim.opt_local.winbar = nil
    return nil
  end
end
local function _2_()
  return get_winbar()
end
return vim.api.nvim_create_autocmd(events, {callback = _2_})
