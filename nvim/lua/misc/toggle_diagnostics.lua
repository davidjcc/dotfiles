function ToggleDiagnostics()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    print("Diagnostics disabled")
    vim.diagnostic.disable()
  elseif vim.g.diagnostics_enabled then
    print("Diagnostics disabled")
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  else
    print("Diagnostics enabled")
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end


return {
  toggle = ToggleDiagnostics
}
