# I see my issues have been fixed, I tested it and it doesn't seem to work
# I see my issues are fixed
- https://github.com/LuaJIT/LuaJIT/issues/869
# I see the corresponding fix is this commit
- https://github.com/LuaJIT/LuaJIT/commit/32984282ddae666b3c94cd27538e1c78b49a1877
# I checked that the code I checked out also contains the fix code
```
  case BC_ITERL:
    if (bc_op(pc[-1]) == BC_JLOOP)
      lj_trace_err(J, LJ_TRERR_LINNER);
    lj_assertJ(bc_op(pc[-1]) == BC_ITERC, "no ITERC before ITERL");
```
# I recompiled luajit, but the problem of the previous issues still occurs, did I make a mistake?