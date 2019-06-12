set directory=C:\Windows\Temp
for /f %%i in (funcao.txt) do (
	IF EXIST "C:\Windows\VHDs\Selenium.vhd" (
		xcopy %directory%\Setup_VHD.bat \\%%i\C$\Windows\Temp /c /y
		xcopy %directory%\Setup_BCD.bat \\%%i\C$\Windows\Temp /c /y
		xcopy %directory%\DiskpartConfig.txt \\%%i\C$\Windows\Temp /c /y
		xcopy %directory%\bcd.bat \\%%i\C$\Windows\Temp /c /y
		psexec.exe \\%%i "C:\Windows\Temp\Setup_VHD.bat"
	) ELSE (
		echo %%i >> erros.txt
	)
	echo %%i
)
for /f %%i in (funcao.txt) do (
	psexec.exe \\%%i "C:\Windows\Temp\Setup_BCD.bat"
	echo %%i
)
