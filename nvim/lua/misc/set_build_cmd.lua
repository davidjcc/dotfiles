return {
  set_build_cmd = function(value)
    local cmd = value.args
    print(cmd)
    if vim.g.build_cmd == nil then
      vim.g.build_cmd = cmd
    else
      print("Overriding build cmd " .. vim.g.build_cmd)
      vim.g.build_cmd = cmd
    end
  end,

  execute_build_cmd = function()
    if vim.g.build_cmd == nil then
      vim.g.build_cmd = 'Make'
      print("No build command set, using default 'Make'")
      vim.cmd("Make")
      return
    end

    print("Executing cmd " .. vim.g.build_cmd)
    vim.cmd(vim.g.build_cmd)
  end
}
