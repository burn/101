-- Test engine and examples.
-- (c)2022 Tim Menzies <timm@ieee.org> BSD2
local l=require"101"
local rand,rint,rnd,sort,srand = l.rand,l.rint,l.rnd,l.sort,l.srand
local cli,run,the = l.cli,l.run,l.the

-- Test suite.
local eg={}

function eg.the()
  for k,v in pairs(the) do print(k,v) end end

function eg.rand()
  local u={}
  for i=1,5 do u[1+#u] = rnd(rand()) end
  srand()
  for i=1,5 do io.write(".");assert(u[i]== rnd(rand())) end end

function eg.rint()
  local u={}
  for i=1,5 do u[1+#u] = rint(100) end
  srand()
  for i=1,5 do io.write(".");assert(u[i] == rint(100)) end end

-- Start-up
the=cli(the)
if the.go=="nothing" then the.go="all" end
os.exit(run(the, eg))
