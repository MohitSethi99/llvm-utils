@ECHO OFF

SETLOCAL ENABLEEXTENSIONS
CD /D %~dp0


ECHO Visual Studio 2017 and 2019
@RD /Q /S LLVM_VS2017
XCOPY /Q /S /Y ..\VS2017                   LLVM_VS2017\
CALL :SUB_MAKE_ZIP LLVM_VS2017
@RD /Q /S LLVM_VS2017


ECHO Visual Studio 2010 to 2015
@RD /Q /S LLVM_VS2010_2015
XCOPY /Q /Y ..\VS2017\LLVM                 LLVM_VS2010_2015\LLVM\
XCOPY /Q /S /Y ..\VS2015                   LLVM_VS2010_2015\
XCOPY /Q /Y install_VS2010_2015.bat        LLVM_VS2010_2015\install.bat*
CALL :SUB_MAKE_ZIP LLVM_VS2010_2015
@RD /Q /S LLVM_VS2010_2015


ECHO Visual Studio 2015
@RD /Q /S LLVM_VS2015
XCOPY /Q /Y ..\VS2017\LLVM              LLVM_VS2015\LLVM\
XCOPY /Q /Y ..\VS2015\LLVM_v140         LLVM_VS2015\LLVM_v140\
XCOPY /Q /Y ..\VS2015\LLVM_v140_xp      LLVM_VS2015\LLVM_v140_xp\
XCOPY /Q /Y install_VS2015.bat          LLVM_VS2015\install.bat*
CALL :SUB_MAKE_ZIP LLVM_VS2015
@RD /Q /S LLVM_VS2015


ECHO Visual Studio 2013
@RD /Q /S LLVM_VS2013
XCOPY /Q /Y ..\VS2017\LLVM              LLVM_VS2013\LLVM\
XCOPY /Q /Y ..\VS2015\LLVM_v120         LLVM_VS2013\LLVM_v120\
XCOPY /Q /Y ..\VS2015\LLVM_v120_xp      LLVM_VS2013\LLVM_v120_xp\
XCOPY /Q /Y install_VS2013.bat          LLVM_VS2013\install.bat*
CALL :SUB_MAKE_ZIP LLVM_VS2013
@RD /Q /S LLVM_VS2013


ECHO Visual Studio 2012
@RD /Q /S LLVM_VS2012
XCOPY /Q /Y ..\VS2017\LLVM                  LLVM_VS2012\LLVM\
XCOPY /Q /Y ..\VS2015\x64\LLVM_v110         LLVM_VS2012\x64\LLVM_v110\
XCOPY /Q /Y ..\VS2015\x64\LLVM_v110_xp      LLVM_VS2012\x64\LLVM_v110_xp\
XCOPY /Q /Y ..\VS2015\Win32\LLVM_v110       LLVM_VS2012\Win32\LLVM_v110\
XCOPY /Q /Y ..\VS2015\Win32\LLVM_v110_xp    LLVM_VS2012\Win32\LLVM_v110_xp\
XCOPY /Q /Y install_VS2012.bat              LLVM_VS2012\install.bat*
CALL :SUB_MAKE_ZIP LLVM_VS2012
@RD /Q /S LLVM_VS2012


ECHO Visual Studio 2010
@RD /Q /S LLVM_VS2010
XCOPY /Q /Y ..\VS2017\LLVM                  LLVM_VS2010\LLVM\
XCOPY /Q /Y ..\VS2015\x64\LLVM_v100         LLVM_VS2010\x64\LLVM_v100\
XCOPY /Q /Y ..\VS2015\x64\LLVM_v90          LLVM_VS2010\x64\LLVM_v90\
XCOPY /Q /Y ..\VS2015\Win32\LLVM_v100       LLVM_VS2010\Win32\LLVM_v100\
XCOPY /Q /Y ..\VS2015\Win32\LLVM_v90        LLVM_VS2010\Win32\LLVM_v90\
XCOPY /Q /Y install_VS2010.bat              LLVM_VS2010\install.bat*
CALL :SUB_MAKE_ZIP LLVM_VS2010
@RD /Q /S LLVM_VS2010

EXIT /B

:SUB_MAKE_ZIP
7z a -tzip -mx9 "%~1.zip" "%~1" >NUL
ENDLOCAL
EXIT /B
