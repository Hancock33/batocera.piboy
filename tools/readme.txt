This directory contains various useful scripts and tools for working
with Buildroot. You need not add this directory in your PATH to use
any of those tools, but you may do so if you want.

get-developpers
    a script to return the list of people interested in a specific part
    of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
    input, a package name or and architecture name.

test-pkg
    a script that tests a specific package against a set of various
    toolchains, with the goal to detect toolchain-related dependencies
    (wchar, threads...)
