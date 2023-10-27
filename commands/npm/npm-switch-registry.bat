@echo off
chcp 65001 > nul

rem 官方
set npmjs_registry=https://registry.npmjs.org

rem 阿里 其他自行修改
set npmmirror_registry=http://registry.npmmirror.com

echo 📦 npm 镜像源切换工具 [官方与阿里]
echo.

rem 检查 npm 环境
call npm -v > nul

if %errorlevel%==1 (
    echo 😥 npm not found!!
    goto :end
)

call npm config list | findstr /c:"%npmjs_registry%" > nul

if %errorlevel%==0 (
    echo %npmjs_registry% =^> %npmmirror_registry%
    set new_registry=%npmmirror_registry%
) else (
    echo %npmmirror_registry% =^> %npmjs_registry%
    set new_registry=%npmjs_registry%
)

call npm config set registry %new_registry%

if %errorlevel%==0 ( echo 🎉 success!! ) else ( echo 😥 fail!! )

:end
echo.
pause