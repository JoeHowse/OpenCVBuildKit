mkdir "build\x86"
cd "build\x86"
CALL "..\..\tbb-2020.3-win\tbb\bin\tbbvars.bat" ia32 vs2019
cmake -DCMAKE_BUILD_TYPE=RELEASE ^
      -DWITH_OPENGL=ON ^
      -DWITH_OPENNI2=ON ^
      -DWITH_TBB=ON ^
      -DOPENCV_EXTRA_MODULES_PATH="../../opencv_contrib/modules" ^
      -DBUILD_EXAMPLES=ON ^
      -DBUILD_opencv_python2=OFF ^
      -DBUILD_opencv_python3=OFF ^
      -G "Visual Studio 16 2019" -A Win32 ^
      "../../opencv" > cmake.log
cd "..\.."
