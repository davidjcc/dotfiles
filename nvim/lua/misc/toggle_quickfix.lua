
function IsOpen()
  local exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      exists = true
    end
  end
  return exists
end

function Toggle()
  if IsOpen() then
    vim.cmd("cclose")
  else
    vim.cmd("copen 30")
  end
end

return {
  is_open = IsOpen,
  toggle = Toggle
}


