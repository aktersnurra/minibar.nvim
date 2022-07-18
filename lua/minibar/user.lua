local function setup(user_opts)
  for k, v in pairs(user_opts) do
    require("minibar.opts")[k] = v
  end
  return require("minibar.main")
end
return {setup = setup}
