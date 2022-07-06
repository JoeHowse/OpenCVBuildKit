mkdir "build\x64"
cd "build\x64"
CALL "..\..\tbb-2020.3-win\tbb\bin\tbbvars.bat" intel64 vs2019
cmake -DCMAKE_BUILD_TYPE=RELEASE ^
      -DWITH_OPENGL=ON ^
      -DWITH_OPENNI2=ON ^
      -DWITH_TBB=ON ^
      -DCLAMDBLAS_ROOT_DIR="../../clBLAS-2.12.0-Windows-x64" ^
      -DCLAMDBLAS_INCLUDE_DIR="../../clBLAS-2.12.0-Windows-x64/include" ^
      -DCLAMDBLAS_LIBRARY="../../clBLAS-2.12.0-Windows-x64/lib64/import/clBLAS.lib" ^
      -DCLAMDFFT_ROOT_DIR="../../clFFT-Full-2.12.2-Windows-x64" ^
      -DCLAMDFFT_INCLUDE_DIR="../../clFFT-Full-2.12.2-Windows-x64/include" ^
      -DCLAMDFFT_LIBRARY="../../clFFT-Full-2.12.2-Windows-x64/lib64/import/clFFT.lib" ^
      -DOPENCV_EXTRA_MODULES_PATH="../../opencv_contrib/modules" ^
      -DBUILD_EXAMPLES=ON ^
      -DBUILD_opencv_python2=OFF ^
      -DBUILD_opencv_python3=ON ^
      -G "Visual Studio 16 2019" -A x64 ^
      "../../opencv" > cmake.log
cd "..\.."
