@echo off
setlocal

set "shader_dir=%~dp0shaders"
set "validator="

for /f "delims=" %%I in ('where glslangValidator.exe 2^>nul') do if not defined validator set "validator=%%I"

if not defined validator if defined VULKAN_SDK (
    if exist "%VULKAN_SDK%\Bin\glslangValidator.exe" (
        set "validator=%VULKAN_SDK%\Bin\glslangValidator.exe"
    )
)

if not defined validator (
    echo ERROR: glslangValidator.exe was not found.
    echo Install the Vulkan SDK or add its Bin directory to PATH.
    pause
    exit /b 1
)

if not exist "%shader_dir%" (
    echo ERROR: Shader directory was not found: "%shader_dir%"
    pause
    exit /b 1
)

set "shader_count=0"

for /r "%shader_dir%" %%F in (*.vert *.frag *.comp) do call :compile "%%~fF"

if defined shader_compile_failed (
    pause
    exit /b 1
)

if "%shader_count%"=="0" (
    echo No shader files found in "%shader_dir%".
    pause
    exit /b 0
)

echo Done. Compiled %shader_count% shader(s).
pause
exit /b 0

:compile
echo Compiling: %~nx1
"%validator%" -V "%~1" -o "%~1.spv"
if errorlevel 1 (
    echo ERROR: Failed to compile "%~1".
    set "shader_compile_failed=1"
    exit /b 1
)
set /a shader_count+=1
exit /b 0
