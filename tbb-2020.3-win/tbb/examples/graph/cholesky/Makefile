# Copyright (c) 2005-2020 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Common Makefile that builds and runs example.

# Just specify your program basename
PROG=Cholesky
ARGS=4 2

# Trying to find if icl.exe is set
CXX1 = $(TBB_CXX)-
CXX2 = $(CXX1:icl.exe-=icl.exe)
CXX  = $(CXX2:-=cl.exe)

# The C++ compiler options
MYCXXFLAGS = /TP /EHsc /W3 /nologo /D _CONSOLE /D _MBCS /D WIN32 /D _WIN32_WINNT=0x0501 $(CXXFLAGS)
MYLDFLAGS = /INCREMENTAL:NO /NOLOGO /DEBUG /FIXED:NO $(LDFLAGS)

# MKL support
MKL_LIBS1 = $(TBB_TARGET_ARCH)
MKL_LIBS2 = $(MKL_LIBS1:ia32=mkl_core.lib mkl_sequential.lib mkl_intel_c.lib)
MKL_LIBS  = $(MKL_LIBS2:intel64=mkl_core.lib mkl_sequential.lib mkl_intel_lp64.lib)

all: release test
release: compiler_check
	$(CXX) *.cpp /MD /O2 /D NDEBUG $(MYCXXFLAGS) /link tbb.lib $(MKL_LIBS) $(LIBS) $(MYLDFLAGS) /OUT:$(PROG).exe
debug: compiler_check
	$(CXX) *.cpp /MDd /Od /Zi /D TBB_USE_DEBUG /D _DEBUG $(MYCXXFLAGS) /link tbb_debug.lib $(MKL_LIBS) $(LIBS) $(MYLDFLAGS) /OUT:$(PROG).exe
profile: compiler_check
	$(CXX) *.cpp /MD /O2 /Zi /D NDEBUG $(MYCXXFLAGS) /D TBB_USE_THREADING_TOOLS /link tbb.lib $(MKL_LIBS) $(LIBS) $(MYLDFLAGS) /OUT:$(PROG).exe
clean:
	@cmd.exe /C del $(PROG).exe *.obj *.?db *.manifest
test:
	$(PROG) $(ARGS)
compiler_check:
	@echo compiler_test>compiler_test && @$(CXX) /E compiler_test >nul 2>&1  || echo "$(CXX) command not found. Check if CXX=$(CXX) is set properly"
	@cmd.exe /C del compiler_test
