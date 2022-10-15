package = "101"
version = "v1.0-1"
source = {
   url = "git+http://github.com/burn/101"
}
source = {
   url = "git://github.com/burn/101",
   tag = "v1.0-1",
}
description = {
   summary = "Minimal CLI and test suite example.",
   detailed = [[
     Inspired by DocOpt (but tries to be ten times shorter).
     Parses help text to make table of settings+detaults.  
     Updates those settings from command-line args.  
     One or all test suite items can be called from the command line.  
     Returns to the operating systems the number of test suite failures.
   ]],
   homepage = "https://github.com/burn/101/blob/main/README.md",
   license = "BSD-2"
}
dependencies = {
   "lua >= 5.4"
   -- If you depend on other rocks, add them here
}
build = {
   type = "builtin",
   copy_directories = { "test" },
   modules = {
      ["101"] = "101.lua",
      ["101lib"] = "101lib.lua",
   }
}
