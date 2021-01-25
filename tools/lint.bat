@echo off
goto :main

This is a short batch script that makes it easier to work with the python module html-linter,
which lints html files using the Google style guide.

For help on how to download or use this linter, please visit https://pypi.org/project/html-linter/

:main
::Input arguments
set html_linter_path="C:\Users\%USERNAME%\Anaconda3\Scripts\html_lint.py"
set filename="index.html"
set output_folder="output"
set output_filename="lint.txt"
set open_after_completion=true
set disabled_checks=optional_tag,protocol

::
cd ..
if not exist %output_folder% (
	mkdir %output_folder%
)

::Remove any error flags and run linter
set ERRORLEVEL=0
call py %html_linter_path% --disable=%disabled_checks% %filename% > %output_folder%/%output_filename%

::Inform user if errors occured, if everything clear, open the output file
if %errorlevel% EQU 0 (
	echo Successfully linted %filename%!
	if "%open_after_completion%" EQU "true" (
		start notepad++ %output_folder%/%output_filename%
	)
)else (
	echo Encountered an error while linting %filename%!
)
pause
