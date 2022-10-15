-- Test engine and examples.
-- (c)2022 Tim Menzies <timm@ieee.org> BSD2
local l=require"101"
local m=require"101lib"
local rand,rint,rnd,sort,srand = l.rand,l.rint,l.rnd,l.sort,l.srand
local cli,run,the = m.cli,m.run,m.the

-- Test suite.
local go={}

function go.the()
  for k,v in pairs(the) do print(k,v) end end

function go.rand()
  local u={}
  for i=1,5 do u[1+#u] = rnd(rand()) end
  srand()
  for i=1,5 do io.write(".");assert(u[i]== rnd(rand())) end end

function go.rint()
  local u={}
  for i=1,5 do u[1+#u] = rint(100) end
  srand()
  for i=1,5 do io.write(".");assert(u[i] == rint(100)) end end

-- Start-up
the=cli(the)
os.exit(run(the, go))
