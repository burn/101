local l=require"lib"
local m=require"101"
local rand,rint,rnd,sort,srand = l.rand,l.rint,l.rnd,l.sort,l.srand
local cli,run,the = m.cli,m.run,m.the
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
run(the, go)
