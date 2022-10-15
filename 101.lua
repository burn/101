-- # Example, CLI and test engines.
-- (c)2022, Tim Menzies <timm@ieee.org> BSD2 license.
-- Parses help text string to make table of settings+detaults.  
-- Updates those settings from command-line args.  
-- One or all test suite items can be called from the command line.  
-- Returns to the operating systems the number of test suite failures.

local l=require"101lib"
local coerce,col,fmt,keys = l.coerce,l.col,l.fmt,l.keys
local rand,rint,srand     = l.rand, l.rint, l.srand
local cli,options,run

local the,help = {},[[
Demo: demo of help and test engine 
(c)2022 Tim Menzies <timm@ieee.org> BSD2

Usage: lua demogo.lua [Options]

Options:
 -h  --help  help test          = false
 -s  --seed  random number seed = 937162211
 -g  --go    start up action    = nothing]]

help:gsub("\n [-][%S]+[%s]+[-][-]([%S]+)[^\n]+= ([%S]+)",
          function(k,v) the[k]=coerce(v) end)
the._help = help

function cli(t) --> t; alters contents of options in `t` from the  command-line
  for k,v in pairs(t) do
    local v=tostring(v)
    for n,x in ipairs(arg) do
      if x=="-"..(k:sub(1,1)) or x=="--"..k then
         v = v=="false" and "true" or v=="true" and "false" or arg[n+1] end end
    t[k] = l.coerce(v) end
  if t.help then os.exit(print(t._help
        :gsub("([-][%S]+)",          function(s)   return col(s,33) end) 
        :gsub("(\n? ?)([A-Z][%S]+)", function(b,s) return b..col(s,36) end),"")) end
  return t end

function run(t,funs) --> nfails; runs all `funs` (or `t.go`), resetting options & seed before each
  local fails,defaults = 0,{}
  for k,v in pairs(t) do defaults[k]=v end  -- cache the old values
  for _,k in pairs(keys(funs)) do        -- for all functions
      if t.go == "all" or t.go==k then      -- or run a function(s)
        for k,v in pairs(defaults) do t[k]=v end -- rest to the cache
        srand(t.seed or 937162211)            -- reset the random number seed
        if funs[k]() == false                    -- run a function
        then print(fmt("# ❌❌❌ %s",k))
             fails=fails+1                              -- record failure
        else print(fmt("# ✅✅✅ %s",k)) end end end -- record success
   return fails end

return {the=the, cli=cli, run=run}
