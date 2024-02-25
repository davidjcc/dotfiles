

function merge_config(config_a, config_b)
  local new_config = config_a
  for key, value in pairs(config_a) do
    new_config[key] = value
  end

  return new_config
end
