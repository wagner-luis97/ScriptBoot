for %%i in (a b d e f g h i j k l m n o p q r s t u v w x y z) do (
	if exist "%%i:\Windows" ( 
		bcdboot "%%i:\Windows"
		goto END
	)
)
:END
bcdedit /set {default} description "CURSO Microsoft BI / Microstrategy - CURSOS VERAO 2018"
bcdedit /default {current}
bcdedit /set {current} description "Windows 7"