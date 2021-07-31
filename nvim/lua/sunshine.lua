-- Automatic light mode / dark mode switcher
local loop = vim.loop
local cmd = vim.cmd
local stat = require("posix.sys.stat")
local socket = require ("socket")
local gettime = socket.gettime

function LightMode()
    cmd [[colorscheme github]]
end

function DarkMode()
    cmd [[colorscheme github]]
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function ChangeColorScheme(msg)
  print(msg)
  local time = trim(msg)
  if time == "day" then
    return LightMode()
  else
    return DarkMode()
  end
end

function Sunshine()
  if stat["/usr/local/bin/sunshine"] then
    job = loop.spawn('sunshine', {
			args = {'-s', '@36 30'},
			stdio = {nil,stdout,stderr}
		},
		vim.schedule_wrap(function()
		  stdout:read_stop()
		  stderr:read_stop()
		  stdout:close()
		  stderr:close()
		  job:close()
		  setQF()
		end
		)
		)
		loop.read_start(stdout, ChangeColorScheme)
		loop.read_start(stderr, ChangeColorScheme)
  else
    return DarkMode()
  end
end

function AutoDarkModeSetup()
  local function timer(seconds)
    local exp_time = gettime() + seconds
    return function()
       if gettime() < exp_time then return false end
       exp_time = exp_time + seconds
       return true
    end
  end

  local t1 = timer(5) -- a timer that expires every 5 seconds

  while true do
     if t1() then Sunshine() end
  end
end

AutoDarkModeSetup()
