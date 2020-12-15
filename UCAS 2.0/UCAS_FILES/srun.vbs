Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c %appdata%\bv_chk.bat"
oShell.Run strArgs, 0, false