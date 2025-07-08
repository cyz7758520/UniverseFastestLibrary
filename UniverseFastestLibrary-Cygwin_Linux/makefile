#解决方案名称
SltnName = UniverseFastestLibrary
SltnUpperName = UNIVERSEFASTESTLIBRARY

#指定Shell程序
SHELL := /bin/bash

#多线程编译
MtThrdCmpil = -j$(shell grep -c processor /proc/cpuinfo)

#编译命令
CCmpil = gcc
CppCmpil = g++
AsmCmpil = g++
LibCmpil = ar
DllCmpil = g++
ExeCmpil = g++

#源文件
CommonProjFileList = UniverseFastestLibrary.o
CygwinX64ProjFileList = $(CommonProjFileList) MemCpy_CygwinGCC_x64.o MutexLock_CygwinGCC_x64.o
LinuxX64ProjFileList = $(CommonProjFileList) MemCpy_LinuxGCC_x64.o MutexLock_LinuxGCC_x64.o

#构建选项
CommonCFlag = -c -fPIC -pipe -fvisibility=hidden -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -finput-charset=UTF-8 -fexec-charset=UTF-8 -D__STDINT_LIMITS -DHAVE_INTTYPES_H -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -D__LARGE64_FILES -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
CommonCppFlag = -std=gnu++17
CommonAsmFlag = -c -fPIC
CygwinCFlag = $(CommonCFlag) -D__CYGWIN__ -DUNICODE
CygwinCppFlag = $(CygwinCFlag) $(CommonCppFlag)
CygwinAsmFlag = $(CommonAsmFlag)
LinuxCFlag = $(CommonCFlag)
LinuxCppFlag = $(LinuxCFlag) $(CommonCppFlag)
LinuxAsmFlag = $(CommonAsmFlag)

#目标平台
x64 = -m64
avx2 = -mavx2 -mfma

#优化选项，不能使用-O2、-O3、-flto，因为gcc用O2或O3会导致运算错误，clang用lto会导致编译错误
CommonDebug = -fstack-protector-all -g2
CommonRelease = -fno-stack-protector
CygwinDebug = $(CommonDebug)
CygwinRelease = $(CommonRelease) -O1
LinuxDebug = $(CommonDebug)
LinuxRelease = $(CommonRelease) -O1

#链接选项
CommonLNK = -Wl,-O1 -Wl,-gc-sections -Wl,-hash-style=gnu -Wl,-as-needed -pthread -lm -ldl
CommonLNKLIB = $(CommonLNK) -static
CommonLNKDLL = $(CommonLNK)
CygwinLNK = -l:libgdi32.a -l:libwinmm.a -l:libole32.a
CygwinLNKLIB = $(CommonLNKLIB) $(CygwinLNK)
CygwinLNKDLL = $(CommonLNKDLL) $(CygwinLNK)
LinuxLNK = 
LinuxLNKLIB = $(CommonLNKLIB) $(LinuxLNK)
LinuxLNKDLL = $(CommonLNKDLL) $(LinuxLNK)

#生成选项
CommonCOMLIB = -rsv
CommonCOMDLL = -shared -fPIC
CommonCOMEXE = 
CygwinCOMLIB = $(CommonCOMLIB)
CygwinCOMDLL = $(CommonCOMDLL)
CygwinCOMEXE = $(CommonCOMEXE)
LinuxCOMLIB = $(CommonCOMLIB)
LinuxCOMDLL = $(CommonCOMDLL)
LinuxCOMEXE = $(CommonCOMEXE)

#头文件
Include = -I/usr/include/w32api -I../../Source/$(SltnName)

#构建项目
CygwinGCC_x64: CygwinGCC_x64_Debug_LNKLIB_LIB.a CygwinGCC_x64_Release_LNKLIB_LIB.a CygwinGCC_x64_Debug_LNKDLL_DLL.so CygwinGCC_x64_Release_LNKDLL_DLL.so

LinuxGCC_x64: LinuxGCC_x64_Debug_LNKLIB_LIB.a LinuxGCC_x64_Release_LNKLIB_LIB.a LinuxGCC_x64_Debug_LNKDLL_DLL.so LinuxGCC_x64_Release_LNKDLL_DLL.so

MakeFileRule:
	if [ ! -d ".$@" ]; then mkdir .$@; fi
	cd .$@ && \
	SrcFileList=`find ../../Source/$(SltnName) -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.cxx"` && \
	ObjFileList=$${SrcFileList//..\/..\/Source\/$(SltnName)\//} && \
	ObjFileList=$${ObjFileList//.cpp/.o} && \
	ObjFileList=$${ObjFileList//.cc/.o} && \
	ObjFileList=$${ObjFileList//.c/.o} && \
	echo $$ObjFileList && \
	$(CCmpil) $(CygwinCFlag) $(x64) $(CygwinRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__ -D__COMEXE__ -MM $$SrcFileList

MemCpy_CygwinGCC_x64.o: ../../Source/UniverseFastestLibrary/MemCpy_CygwinGCC_x64.s
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

MemCpy_LinuxGCC_x64.o: ../../Source/UniverseFastestLibrary/MemCpy_LinuxGCC_x64.s
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

MutexLock_CygwinGCC_x64.o: ../../Source/UniverseFastestLibrary/MutexLock_CygwinGCC_x64.s
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

MutexLock_LinuxGCC_x64.o: ../../Source/UniverseFastestLibrary/MutexLock_LinuxGCC_x64.s
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

UniverseFastestLibrary.o: \
 ../../Source/UniverseFastestLibrary/UniverseFastestLibrary.cpp \
 ../../Source/UniverseFastestLibrary/UniverseFastestLibrary.h \
 ../../Source/UniverseFastestLibrary/MemCpy.h \
 ../../Source/UniverseFastestLibrary/MutexLock.h
	$(eval Cmpil := $(shell if [ "$(suffix $<)" == ".c" ]; then echo "$(C) -o $@ $<"; elif [ "$(suffix $<)" == ".cc" ] || [ "$(suffix $<)" == ".cpp" ] || [ "$(suffix $<)" == ".cxx" ]; then echo "$(CPP) -o $@ $<"; else echo "$(ASM) -o $@ $<"; fi ))
	$(Cmpil)

CygwinGCC_x64_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(CygwinDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(CygwinDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag) $(Include)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CygwinX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(CygwinRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(CygwinRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag) $(Include)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CygwinX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(CygwinDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(CygwinDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag) $(Include)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CygwinX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

CygwinGCC_x64_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := CygwinGCC_x64_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := CygwinGCC_x64_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(CygwinCFlag) $(x64) $(CygwinRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" \
	"CPP=$(CppCmpil) $(CygwinCppFlag) $(x64) $(CygwinRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__CYGWIN_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" \
	"ASM=$(AsmCmpil) $(CygwinAsmFlag) $(Include)" \
	"LNKLIB=$(CygwinLNKLIB)" \
	"LNKDLL=$(CygwinLNKDLL)" \
	"COMLIB=$(CygwinCOMLIB)" \
	"COMDLL=$(CygwinCOMDLL)" \
	"COMEXE=$(CygwinCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(CygwinX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Debug_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Debug_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Debug_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(LinuxDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(LinuxDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKLIB__ -D__COMLIB__" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag) $(Include)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(LinuxX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Release_LNKLIB_LIB.a:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Release_LNKLIB_LIB.a)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Release_LNKLIB_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(LinuxRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(LinuxRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKLIB__ -D__COMLIB__" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag) $(Include)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKLIBCOMLIB=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(LinuxX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Debug_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Debug_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Debug_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(LinuxDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(LinuxDebug) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__DEBUG__ -D__LNKDLL__ -D__COMDLL__" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag) $(Include)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(LinuxX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

LinuxGCC_x64_Release_LNKDLL_DLL.so:
	$(eval ProjNameLibSufx := LinuxGCC_x64_Release_LNKDLL_DLL.so)
	$(eval ProjNameExeSufx := LinuxGCC_x64_Release_LNKDLL_EXE.exe)
	if [ ! -d ".$(ProjNameLibSufx)" ]; then mkdir .$(ProjNameLibSufx); fi
	cd .$(ProjNameLibSufx) && \
	make \
	-f ../makefile \
	$(MtThrdCmpil) \
	"C=$(CCmpil) $(LinuxCFlag) $(x64) $(LinuxRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" \
	"CPP=$(CppCmpil) $(LinuxCppFlag) $(x64) $(LinuxRelease) $(Include) -D__NAME_$(SltnUpperName)__ -D__LINUX_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__" \
	"ASM=$(AsmCmpil) $(LinuxAsmFlag) $(Include)" \
	"LNKLIB=$(LinuxLNKLIB)" \
	"LNKDLL=$(LinuxLNKDLL)" \
	"COMLIB=$(LinuxCOMLIB)" \
	"COMDLL=$(LinuxCOMDLL)" \
	"COMEXE=$(LinuxCOMEXE)" \
	"ProjNameLNKDLLCOMDLL=$(SltnName)_$(ProjNameLibSufx)" \
	"ProjNameLibSufx=$(ProjNameLibSufx)" \
	"ProjNameExeSufx=$(ProjNameExeSufx)" \
	"ProjFileList=$(LinuxX64ProjFileList)" \
	$(SltnName)_$(ProjNameLibSufx)

$(ProjNameLNKLIBCOMLIB): $(ProjFileList)
	$(LibCmpil) -o $(ProjNameLNKLIBCOMLIB) $^ $(COMLIB)
	mv $(ProjNameLNKLIBCOMLIB) ../../$(SltnName)/$(ProjNameLNKLIBCOMLIB)

$(ProjNameLNKDLLCOMDLL): $(ProjFileList)
	$(DllCmpil) -o $(ProjNameLNKDLLCOMDLL) $^ $(LNKDLL) $(COMDLL)
	mv $(ProjNameLNKDLLCOMDLL) ../../$(SltnName)/$(ProjNameLNKDLLCOMDLL)

$(ProjNameLNKLIBCOMEXE): $(ProjFileList)
	$(ExeCmpil) -o $(ProjNameLNKLIBCOMEXE) $^ $(LNKLIB) $(COMEXE)
	mv $(ProjNameLNKLIBCOMEXE) ../../$(SltnName)/$(ProjNameLNKLIBCOMEXE)

$(ProjNameLNKDLLCOMEXE): $(ProjFileList)
	$(ExeCmpil) -o $(ProjNameLNKDLLCOMEXE) $^ $(LNKDLL) $(COMEXE)
	mv $(ProjNameLNKDLLCOMEXE) ../../$(SltnName)/$(ProjNameLNKDLLCOMEXE)

#不要将mv命令改为cp命令，因为这样每次编译都可以重新生成文件，防止依赖的静态库已经更新但不重新生成文件，防止静态库的有些目标文件已经删除但静态库里却没删除。

clean:
	if [[ $$OSTYPE == *cygwin* ]]; then \
		rm -f .Cygwin*/*.o .Cygwin*/*.o.tmp .Cygwin*/*.lis .Cygwin*/*.a .Cygwin*/*.so .Cygwin*/.*.exe; \
	else \
		rm -f .Linux*/*.o .Linux*/*.o.tmp .Linux*/*.lis .Linux*/*.a .Linux*/*.so .Linux*/.*.exe; \
	fi