-- Misc LUA routines.
-- (c)2022, Tim Menzies <timm@ieee.org> BSD2 license.
local l={}

-- ## Lists
function l.keys(t) --> t; sort+return `t`'s keys (ignore things with leading `_`)
  local function want(k,x) if tostring(k):sub(1,1) ~= "_" then return k end end
  local u={}; for k,v in pairs(t) do if want(k) then u[1+#u] = k end end
  return l.sort(u) end

function l.sort(t, fun) --> t; return `t`,  sorted by `fun` (default= `<`)
  table.sort(t,fun); return t end

-- ## Strings
function l.fmt(s,...) --> s; emulate printf
  return string.format(s,...) end

function l.col(s,n) -->s; colorize text
  return l.fmt("\27[1m\27[%sm%s\27[0m",n,s) end

-- ## Maths
function l.rnd(n, nPlaces) --> num. return `n` rounded to `nPlaces`
  local mult = 10^(nPlaces or 3)
  return math.floor(n * mult + 0.5) / mult end

-- ### Random number generator
-- The LUA doco says its random number generator is not stable across platforms.
-- Hence, we use our own (using Park-Miller).

l.Seed=937162211
function l.srand(n)  --> nil; reset random number seed (defaults to 937162211) 
  Seed = n or 937162211 end

function l.rand(nlo,nhi) --> num; return float from `nlo`..`nhi` (default 0..1)
  nlo, nhi = nlo or 0, nhi or 1
  Seed = (16807 * Seed) % 2147483647
  return nlo + (nhi-nlo) * Seed / 2147483647 end

function l.rint(nlo,nhi)  --> int; returns integer from `nlo`..`nhi` (default 0..1)
  return math.floor(0.5 + l.rand(nlo,nhi)) end

-- ## Coercion
function l.coerce(s) --> any; return int or float or bool or string from `s`
  local function fun(s1)
    if s1=="true"  then return true  end
    if s1=="false" then return false end
    return s1 end
  return math.tointeger(s) or tonumber(s) or fun(s:match"^%s*(.-)%s*$") end

function l.cli(t) --> t; alters contents of options in `t` from the  command-line
  for k,v in pairs(t) do
    local v = tostring(v)
    for n,x in ipairs(arg) do
      if x=="-"..(k:sub(1,1)) or x=="--"..k then
         v = v=="false" and "true" or v=="true" and "false" or arg[n+1] end end
    t[k] = l.coerce(v) end
  if t.help then os.exit(print(t._help)) end
  return t end

return l
