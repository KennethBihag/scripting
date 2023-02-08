@setlocal enabledelayedexpansion
@echo off

if not exist .git\ (
    echo Not a git repository
    exit /b 1
)

for /F "tokens=1*" %%d in ('git status -s') do (
    echo %%d %%e
	if %%d==?? (
		if exist %%e (
			if exist %%e\ (
                set f=%%~e
				rmdir /q /s "!f:/=\!"
			) else (
                set f=%%~e
				del /q "!f:/=\!"
			)
		)
	)
)
endlocal