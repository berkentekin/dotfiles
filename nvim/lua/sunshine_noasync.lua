-- Automatic light mode / dark mode switcher
local loop = vim.loop
local cmd = vim.cmd
local stat = require('posix.sys.stat')

function LightMode()
  cmd [[colorscheme github]]
  return "day"

end

function DarkMode()
  cmd [[colorscheme dracula]]
  return "night"
end

function ChangeColorScheme(result)
  if result == "day" or result == "day\n" then
    return LightMode()
  else
    return DarkMode()
  end
end

function Sunshine()
  local handle = assert(io.popen('/usr/local/bin/sunshine -s "@36 30"', 'r'))
  local result = handle:read('*all')
  handle:close()
  return ChangeColorScheme(result)
end

return Sunshine()
