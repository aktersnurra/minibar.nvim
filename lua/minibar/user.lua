local function setup(user_opts)
  for k, v in pairs(user_opts) do
    require("minibar.opts")[k] = v
  end
  return nil
end
return {setup = setup}
