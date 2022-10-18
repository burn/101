
#	4eg.lua	

## Example, CLI and test engines.   	
[![test](https://github.com/burn/101/actions/workflows/test.yml/badge.svg)](https://github.com/burn/101/actions/workflows/test.yml)	
[![license](https://img.shields.io/badge/license-BSD--2-9cf)](LICENSE.md)	
![language](https://img.shields.io/badge/language-lua-yellow)	
![purpose](https://img.shields.io/badge/purpose-teaching-blueviolet)	
     	
(c)2022, Tim Menzies <timm@ieee.org> BSD2 license.<br>	
Yet another demo of "less is more", this code is inspired by DocOpt 	
(but tries to be ten times shorter). 	
   	
> Parses help text to make table of settings+defaults (see example in 101.lua).	
Updates those settings from command-line args.	
Supports a simple test suite (see example in test/eg.lua).	
One or all test suite items can be called from the command line.	
Returns to the operating systems the number of test suite failures.	
 	
For worked demos of this code, see https://tinyurl.com/lua101egs.	
## Make and Update Settings	

| What | Notes |
|:---|:---|
| <b>l.run(t:`tab`, funs:`(fun)+`) &rArr;  nfails</b> |  runs all `funs` (or `t.go`), resetting options & seed before each |
| <b>l.cli(t:`tab`) &rArr;  t</b> |  alters contents of options in `t` from the  command-line |


## General Functions	
### Lists	

| What | Notes |
|:---|:---|
| <b>l.keys(t:`tab`) &rArr;  t</b> |  sort+return `t`'s keys (ignore things with leading `_`) |
| <b>l.sort(t:`tab`,  fun:`fun`) &rArr;  t</b> |  return `t`,  sorted by `fun` (default= `<`) |


### Strings	

| What | Notes |
|:---|:---|
| <b>l.fmt(s:`str`, ...) &rArr;  s</b> |  emulate printf |
| <b>l.col(s:`str`, n:`num`) &rArr; s</b> |  colorize text |


### Maths	
### Random number generator	
The LUA doco says its random number generator is not stable across platforms.	
Hence, we use our own (using Park-Miller).	

| What | Notes |
|:---|:---|
| <b>l.srand(n:`num`) &rArr;  nil</b> |  reset random number seed (defaults to 937162211)  |
| <b>l.rand(nlo:`num`, nhi:`num`) &rArr;  num</b> |  return float from `nlo`..`nhi` (default 0..1) |
| <b>l.rint(nlo:`num`, nhi:`num`) &rArr;  int</b> |  returns integer from `nlo`..`nhi` (default 0..1) |


### Coercion	

| What | Notes |
|:---|:---|
| <b>l.coerce(s:`str`) &rArr;  any</b> |  return int or float or bool or string from `s` |


