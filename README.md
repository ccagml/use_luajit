# my computer information
- Version Windows 10 Home Chinese
-  Version number 21H1
-  Installation Date ‎2021/‎4/‎24
-  OS Build 19043.1826
-  Experience Windows Feature Experience Pack 120.2212.4180.0

-  Processor Intel(R) Core(TM) i7-10700 CPU @ 2.90GHz 2.90 GHz
-  On-board RAM 16.0 GB (15.7 GB available)
-  System type 64-bit operating system, x64-based processor

# I use the latest branch
- https://github.com/LuaJIT/LuaJIT/commit/5677985dc1f19cf0a67112f4365c7fb79237fa16
- I have reviewed the documentation.
- I have reviewed the Wiki.
- I have searched the issues for an answer to my question. 
- I have searched the web for an answer to my question.



# I use Visual Studio 2012 to compile
```
C:\Program Files (x86)\Microsoft Visual Studio 11.0>cd /d D:\xy\xpsy\LuaJIT\src

D:\xy\xpsy\LuaJIT\src>msvcbuild.bat nogc64

D:\xy\xpsy\LuaJIT\src>cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline host\minilua.c
minilua.c

D:\xy\xpsy\LuaJIT\src>link /nologo /out:minilua.exe minilua.obj

D:\xy\xpsy\LuaJIT\src>if exist minilua.exe.manifest mt /nologo -manifest minilua.exe.manifest -outputresource:minilua.ex
e

D:\xy\xpsy\LuaJIT\src>minilua ..\dynasm\dynasm.lua -LN -D WIN -D JIT -D FFI -o host\buildvm_arch.h vm_x86.dasc

D:\xy\xpsy\LuaJIT\src>cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline
 /arch:SSE2 /DLUAJIT_DISABLE_GC64 /I "." /I ..\dynasm host\buildvm*.c
buildvm.c
buildvm_asm.c
buildvm_fold.c
buildvm_lib.c
buildvm_peobj.c
Generating Code...

D:\xy\xpsy\LuaJIT\src>link /nologo /out:buildvm.exe buildvm*.obj

D:\xy\xpsy\LuaJIT\src>if exist buildvm.exe.manifest mt /nologo -manifest buildvm.exe.manifest -outputresource:buildvm.ex
e

D:\xy\xpsy\LuaJIT\src>buildvm -m peobj -o lj_vm.obj

D:\xy\xpsy\LuaJIT\src>buildvm -m bcdef -o lj_bcdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c l
ib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

D:\xy\xpsy\LuaJIT\src>buildvm -m ffdef -o lj_ffdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c l
ib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

D:\xy\xpsy\LuaJIT\src>buildvm -m libdef -o lj_libdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c
 lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

D:\xy\xpsy\LuaJIT\src>buildvm -m recdef -o lj_recdef.h lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c
 lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

D:\xy\xpsy\LuaJIT\src>buildvm -m vmdef -o jit\vmdef.lua lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.
c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

D:\xy\xpsy\LuaJIT\src>buildvm -m folddef -o lj_folddef.h lj_opt_fold.c

D:\xy\xpsy\LuaJIT\src>cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline
 /arch:SSE2 /DLUAJIT_DISABLE_GC64 /MD /DLUA_BUILD_AS_DLL lj_*.c lib_*.c
lj_alloc.c
lj_api.c
lj_asm.c
lj_assert.c
lj_bc.c
lj_bcread.c
lj_bcwrite.c
lj_buf.c
lj_carith.c
lj_ccall.c
lj_ccallback.c
lj_cconv.c
lj_cdata.c
lj_char.c
lj_clib.c
lj_cparse.c
lj_crecord.c
lj_ctype.c
lj_debug.c
lj_dispatch.c
Generating Code...
Compiling...
lj_err.c
lj_ffrecord.c
lj_func.c
lj_gc.c
lj_gdbjit.c
lj_ir.c
lj_lex.c
lj_lib.c
lj_load.c
lj_mcode.c
lj_meta.c
lj_obj.c
lj_opt_dce.c
lj_opt_fold.c
lj_opt_loop.c
lj_opt_mem.c
lj_opt_narrow.c
lj_opt_sink.c
lj_opt_split.c
lj_parse.c
Generating Code...
Compiling...
lj_prng.c
lj_profile.c
lj_record.c
lj_serialize.c
lj_snap.c
lj_state.c
lj_str.c
lj_strfmt.c
lj_strfmt_num.c
lj_strscan.c
lj_tab.c
lj_trace.c
lj_udata.c
lj_vmevent.c
lj_vmmath.c
lib_aux.c
lib_base.c
lib_bit.c
lib_buffer.c
lib_debug.c
Generating Code...
Compiling...
lib_ffi.c
lib_init.c
lib_io.c
lib_jit.c
lib_math.c
lib_os.c
lib_package.c
lib_string.c
lib_table.c
Generating Code...

D:\xy\xpsy\LuaJIT\src>link /nologo /release /DLL /out:lua51.dll lj_*.obj lib_*.obj
   Creating library lua51.lib and object lua51.exp

D:\xy\xpsy\LuaJIT\src>if exist lua51.dll.manifest mt /nologo -manifest lua51.dll.manifest -outputresource:lua51.dll;2

D:\xy\xpsy\LuaJIT\src>cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline
 /arch:SSE2 /DLUAJIT_DISABLE_GC64 luajit.c
luajit.c

D:\xy\xpsy\LuaJIT\src>link /nologo /release /out:luajit.exe luajit.obj lua51.lib

D:\xy\xpsy\LuaJIT\src>if exist luajit.exe.manifest mt /nologo -manifest luajit.exe.manifest -outputresource:luajit.exe

=== Successfully built LuaJIT for Windows/x86 ===

```

# Information of jit in my program
```
    version_num = 20100
    version = LuaJIT 2.1.0-beta3
    os = Windows
    arch = x86
```

# Current Result
In the apply_status of the file statusd.lua in my project, before putting the value into the target_status table, I have checked whether the status_id already exists in the target_status, but when the program runs many, many times, it sometimes judges Error, I have tried turning off jit.off() and it seems to work, am I doing something wrong?
```
function apply_status(string_rid, apply_id_list)

    if is_int(apply_id_list) then
        apply_id_list = {apply_id_list};
    end

    local status_id;

    local new_status;
    local condition;
    local target_status = temp_save_status[string_rid] or {};
    for k, v in pairs(apply_id_list) do
        if type(v) == "number" then
            status_id = v;
            condition = {};
        else
            status_id = k;
            condition = v;
        end
        condition.status_id = status_id;
        new_status = true;
        for i, info in ipairs(target_status) do
            if info.status_id == status_id then
                new_status = nil;
                break
            end
        end
        if new_status then
            target_status[#target_status + 1] = condition;
        end
    end
    local temp_t = {}
    local have_error
    for i, v in ipairs(target_status) do
        if temp_t[v.status_id] then
            if not apply_err_flag then
                apply_err_flag = 1
                print("I have checked whether it exists before putting it in the target_status, but it seems to have no effect\n");
                have_error = true
            end
        else
            temp_t[v.status_id] = 1;
        end
    end
    temp_save_status[string_rid] = target_status
    if have_error then
        for i, v in ipairs(target_status) do
            print("target_status[", i, "] = " , v.status_id, type(v.status_id))
        end
    end

end

```

# Steps to Reproduce the Issue
- run my project's go_start.bat file

# Expected Result
- After my program is executed many, many times, "I have checked whether it exists before putting it in the target_status, but it seems to have no effect\n" does not appear

# my program address
- https://github.com/ccagml/use_luajit.git
- Click go_start.bat in windows to execute

I'm trying to trim my redundant code, but the problem is a bit strange, can you help me see the problem? thank you very much!