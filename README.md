# OpenCVBuildKit

This repository contains recipes for building OpenCV with opencv_contrib and various optimizations.

Currently, the following build targets are supported:

* Windows, 64-bit, Visual Studio 2019
* Windows, 32-bit, Visual Studio 2019


## Building OpenCV on Windows

Ensure that your system has at least 64GB free disk space.

Also, ensure that your system has the following tools installed:

* Git. Ensure that the `git` executable's folder is in your `Path` environment variable.
* CMake. Ensure that the `cmake` executable's folder is in your `Path` environment variable.
* Python
* Visual Studio 2019. The basic Community Edition works fine.

In Command Prompt, clone the repository, including its submodules, by running the following command:

```
> git clone --recursive https://github.com/JoeHowse/OpenCVBuildKit.git
```

In Command Prompt, change directory into the repository's root directory:

```
> cd OpenCVBuildKit
```

Proceed with the following instructions for either a 64-bit build or a 32-bit build.

### 64-bit build

In Command Prompt, run `build_win64_vs2019.bat` (which uses CMake to create an appropriately configured Visual Studio solution for OpenCV):

```
> build_win64_vs2019.bat
```

In your preferred text editor, open the log file, `build\x64\cmake.log`. Review it to ensure that the previous step succeeded.

In Visual Studio 2019, open the solution file, `build\x64\OpenCV.sln`. Build the solution according to the following steps:

1. Select the `Debug`/`x64` build configuration.
2. Build the `CMakeTargets\ALL_BUILD` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
3. Build the `CMakeTargets\INSTALL` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
4. Select the `Release`/`x64` build configuration.
5. Again, build the `CMakeTargets\ALL_BUILD` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
6. Again, build the `CMakeTargets\INSTALL` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.

Edit your `Path` environment variable to add the absolute paths (**IMPORTANT NOTE:** not just the relative paths as shown) to the following folders:

* `tbb-2020.3-win\tbb\bin\intel64\vc14`
* `clBLAS-2.12.0-Windows-x64\bin`
* `clFFT-Full-2.12.2-Windows-x64\bin`
* `build\x64\install\x64\vc16\bin`

In Command Prompt, change directory into the `CMakeTargets\INSTALL` project's output directory:

```
> cd build\x64\install\x64\vc16\bin
```

In Command Prompt, run `opencv_version.exe --opencl` to print information about the OpenCV build and the OpenCL environment:

```
> opencv_version.exe --opencl
```

Review the output from the previous step to ensure that OpenCV has the expected version number and that OpenCV detected the expected OpenCL capabilities.

From here, you can proceed to try the OpenCV example programs in `build\x64\install\x64\vc16\samples`. Note that the examples' source code can be viewed in Visual Studio under the solution's `samples` folder.

### 32-bit build

In Command Prompt, run `build_win32_vs2019.bat` (which uses CMake to create an appropriately configured Visual Studio solution for OpenCV):

```
> build_win32_vs2019.bat
```

In your preferred text editor, open the log file, `build\x86\cmake.log`. Review it to ensure that the previous step succeeded.

In Visual Studio 2019, open the solution file, `build\86\OpenCV.sln`. Build the solution according to the following steps:

1. Select the `Debug`/`Win32` build configuration.
2. Build the `CMakeTargets\ALL_BUILD` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
3. Build the `CMakeTargets\INSTALL` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
4. Select the `Release`/`Win32` build configuration.
5. Again, build the `CMakeTargets\ALL_BUILD` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.
6. Again, build the `CMakeTargets\INSTALL` project (right-click on it and select Build) and watch the Output pane to ensure that the build succeeds.

Edit your `Path` environment variable to add the absolute paths (**IMPORTANT NOTE:** not just the relative paths as shown) to the following folders:

* `tbb-2020.3-win\tbb\bin\ia32\vc14`
* `build\x86\install\x86\vc16\bin`

In Command Prompt, change directory into the `CMakeTargets\INSTALL` project's output directory:

```
> cd build\x86\install\x86\vc16\bin
```

In Command Prompt, run `opencv_version.exe --opencl` to print information about the OpenCV build and the OpenCL environment:

```
> opencv_version.exe --opencl
```

Review the output from the previous step to ensure that OpenCV has the expected version number and that OpenCV detected the expected OpenCL capabilities.

From here, you can proceed to try the OpenCV example programs in `build\x86\install\x86\vc16\samples`. Note that the examples' source code can be viewed in Visual Studio under the solution's `samples` folder. 
