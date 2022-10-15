-- Test engine and examples.
-- (c)2022 Tim Menzies <timm@ieee.org> BSD2
local b4 = {}; for k,_ in pairs(_ENV) do b4[k]=k end
local _  = require"101"
local rand,rint,rnd,sort,srand = _.rand, _.rint, _.rnd, _.sort, _.srand
local cli,run,the              = _.cli,  _.run,  _.the

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
the         = cli(the)
local fails = run(the,eg)
for k,v in pairs(_ENV) do if not b4[k] then print("?",k,type(v)) end end 
os.exit(fails)
