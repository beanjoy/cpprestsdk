@echo off

cd /d "%~pd0"

if not exist build  (

  mkdir build
  cd build

  "D:\Program Files (x86)\cmake-3.16.0-rc3-win64-x64\bin\cmake.exe" .. -G "Visual Studio 14 2015 Win64" -DCPPREST_PPLX_IMPL:STRING="winpplx" -DCPPREST_EXCLUDE_COMPRESSION:BOOL="1" -DCMAKE_CONFIGURATION_TYPES:STRING="Debug;Release" -DBoost_USE_STATIC_LIBS:BOOL="1" -DBOOST_INCLUDEDIR:PATH="D:\code\opensource\boost_1_67_0" -DBOOST_LIBRARYDIR:PATH="D:\code\opensource\boost_1_67_0\x64\lib" -DWERROR:BOOL="0" -DBUILD_SAMPLES:BOOL="0" -DBUILD_TESTS:BOOL="0"

) else (
 
  cd build

)


rem %comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"" amd64
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

msbuild cpprestsdk.sln /p:Configuration=Release
msbuild INSTALL.vcxproj /p:Configuration=Release

pause
