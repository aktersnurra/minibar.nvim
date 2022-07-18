local function _1_(t, k)
  local _2_ = k
  if (_2_ == "setup") then
    return (require("minibar.user")).setup
  elseif (_2_ == "opts") then
    return require("minibar.opts")
  else
    return nil
  end
end
return setmetatable({}, {__index = _1_})
