local coerce,options,rand,rint,Seed,srand

local help=[[
Demo: demo of help and test engine 
(c)2022 Tim Menzies <timm@ieee.org> BSD-2

Usage: lua demogo.lua [Options]

Options:
  -h  --help   help test          = false
  -s  --seed   random number seed = 937162211 
  -g  --go     start up action    = nothing]]

Seed=937162211
function srand(n)  --> nil; reset random number seed (defaults to 937162211) 
  Seed = n or 937162211 end

function rand(nlo,nhi) --> num; return float from `nlo`..`nhi` (default 0..1)
  nlo, nhi = nlo or 0, nhi or 1
  Seed = (16807 * Seed) % 2147483647
  return nlo + (nhi-nlo) * Seed / 2147483647 end

function rint(nlo,nhi)  --> int; returns integer from `nlo`..`nhi` (default 0..1)
  return math.floor(0.5 + it.rand(nlo,nhi)) end

function coerce(s) --> any; return int or float or bool or string from `s`
  local function fun(s1)
    if s1=="true"  then return true  end
    if s1=="false" then return false end
    return s1 end
  return math.tointeger(s) or tonumber(s) or fun(s:match"^%s*(.-)%s*$") end

function options(s) --> t;  parse help string to extract a table of options
  local patttern = "\n [-][%S]+[%s]+[-][-]([%S]+)[^\n]+= ([%S]+)"
  local t={}; s:gsub(pattern, function(k,v) t[k]=coerce(v) end)
  t._help = s
  return t end


