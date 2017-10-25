REM This file converts markdown files to HTML. 
REM Converting a subdirectory - just slap it on front

if not exist "html" mkdir html

if "%1"=="" GOTO curdir

echo Processing %1

if not exist "html/%1" mkdir "html/%1"
if not exist "html\pandoc.css" copy "%~dp0pandoc.css" "html\%1\pandoc.css"

for %%i in (%1/*.markdown) do pandoc --toc -c pandoc.css -f markdown -t html5 %1/%%~ni.markdown > html/%1/%%~ni.html
for %%i in (%1/*.md) do pandoc --toc -c pandoc.css -f markdown -t html5 %1/%%~ni.md > html/%1/%%~ni.html

GOTO finish

:curdir
echo Processing current directory
if not exist "html\pandoc.css" copy "%~dp0pandoc.css" "html\pandoc.css"
for %%i in (*.markdown) do pandoc --toc -c pandoc.css -f markdown -t html5 %%~ni.markdown > html/%%~ni.html
for %%i in (*.md) do pandoc --toc -c pandoc.css -f markdown -t html5 %%~ni.md > html/%%~ni.html

:finish

echo Processing complete