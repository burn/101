
# 101
Base example, command line options and test engines

#	101.lua	


| What | Notes |
|:---|:---|
| <b>cli(t:`tab`) &rArr;  t</b> |  alters contents of options in `t` from the  command-line |
| <b>run(t:`tab`, funs:`[fun]`) &rArr;  nfails</b> |  runs all `funs` (or `t.go`), resetting options & seed before each |



#	lib.lua	

## Lists	

| What | Notes |
|:---|:---|
| <b>l.keys(t:`tab`) &rArr;  t</b> |  sort+return `t`'s keys (ignore things with leading `_`) |
| <b>l.sort(t:`tab`,  fun:`fun`) &rArr;  t</b> |  return `t`,  sorted by `fun` (default= `<`) |


## Strings	

| What | Notes |
|:---|:---|
| <b>l.fmt(s:`str`, ...) &rArr;  s</b> |  emulate printf |
| <b>l.col(s:`str`, n:`num`) &rArr; s</b> |  colorize text |


## Maths	
### Random number generator	
The LUA doco says its random number generator is not stable across platforms.	
Hence, we use our own (using Park-Miller).	

| What | Notes |
|:---|:---|
| <b>l.srand(n:`num`) &rArr;  nil</b> |  reset random number seed (defaults to 937162211)  |
| <b>l.rand(nlo:`num`, nhi:`num`) &rArr;  num</b> |  return float from `nlo`..`nhi` (default 0..1) |
| <b>l.rint(nlo:`num`, nhi:`num`) &rArr;  int</b> |  returns integer from `nlo`..`nhi` (default 0..1) |


## Coercion	

| What | Notes |
|:---|:---|
| <b>l.coerce(s:`str`) &rArr;  any</b> |  return int or float or bool or string from `s` |
| <b>l.cli(t:`tab`) &rArr;  t</b> |  alters contents of options in `t` from the  command-line |


