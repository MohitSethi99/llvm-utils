@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

SET "EXIST_ON_ERROR=%~1"
SET SUCCESS=0

PUSHD %~dp0

@rem Visual Studio 2013
:TRY_2013
SET VCT_PATH=%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\V120\Platforms
IF EXIST "%VCT_PATH%" GOTO FIND_2013
SET VCT_PATH=%ProgramFiles%\MSBuild\Microsoft.Cpp\v4.0\V120\Platforms
IF EXIST "%VCT_PATH%" GOTO FIND_2013
GOTO VC_NOT_FOUND

:FIND_2013
ECHO VCTargetsPath for Visual Studio 2013: %VCT_PATH%
XCOPY /Q /Y "LLVM" "%VCT_PATH%\..\LLVM\"
XCOPY /Q /Y "LLVM_v120" "%VCT_PATH%\x64\PlatformToolsets\LLVM_v120\"
XCOPY /Q /Y "LLVM_v120_xp" "%VCT_PATH%\x64\PlatformToolsets\LLVM_v120_xp\"
XCOPY /Q /Y "LLVM_v120" "%VCT_PATH%\Win32\PlatformToolsets\LLVM_v120\"
XCOPY /Q /Y "LLVM_v120_xp" "%VCT_PATH%\Win32\PlatformToolsets\LLVM_v120_xp\"
SET SUCCESS=1


:VC_NOT_FOUND
IF %SUCCESS% == 0 (
	ECHO Visual C++ 2013 NOT Installed.
	IF "%EXIST_ON_ERROR%" == "" PAUSE
)

POPD
ENDLOCAL
EXIST /B
