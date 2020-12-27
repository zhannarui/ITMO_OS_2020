@echo off 
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097512 copy @path C:\IEWIN7\temp /Z /Y"