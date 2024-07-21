#SingleInstance Ignore
#Include "lib\Dark_MsgBox_v2.ahk"
#Include "lib\Gdip_All.ahk"
#Include "lib\github.ahk"
pToken := Gdip_Startup()
#Warn All, Off
A_TrayMenu.Delete()

SetTitleMatchMode 2

; <for compiled scripts>
;@Ahk2Exe-SetFileVersion 1.1.0
;@Ahk2Exe-SetDescription Notificador de Conexión
; </for compiled scripts>


global Version := "v1.1.0"
global IniciarConWindows := 0
global DarkMode := 0
global ActIni := 1
global AbrirWebAlConectarse := 0
global WebAlConectarse := "https://www.google.com/"

global AbrirWebAlDesconocer := 0
global WebAlDesconocer := "https://www.cubadebate.cu/"

global AbrirWebAlDesconectarse := 0
global WebAlDesconectarse := "https://secure.etecsa.net:8443/"

global AbrirWebAlError := 0
global WebAlError := "http://192.168.1.1/"
	
global WebOption := 0

global HwndMyTextInfoWeb := 0
global HwndMyTextInfo := 0
global HwndTextPopupV := 0
global VerificarConxCada := 5
global VerificarConx := 2
global VerificarPingCada := 1
global NotiConectado := 1
global NotiNacional := 0
global NotiDesconectado := 1
global NotiError := 0
global WebConectado := 1
global WebDesconocido := 1
global WebDesconectado := 1
global SoundConectado := "none"
global SoundNacional := "none"
global SoundDesconectado := "none"
global SoundError := "none"
global EditConectado := "google.com"
global EditNacional := "cubadebate.cu"
global EditDesconectado := "secure.etecsa.net"
	

global EditUser1 := ""
global EditPassword1 := ""
global EditUser2 := ""
global EditPassword2 := ""

global DataPers := 0
global EditDataPers := "username=usuario&password=contraseña"
global EditPageLogin := "https://secure.etecsa.net:8443//LoginServlet"
global CuentaOn := 0

global WebOffAccount := 0
global EditWebOffAccount := "http://2.2.2.2/"

global IniFileReadTime := 0
global EditIniFileReadTime := "ftp://usuario:contraseña@ip/archivo"

global Temporizador := 0
global TemporizadorH := 0
global TemporizadorM := 0
global TemporizadorS := 0
global TemporizadorNotiIcon := 0
global TemporizadorNotiTooltip := 0
global TemporizadorNotiWindows := 0
global NotiGifError := 0 
global NotiGifDesconectado := 0
global NotiGifNacional := 0
global NotiGifConectado := 0

global NotiNormal := 1


global ConectadoGif := 1
global DesconocidoGif := 0
global DesconectadoGif := 0
global ErrorGif := 0

global PosVGif1:=0
global TamanodelGif1:=0
global AnchoGif1:=0
global LargoGif1:=0
global RelacionGif1:=0
global EfectoEntradaGif1:=1
global UpDownEfectoEntradaGif1:=1000
global UpDownTiempoEntradaGif1:=2
global EfectoSalidaGif1:=1
global UpDownEfectoSalidaGif1:=1000
global GifSelected1:=1
global GifSelectedText1:=""
global VoltearEntradaGif1:=0
global VoltearSalidaGif1:=0
global BarradeTareasGif1 := 0

global PosVGif2:=0
global TamanodelGif2:=0
global AnchoGif2:=0
global LargoGif2:=0
global RelacionGif2:=0
global EfectoEntradaGif2:=1
global UpDownEfectoEntradaGif2:=1000
global UpDownTiempoEntradaGif2:=2
global EfectoSalidaGif2:=1
global UpDownEfectoSalidaGif2:=1000
global GifSelected2:=1
global GifSelectedText2:=""
global VoltearEntradaGif2:=0
global VoltearSalidaGif2:=0
global BarradeTareasGif2 := 0

global PosVGif3:=0
global TamanodelGif3:=0
global AnchoGif3:=0
global LargoGif3:=0
global RelacionGif3:=0
global EfectoEntradaGif3:=1
global UpDownEfectoEntradaGif3:=1000
global UpDownTiempoEntradaGif3:=2
global EfectoSalidaGif3:=1
global UpDownEfectoSalidaGif3:=1000
global GifSelected3:=1
global GifSelectedText3:=""
global VoltearEntradaGif3:=0
global VoltearSalidaGif3:=0
global BarradeTareasGif3 := 0

global PosVGif4:=0
global TamanodelGif4:=0
global AnchoGif4:=0
global LargoGif4:=0
global RelacionGif4:=0
global EfectoEntradaGif4:=1
global UpDownEfectoEntradaGif4:=1000
global UpDownTiempoEntradaGif4:=2
global EfectoSalidaGif4:=1
global UpDownEfectoSalidaGif4:=1000
global GifSelected4:=1
global GifSelectedText4:=""
global VoltearEntradaGif4:=0
global VoltearSalidaGif4:=0
global BarradeTareasGif4:= 0

global Prueba := 0

global UsarSegundaCuenta := 0

global LenguajeText:=""
global LenguajeList
global actininorepeat := 0


if FileExist("options.ini")
{
	Text := IniRead("options.ini", "settings")
	Loop parse, Text, "`n"
	{
		ArrayText := StrSplit(A_LoopField, "=",, 2)
		switch ArrayText[1]
		{
			case "IniciarConWindows", "DarkMode", "AbrirWebAlConectarse", "AbrirWebAlDesconocer", "AbrirWebAlDesconectarse", "AbrirWebAlError", "WebOption", "NotiConectado", "NotiNacional", "NotiDesconectado", "NotiError", "DataPers", "CuentaOn", "WebOffAccount", "IniFileReadTime", "WebConectado", "WebDesconocido", "WebDesconectado", "TemporizadorNotiTooltip", "TemporizadorNotiIcon":
			{
				if (ArrayText[2] = 0 or ArrayText[2] = 1)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
	
			}
			case "TemporizadorNotiWindows", "NotiGifError", "NotiGifDesconectado", "NotiGifNacional", "NotiGifConectado", "NotiNormal", "ConectadoGif", "DesconocidoGif", "DesconectadoGif", "ErrorGif", "TamanodelGif1", "TamanodelGif2", "TamanodelGif3", "TamanodelGif4", "RelacionGif1", "RelacionGif2", "RelacionGif3", "RelacionGif4":
			{
				if (ArrayText[2] = 0 or ArrayText[2] = 1)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
	
			}
			case "WebAlConectarse", "WebAlDesconocer", "WebAlDesconectarse", "WebAlError", "SoundConectado", "SoundNacional", "SoundDesconectado", "SoundError", "EditConectado", "EditNacional", "EditDesconectado", "EditUser1", "EditPassword1", "EditDataPers", "EditWebOffAccount", "EditIniFileReadTime", "AnchoGif1", "AnchoGif2", "AnchoGif3", "AnchoGif4":
				%ArrayText[1]% := ArrayText[2]
			case "VerificarConx", "VerificarPingCada", "VerificarConxCada":
			{
				if (ArrayText[2] >= 1 and ArrayText[2] <= 100)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "TemporizadorH":
			{
				if (ArrayText[2] >= 0 and ArrayText[2] <= 23)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "TemporizadorM", "TemporizadorS":
			{
				if (ArrayText[2] >= 0 and ArrayText[2] <= 59)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "PosVGif1", "PosVGif2", "PosVGif3", "PosVGif4":
			{
				try
					WinGetPos ,,, &H, "ahk_class Shell_TrayWnd"
				catch
					H := 48
				
				if (ArrayText[2] >= 0 and ArrayText[2] <= H+12)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "LargoGif1", "LargoGif2", "LargoGif3", "LargoGif4", "GifSelected1", "GifSelected2", "GifSelected3", "GifSelected4", "GifSelectedText1", "GifSelectedText2", "GifSelectedText3", "GifSelectedText4", "EditUser2", "EditPassword2", "LenguajeText":
				%ArrayText[1]% := ArrayText[2]
			case "EfectoEntradaGif1", "EfectoEntradaGif2", "EfectoEntradaGif3", "EfectoEntradaGif4", "EfectoSalidaGif1", "EfectoSalidaGif2", "EfectoSalidaGif3", "EfectoSalidaGif4":
			{
				if (ArrayText[2] >= 0 and ArrayText[2] <= 18)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "UpDownEfectoEntradaGif1", "UpDownEfectoEntradaGif2", "UpDownEfectoEntradaGif3", "UpDownEfectoEntradaGif4", "UpDownEfectoSalidaGif1", "UpDownEfectoSalidaGif2", "UpDownEfectoSalidaGif3", "UpDownEfectoSalidaGif4":
			{
				if (ArrayText[2] >= 200 and ArrayText[2] <= 5000)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "UpDownTiempoEntradaGif1", "UpDownTiempoEntradaGif2", "UpDownTiempoEntradaGif3", "UpDownTiempoEntradaGif4":
			{
				if (ArrayText[2] >= 0 and ArrayText[2] <= 20)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
			case "VoltearEntradaGif1", "VoltearSalidaGif1", "VoltearEntradaGif2", "VoltearSalidaGif2", "VoltearEntradaGif3", "VoltearSalidaGif3", "VoltearEntradaGif4", "VoltearSalidaGif4", "BarradeTareasGif1", "BarradeTareasGif2", "BarradeTareasGif3", "BarradeTareasGif4", "UsarSegundaCuenta", "ActIni":
			{
				if (ArrayText[2] = 0 or ArrayText[2] = 1)
					%ArrayText[1]% := ArrayText[2]
				else
					IniWrite %ArrayText[1]%, "options.ini", "settings", ArrayText[1]
			}
		}
	
		sleep(1)
	}
} else
{
	options := "
	(
	[settings]
	IniciarConWindows=0
	ActIni=1
	DarkMode:=0
	AbrirWebAlConectarse=0
	WebAlConectarse=https://www.google.com/
	AbrirWebAlDesconocer:=0
	WebAlDesconocer:=https://www.cubadebate.cu/
	AbrirWebAlDesconectarse:=0
	WebAlDesconectarse:=https://secure.etecsa.net:8443/
	AbrirWebAlError:=0
	WebAlError:=http://192.168.1.1/
	WebOption:=0
	VerificarConxCada=5
	VerificarConx=2
	NotiConectado=1
	NotiNacional=0
	NotiDesconectado=1
	NotiError=0
	SoundConectado=none
	SoundNacional=none
	SoundDesconectado=none
	SoundError=none
	EditConectado=google.com
	EditNacional=cubadebate.cu
	EditDesconectado=secure.etecsa.net
	EditUser1=
	EditPassword1=
	EditUser2=
	EditPassword2=
	DataPers=0
	EditDataPers=username=usuario&password=contraseña
	EditPageLogin=https://secure.etecsa.net:8443//LoginServlet
	WebOffAccount=0
	EditWebOffAccount=http://2.2.2.2/
	IniFileReadTime=0
	EditIniFileReadTime=ftp://usuario:contraseña@ip/archivo
	WebConectado=1
	WebDesconocido=1
	WebDesconectado=1
	VerificarPingCada=1
	CuentaOn=0
	NotiNormal=1
	ConectadoGif=1
	DesconocidoGif=0
	DesconectadoGif=0
	ErrorGif=0
	PosVGif1=0
	TamanodelGif1=0
	AnchoGif1=0
	LargoGif1=0
	RelacionGif1=0
	EfectoEntradaGif1=1
	UpDownEfectoEntradaGif1=1000
	UpDownTiempoEntradaGif1=2
	EfectoSalidaGif1=1
	UpDownEfectoSalidaGif1=1000
	GifSelected1=1
	GifSelectedText1=
	BarradeTareasGif1=0
	PosVGif2=0
	TamanodelGif2=0
	AnchoGif2=0
	LargoGif2=0
	RelacionGif2=0
	EfectoEntradaGif2=1
	UpDownEfectoEntradaGif2=1000
	UpDownTiempoEntradaGif2=2
	EfectoSalidaGif2=1
	UpDownEfectoSalidaGif2=1000
	GifSelected2=1
	GifSelectedText2=
	BarradeTareasGif2=0
	PosVGif3=0
	TamanodelGif3=0
	AnchoGif3=0
	LargoGif3=0
	RelacionGif3=0
	EfectoEntradaGif3=1
	UpDownEfectoEntradaGif3=1000
	UpDownTiempoEntradaGif3=2
	EfectoSalidaGif3=1
	UpDownEfectoSalidaGif3=1000
	GifSelected3=1
	GifSelectedText3=
	BarradeTareasGif3=0
	PosVGif4=0
	TamanodelGif4=0
	AnchoGif4=0
	LargoGif4=0
	RelacionGif4=0
	EfectoEntradaGif4=1
	UpDownEfectoEntradaGif4=1000
	UpDownTiempoEntradaGif4=2
	EfectoSalidaGif4=1
	UpDownEfectoSalidaGif4=1000
	GifSelected4=1
	GifSelectedText4=
	BarradeTareasGif4=0
	VoltearEntradaGif1=0
	VoltearSalidaGif1=0
	VoltearEntradaGif2=0
	VoltearSalidaGif2=0
	VoltearEntradaGif3=0
	VoltearSalidaGif3=0
	VoltearEntradaGif4=0
	VoltearSalidaGif4=0
	UsarSegundaCuenta:=0
	LenguajeText=
	)"
	
	FileAppend options, "options.ini"
}

LangCreate

LangCreate(*)
{
	if !DirExist("Lenguajes")
	{
		DirCreate "Lenguajes"
	}
		
	
	if !FileExist("Lenguajes\English [en-EN].ini")
	{
		Lenguaje := '
		(
		[Messages]
		IconTip1=Waiting for connection...
		IconTip2=Internet connection has been established.
		IconTip21=Account:
		IconTip3=Time:
		IconTip4=Timer:
		IconTip5=Internet connection has been established.
		IconTip6=A connection other than the Internet has been established.
		IconTip7=A connection other than the Internet has been established.
		IconTip8=Captive portal has been detected.
		IconTip9=Captive portal has been detected.
		IconTip10=The connection has been lost.
		IconTip11=[Pause]
		TrayTip1=The account has been set correctly.
		TrayTip2=The account has no balance.
		TrayTip3=There was some error when entering the account.
		TrayTip4=There was an error setting the account. Try again.
		TrayTip5=The account has been successfully removed.
		TrayTip6=There was an error while removing the account.
		TrayTip7=There was an error removing the account. Try again.
		TrayTip8=The set time must be greater than 0.
		TrayTip9=The countdown is almost over.
		TrayTip10=The countdown ended successfully!.
		TrayTip11=The timer has a very short time to activate notifications.
		TrayTip12=The timer has a very short time to activate it on the Icon.
		TrayTip13=The countdown has been cancelled.
		TrayTip14=The connection has been lost.
		Msgbox1=Update download failed, please try again.
		Msgbox2=Changes have been saved.

		[MenuBar]
		Restart=Restart
		Pause=Pause
		PonerCuenta=Put Account
		RemoveAccount=Remove Account
		SetTimer=Set Timer
		RemoveTimer=Remove Timer
		Settings=Settings
		SearchUpdate=Check for Update
		Exit=Exit

		[Update]
		Text1=This is the latest version.
		Text2=Author:
		Text3=Go to Website
		Text4=Latest Version:
		Text5=Current Version:
		Text6=Changes:
		Texto7=Do you want to update to the latest version?
		Text8=Yes
		Text9=No
		Texto10=Verify that your internet connection is stable.
		Text11=Version:

		[Setting]
		Title=[CFG] Connection Notifier
		Tabs=General,Options,GIF
		Text1=About:
		Button1=Save
		Button2=Cancel
		Button3=Reset

		[General]
		BasicText1=Basic
		BasicText2=Start automatically with the system.
		BasicText3=Enable dark mode.
		BasicText4=Language:
		BasicText5=Verify connection every:
		BasicText6=Check ping every:
		BasicText7=times.
		BasicText8=time.
		BasicText9=Check for update on startup.
		PingText1=Ping
		PingTexto2=Ping to Internet
		PingTexto3=Ping to Intranet
		PingTexto4=Ping to the Portal
		TextAccount1=Account
		TextAccount2=User:
		TextAccount3=Password:
		TextAccount4=Use second account.
		NotificationsTexto1=Notifications
		NotificationsText2=GIF
		NotificationsText3=Windows
		NotificationsText4=Sound
		NotificationsText5=Internet:
		NotificationsTexto6=Intranet:
		NotificationsTexto7=Portal:
		NotificationsText8=Offline:
		NotificationsTexto9=Basic and information notifications.

		[Options]
		PaginasWebTexto1=Web Pages
		PaginasWebTexto2=Open website if there is Internet
		PaginasWebTexto3=Open website if there is an Intranet
		PaginasWebTexto4=Open website if there is a Portal
		PaginasWebTexto5=Open website if there is no connection
		PaginasWebTexto6=Always open websites the first time  
		PaginasWebTexto61=and when the browser is not open.
		PaginasWebTexto7=The web page will be opened at least once, always, whether the Web Explorer is open or not, after the first time, if the Web Explorer is not open it will open the web page and if it is open it will not open the web page . This option affects all the options for opening web pages and each option is independent of the rest.
		AdvancedText1=Advanced
		AdvancedTexto2=Website to enter the account:
		AdvancedTexto3=Customize required data
		AdvancedTexto4=Web to remove the account
		AdvancedText5=Use "InternetAccount.ini"
		TimerText1=Timer
		TextTimer2=Remove account after:
		TextTimer3=Show countdown on the Icon.
		TextTimer4=Show countdown in Icon Info.
		TextTimer5=Show countdown in a Notification.

		[GIF]
		ProfileTexto1=Profile
		TextProfile2=Internet
		TextProfile3=Intranet
		TextProfile4=Portal
		TextProfile5=Offline
		TextSettings1=Settings
		TextSettings2=Activate Taskbar when starting GIF.
		TextSettings3=GIF position vertically:
		TextSettings4=Change GIF size:
		TextSettings5=Width:
		TextSettings6=x Length:
		TextSettings7=Aspect ratio.
		TextEffects1=Effects
		TextEffects2=From Center,Scrolling,Scrolling Fast,Towards Left,Towards Scrolling Left,Towards Right,Towards Scrolling Right,Downwards,Downwards Scrolling,Up,Scrolling Up,From Top Left Corner,From Top Left Corner Scroll,From Top Right Corner,From Top Right Corner Scroll,From Bottom Left Corner,From Bottom Left Corner Scroll,From Bottom Right Corner,From Bottom Right Corner Scroll
		TextEffects3=Start:
		TextEffects4=Duration:
		TextEffects5=Flip GIF
		TextEffects6=Output:
		TextEffects7=Screen Time:
		Button1=Test
		)'

		FileAppend Lenguaje, "Lenguajes\English [en-EN].ini"
	}

	if !FileExist("Lenguajes\Español [es-ES].ini")
	{
		Lenguaje := '
		(
		[Mensajes]
		IconTip1=Esperando conexión...
		IconTip2=Se ha establecido la conexión a Internet.
		IconTip21=Cuenta:
		IconTip3=Tiempo:
		IconTip4=Temporizador:
		IconTip5=Se ha establecido la conexión a Internet.
		IconTip6=Se ha establecido una conexión que no es Internet.
		IconTip7=Se ha establecido una conexión que no es Internet.
		IconTip8=Se ha detectado el portal cautivo.
		IconTip9=Se ha detectado el portal cautivo.
		IconTip10=Se ha perdido la conexión.
		IconTip11=[Pausa]
		TrayTip1=La cuenta se ha puesto correctamente.
		TrayTip2=La cuenta no tiene saldo.
		TrayTip3=Hubo algun error al poner la cuenta.
		TrayTip4=Hubo un error al poner la cuenta. Intentalo de nuevo.
		TrayTip5=La cuenta se ha quitado correctamente.
		TrayTip6=Hubo algun error al quitar la cuenta.
		TrayTip7=Hubo un error al quitar la cuenta. Intentalo de nuevo.
		TrayTip8=El tiempo establecido debe de ser mayor que 0.
		TrayTip9=La cuenta atras está al acabarse.
		TrayTip10=La cuenta atras finalizó con éxito!.
		TrayTip11=El temporizador tiene un tiempo muy pequeño para poder activar las notificaciones.
		TrayTip12=El temporizador tiene un tiempo muy pequeño para poder activarlo en el Icono.
		TrayTip13=Se ha cancelado la cuenta atras.
		TrayTip14=Se ha perdido la conexión.
		Msgbox1=La descarga de la actualización ha fallado intente de nuevo.
		Msgbox2=Se han guardado los cambios.

		[BarraMenu]
		Reiniciar=Reiniciar
		Pausar=Pausar
		PonerCuenta=Poner Cuenta
		QuitarCuenta=Quitar Cuenta
		PonerTemporizador=Poner Temporizador
		QuitarTemporizador=Quitar Temporizador
		Configuracion=Configuración
		BuscarActualizacion=Buscar Actualización
		Salir=Salir

		[Actualizacion]
		Texto1=Esta es la ultima versión.
		Texto2=Autor:
		Texto3=Ir al Sitio Web
		Texto4=Última Versión:
		Texto5=Versión Actual:
		Texto6=Cambios:
		Texto7=¿Deseas actualizar a la ultima versión?
		Texto8=Si
		Texto9=No
		Texto10=Verifique que su conexión a internet sea estable.
		Texto11=Versión:

		[Configuracion]
		Titulo=[CFG] Notificador de Conexión
		Pestanas=General,Opciones,GIF
		Texto1=Acerca de:
		Boton1=Guardar
		Boton2=Cancelar
		Boton3=Restablecer

		[General]
		BasicasTexto1=Básicas
		BasicasTexto2=Iniciar automaticamente con el sistema.
		BasicasTexto3=Habilitar modo oscuro.
		BasicasTexto4=Lenguaje:
		BasicasTexto5=Verificar conexión cada:
		BasicasTexto6=Verificar ping cada:
		BasicasTexto7=veces.
		BasicasTexto8=vez.
		BasicasTexto9=Buscar actualización al iniciar.
		PingTexto1=Ping
		PingTexto2=Ping a Internet
		PingTexto3=Ping a Intranet
		PingTexto4=Ping al Portal
		CuentaTexto1=Cuenta
		CuentaTexto2=Usuario:
		CuentaTexto3=Contraseña:
		CuentaTexto4=Usar segunda cuenta.
		NotificacionesTexto1=Notificaciones
		NotificacionesTexto2=GIF
		NotificacionesTexto3=Windows
		NotificacionesTexto4=Sonido
		NotificacionesTexto5=Internet:
		NotificacionesTexto6=Intranet:
		NotificacionesTexto7=Portal:
		NotificacionesTexto8=Sin Conexión:
		NotificacionesTexto9=Notificaciones básicas y de información.

		[Opciones]
		PaginasWebTexto1=Paginas Web
		PaginasWebTexto2=Abrir web si hay Internet
		PaginasWebTexto3=Abrir web si hay Intranet
		PaginasWebTexto4=Abrir web si hay Portal
		PaginasWebTexto5=Abrir web si no hay Conexión
		PaginasWebTexto6=Abrir webs siempre la primera vez y
		PaginasWebTexto61=cuando el explorador no esté abierto.
		PaginasWebTexto7=Se abrirá la pagina web como mínimo una vez, siempre, esté o no esté abierto el Explorador Web, despues de la primera vez, si el Explorador Web no esta abierto abrirá la pagina web y si está abierto pues no abrira la pagina web. Esta opcion afecta a todas las opciones de abrir las paginas web y cada opcion es independiente del resto
		AvanzadoTexto1=Avanzado
		AvanzadoTexto2=Web para poner la cuenta:
		AvanzadoTexto3=Personalizar datos requeridos
		AvanzadoTexto4=Web para quitar la cuenta
		AvanzadoTexto5=Utilizar "InternetAccount.ini"
		TemporizadorTexto1=Temporizador
		TemporizadorTexto2=Quitar la cuenta al cabo de:
		TemporizadorTexto3=Mostar cuenta atras en el Icono.
		TemporizadorTexto4=Mostar cuenta atras en la Info del Icono.
		TemporizadorTexto5=Mostar cuenta atras en una Notificación.

		[GIF]
		PerfilTexto1=Perfil
		PerfilTexto2=Internet
		PerfilTexto3=Intranet
		PerfilTexto4=Portal
		PerfilTexto5=Sin Conexión
		AjustesTexto1=Ajustes
		AjustesTexto2=Activar Barra de Tareas al iniciar GIF.
		AjustesTexto3=Posición del GIF verticalmente:
		AjustesTexto4=Cambiar tamaño del GIF:
		AjustesTexto5=Ancho:
		AjustesTexto6=x Largo:
		AjustesTexto7=Relación de aspecto.
		EfectosTexto1=Efectos
		EfectosTexto2=Desde el Centro,Desplazándose,Desplazándose Rápido,Hacia Izquierda,Hacia Izquierda Desplazándose,Hacia Derecha,Hacia Derecha Desplazándose,Hacia Abajo,Hacia Abajo Desplazándose,Hacia Arriba,Hacia Arriba Desplazándose,Desde Esquina Superior Izquierda,Desde Esquina Superior Izq. Desp.,Desde Esquina Superior Derecha,Desde Esquina Superior Der. Desp.,Desde Esquina Inferior Izquierda,Desde Esquina Inferior Izq. Desp.,Desde Esquina Inferior Derecha,Desde Esquina Inferior Der. Desp.
		EfectosTexto3=Inicio:
		EfectosTexto4=Duración:
		EfectosTexto5=Voltear GIF
		EfectosTexto6=Salida:
		EfectosTexto7=Tiempo en Pantalla:
		Boton1=Probar
		)'

		FileAppend Lenguaje, "Lenguajes\Español [es-ES].ini"
	}
}


if (LenguajeText = "")
{
	PredLang := RegRead("HKEY_CURRENT_USER\Control Panel\Desktop", "PreferredUILanguages")
	PredLang := RTrim(PredLang, "`n")

	Loop Files "Lenguajes\*.ini"
	{
		if (A_LoopFileName ~= PredLang)
		{
			LenguajeText := A_LoopFileName
			break
		}
	}
	if (LenguajeText = "")
		LenguajeText := "English [en-EN].ini"
}

LangChange(LenguajeText)

LangChange(Lang, *)
{
	global LenguajeList := Map()
	
	Filename := "Lenguajes\" Lang
	SectionNames := IniRead(Filename)
	SectionNamesInScript := ["Mensajes","BarraMenu","Actualizacion","Configuracion","General","Opciones","GIF"]

	Loop Parse SectionNames, "`n`r"
	{
		NumSection := A_Index
		
		if (NumSection = 1)
			KeysInScript :=	["IconTip1","IconTip2","IconTip21","IconTip3","IconTip4","IconTip5","IconTip6","IconTip7","IconTip8","IconTip9","IconTip10","IconTip11","TrayTip1","TrayTip2","TrayTip3","TrayTip4","TrayTip5","TrayTip6","TrayTip7","TrayTip8","TrayTip9","TrayTip10","TrayTip11","TrayTip12","TrayTip13","TrayTip14","Msgbox1","Msgbox2"]
		else if (NumSection = 2)
			KeysInScript :=	["Reiniciar","Pausar","PonerCuenta","QuitarCuenta","PonerTemporizador","QuitarTemporizador","Configuracion","BuscarActualizacion","Salir"]
		else if (NumSection = 3)
			KeysInScript :=	["Texto1","Texto2","Texto3","Texto4","Texto5","Texto6","Texto7","Texto8","Texto9","Texto10","Texto11"]
		else if (NumSection = 4)
			KeysInScript :=	["Titulo","Pestanas","Texto1","Boton1","Boton2","Boton3"]
		else if (NumSection = 5)
			KeysInScript :=	["BasicasTexto1","BasicasTexto2","BasicasTexto3","BasicasTexto4","BasicasTexto5","BasicasTexto6","BasicasTexto7","BasicasTexto8","BasicasTexto9","PingTexto1","PingTexto2","PingTexto3","PingTexto4","CuentaTexto1","CuentaTexto2","CuentaTexto3","CuentaTexto4","NotificacionesTexto1","NotificacionesTexto2","NotificacionesTexto3","NotificacionesTexto4","NotificacionesTexto5","NotificacionesTexto6","NotificacionesTexto7","NotificacionesTexto8","NotificacionesTexto9"]
		else if (NumSection = 6)
			KeysInScript :=	["PaginasWebTexto1","PaginasWebTexto2","PaginasWebTexto3","PaginasWebTexto4","PaginasWebTexto5","PaginasWebTexto6","PaginasWebTexto61","PaginasWebTexto7","AvanzadoTexto1","AvanzadoTexto2","AvanzadoTexto3","AvanzadoTexto4","AvanzadoTexto5","TemporizadorTexto1","TemporizadorTexto2","TemporizadorTexto3","TemporizadorTexto4","TemporizadorTexto5"]
		else if (NumSection = 7)
			KeysInScript :=	["PerfilTexto1","PerfilTexto2","PerfilTexto3","PerfilTexto4","PerfilTexto5","AjustesTexto1","AjustesTexto2","AjustesTexto3","AjustesTexto4","AjustesTexto5","AjustesTexto6","AjustesTexto7","EfectosTexto1","EfectosTexto2","EfectosTexto3","EfectosTexto4","EfectosTexto5","EfectosTexto6","EfectosTexto7","Boton1"]
		else
			break

		NumSectionKey := 0
		KeyWithValues := IniRead(Filename, A_LoopField)
		
		LenguajeList.%SectionNamesInScript[NumSection]% := Map()
		Loop Parse KeyWithValues, "`n`r"
		{
			if A_Index > KeysInScript.Length
				continue
			
			KeyWithValuesArr := StrSplit(A_LoopField, "=")
			LenguajeList.%SectionNamesInScript[NumSection]%[KeysInScript[A_Index]] := KeyWithValuesArr[2]
		}
	}
}


uxtheme := DllCall("GetModuleHandle", "str", "uxtheme", "ptr")
SetPreferredAppMode := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 135, "ptr")
FlushMenuThemes := DllCall("GetProcAddress", "ptr", uxtheme, "ptr", 136, "ptr")	
DllCall(SetPreferredAppMode, "int", DarkMode) ; Dark
DllCall(FlushMenuThemes)

A_IconTip := LenguajeList.Mensajes["IconTip1"]

TrayMenuCreate

TrayMenuCreate(*)
{
	A_TrayMenu.Add(LenguajeList.BarraMenu["Reiniciar"], MenuHandler)
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["Reiniciar"], "shell32.dll", 239)
		
	A_TrayMenu.Add(LenguajeList.BarraMenu["Pausar"], MenuHandler)
	try 
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["Pausar"], A_AhkPath, 4)

	A_TrayMenu.Add()

	A_TrayMenu.Add(LenguajeList.BarraMenu["PonerCuenta"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["PonerCuenta"], "shell32.dll", 168)
		
	
		
	A_TrayMenu.Add(LenguajeList.BarraMenu["QuitarCuenta"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["QuitarCuenta"], "shell32.dll", 136)
		
	

	A_TrayMenu.Add()

	A_TrayMenu.Add(LenguajeList.BarraMenu["PonerTemporizador"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["PonerTemporizador"], "shell32.dll", 250)
		
	

	A_TrayMenu.Add(LenguajeList.BarraMenu["QuitarTemporizador"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["QuitarTemporizador"], "ieframe.dll", 75)
		
	
		
	A_TrayMenu.Add()
	A_TrayMenu.Add(LenguajeList.BarraMenu["Configuracion"], MenuHandler) 

	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["Configuracion"], "shell32.dll", 171)
		
	A_TrayMenu.Add()
	A_TrayMenu.Add(LenguajeList.BarraMenu["BuscarActualizacion"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["BuscarActualizacion"], "shell32.dll", 222)
		
	A_TrayMenu.Add()
	A_TrayMenu.Add(LenguajeList.BarraMenu["Salir"], MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["Salir"], "shell32.dll", 132)
}

A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])
A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
A_TrayMenu.Disable(LenguajeList.BarraMenu["BuscarActualizacion"])

if !DirExist(A_ScriptDir "\Sonidos")
	DirCreate A_ScriptDir "\Sonidos"  
	
try 
{
	if (RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips") != "0")
		RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips"
}
catch
	RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips"

global WinAutoRunVerify := true

OnExit ExitFunc

ExitFunc(ExitReason, ExitCode)
{
	if ProcessExist("PingHostName.exe")
		ProcessClose "PingHostName.exe"
}

MenuHandler(ItemName, ItemPos, MyMenu) {
	if (ItemName = LenguajeList.BarraMenu["Pausar"])
	{
		global IconSalve 
		global IconTipSalve 
		
		A_TrayMenu.ToggleCheck(ItemName)
		
		if A_IsPaused
		{
			Pause 0
			try
				TraySetIcon("Icons.dll", IconSalve, 0)
			A_IconTip := IconTipSalve
		}
		else
		{
			IconSalve := A_IconNumber
			IconTipSalve := A_IconTip
			Pause 1
			try
				TraySetIcon("Icons.dll", 1, 1)
			A_IconTip := LenguajeList.Mensajes["IconTip10"]
			
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["Reiniciar"])
		Reload
	else if (ItemName = LenguajeList.BarraMenu["Configuracion"])
	{
	    global TitteGUI
		try
		{
			if !winexist(TitteGUI)
				Settings
			else
				WinActivate (TitteGUI)
		}
		catch
		{
			Settings
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["PonerCuenta"])
	{
		if (A_IconNumber = 3)
		{
			global EditUser1
			global EditPassword1
			global EditUser2
			global EditPassword2
			global SegundaCuenta
			
			global DataPers 
			global EditDataPers
			global EditPageLogin 
			
			global NotiNormal 

			if !DataPers
			{
				if !SegundaCuenta
				{
					if (EditUser1 = "" or EditPassword1 = "")
						return
					requestdata := "username=" EditUser1 "&password=" EditPassword1
				}
				else
				{
					if (EditUser2 = "" or EditPassword2 = "")
						return
					requestdata := "username=" EditUser2 "&password=" EditPassword2
				}
			}
			else
			{
				if (EditDataPers = "")
					return
				requestdata := EditDataPers
			}

			try
			{
				whr := ComObject("WinHttp.WinHttpRequest.5.1")
				whr.Open("POST", EditPageLogin)
				whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
				whr.Send(requestdata)
				FileAppend whr.ResponseText, "LoginDataInfo.txt"
				
				if InStr(whr.ResponseText, "Usted está conectado")
				{
					global CuentaOn := 1
					IniWrite "1", "options.ini", "settings", "CuentaOn"
					
					if NotiNormal
						TrayTip LenguajeList.Mensajes["TrayTip1"],, "Mute"
						
					A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])
					A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
				}
				else if NotiNormal
				{
					if InStr(whr.ResponseText, "Su tarjeta no tiene saldo disponible")
						TrayTip LenguajeList.Mensajes["TrayTip2"],, "Mute"
					else
						TrayTip LenguajeList.Mensajes["TrayTip3"],, "Mute"
				
				}
			}
			catch
			{
				if NotiNormal
					TrayTip LenguajeList.Mensajes["TrayTip4"],, "Mute"
			}
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["QuitarCuenta"])
	{
		if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
		{
			global WebOffAccount 
			global VerificarPingCada
			global VerificarConx
			
			if !WebOffAccount
			{
				if FileExist("LoginDataInfo.txt")
				{
					ValueCuentaOn := IniRead("options.ini", "settings", "CuentaOn")
					if (ValueCuentaOn)
					{
						IpResolveEtecsa := "Failed"
						IpResolveEtecsa := ResolveHostname("secure.etecsa.net")
						
						if(IpResolveEtecsa != "Failed")
						{
							DataEnv := IpResolveEtecsa " " VerificarPingCada " " VerificarConx
						
							if !ProcessExist("PingHostName.exe")
							{
								try
								{
									Run "PingHostName.exe"
									Prev_DetectHiddenWindows := A_DetectHiddenWindows
									DetectHiddenWindows True
									timeleft := 0
									while (!WinExist("ahk_exe PingHostName.exe") and timeleft < 5000)
									{
										timeleft += 10
										sleep(10)
									}
									DetectHiddenWindows Prev_DetectHiddenWindows  ; Restore original setting for the caller.
								}
								catch
									exitapp
							}
									
							if !ProcessExist("PingHostName.exe")
								exitapp
								
							PingEtecsa := 0
					
							try
								PingEtecsa := Send_WM_COPYDATA(DataEnv, "ahk_exe PingHostName.exe")
								
							if (PingEtecsa != 0 and PingEtecsa != 1)
								PingEtecsa := 0

							If PingEtecsa
							{
								Text := FileRead("LoginDataInfo.txt")
								
								FoundPosAT := InStr(Text, "ATTRIBUTE_UUID")
								ATTRIBUTE_UUID := SubStr(Text, FoundPosAT, (InStr(Text, '"', , FoundPosAT)-FoundPosAT))
								
								FoundPosLI:= InStr(Text, "loggerId")
								loggerId := SubStr(Text, FoundPosLI, (InStr(Text, '"', , FoundPosLI)-FoundPosLI))
								
								FoundPosUN:= InStr(Text, "username")
								username := SubStr(Text, FoundPosUN, (InStr(Text, '"', , FoundPosUN)-FoundPosUN))

								try
								{
									requestdata := ATTRIBUTE_UUID "&" loggerId "&" username
									whr := ComObject("WinHttp.WinHttpRequest.5.1")
									whr.Open("POST", "https://secure.etecsa.net:8443/LogoutServlet")
									whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
									whr.Send(requestdata)
									
									global NotiNormal 
									if NotiNormal
									{
										if InStr(whr.ResponseText, "SUCCESS")
											TrayTip LenguajeList.Mensajes["TrayTip5"],, "Mute"
										else
											TrayTip LenguajeList.Mensajes["TrayTip6"],, "Mute"
									}
									
									FileDelete "LoginDataInfo.txt"
									global CuentaOn := 0
									IniWrite "0", "options.ini", "settings", "CuentaOn"
									
									global EditUser1
									global EditUser2
									global UsarSegundaCuenta
									global DataPers 
									
									if !UsarSegundaCuenta
										EditUser := EditUser1
									else
										EditUser := EditUser2
									
									if (EditUser != "" or DataPers != "")
										A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerCuenta"])	
									else
										A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])	
			
									A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
								}
								catch
								{
									if NotiNormal
									{
										TrayTip LenguajeList.Mensajes["TrayTip7"],, "Mute"
									}
								}
							}
						}
					}
				}
			}
			else
			{
				global EditWebOffAccount
				try
				{
					whr := ComObject("WinHttp.WinHttpRequest.5.1")
					whr.Open("POST", EditWebOffAccount)
					whr.Send()
				}
				
			}
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["PonerTemporizador"])
	{
		global Temporizador := 1
		global TemporizadorNotiIcon
		A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
		A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
		
		if TemporizadorNotiIcon
		{	
			if (A_IconNumber = 4)
				TraySetIcon("Icons.dll", 11)
			else if (A_IconNumber = 5)
				TraySetIcon("Icons.dll", 6)
		}
		
	}
	else if (ItemName = LenguajeList.BarraMenu["QuitarTemporizador"])
	{
		global Temporizador := 0
		A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
		A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])	
		
		if TemporizadorNotiIcon
		{	
			if (A_IconNumber = 6 or A_IconNumber = 7 or A_IconNumber = 8 or A_IconNumber = 9 or A_IconNumber = 10)
				TraySetIcon("Icons.dll", 5)
			else
				TraySetIcon("Icons.dll", 4)
		}		

		
	}
	else if (ItemName = LenguajeList.BarraMenu["BuscarActualizacion"])
	{
		global PopupTittle
		global actininorepeat
		if (!isset(PopupTittle) or !winexist(PopupTittle))
		{
			global Version
			usr := "alejandrodarz"
			repo := "Notificador-de-Conexion"
			
			global DarkMode
			Popup := Gui()
			global PopupTittle := Popup.Title := LenguajeList.BarraMenu["BuscarActualizacion"]
			
			if DarkMode
			{
				Popup.SetFont("c0xE0E0E0")
				Popup.BackColor := 0x202020
			}
			else
			{
				Popup.SetFont("cBlack")
				Popup.BackColor := ""
			}
			
			Popup.OnEvent("Escape", Popup_Escape)
			Popup.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
			Popup.MarginX := 10
			Popup.MarginY := 10
			
			try
			{
				latestObj := Github.latest(usr, repo)
			
				
				if (Version = latestObj.version)
				{
					if !actininorepeat
					{
						TextPopupV := Popup.Add("Text", , LenguajeList.Actualizacion["Texto1"])
						TextPopupV.SetFont("cGreen")
						global HwndTextPopupV := ControlGetHwnd(TextPopupV)
						
						Popup.Add("Text", , LenguajeList.Actualizacion["Texto11"])
						
						TextPopupVI := Popup.Add("Text", "yp x+5", Version)
						TextPopupVI.SetFont("underline")
						
						Popup.Add("Text", "xm y+1", LenguajeList.Actualizacion["Texto2"] " AleTheKing")
						
						Popup.Add("Link",, '<a href="https://github.com/alejandrodarz/Notificador-de-Conexion">' LenguajeList.Actualizacion["Texto3"] '</a>')
						
						SetDarkMode(Popup)
						
						Popup.Show("w200 Center")
					}
				}
				else
				{
					Popup.Add("Link",, LenguajeList.Actualizacion["Texto4"] '  <a href="' latestObj.DownloadURLs[1] '">' latestObj.version '</a>')
					
					Popup.Add("Text","y+2 xm", LenguajeList.Actualizacion["Texto5"])
					
					TextPopupVI := Popup.Add("Text", "yp x+5", Version)
					TextPopupVI.SetFont("underline")
					
					Popup.Add("Text", "xm", LenguajeList.Actualizacion["Texto2"] " AleTheKing")
					
					
					Popup.Add("Link","xm", '<a href="https://github.com/alejandrodarz/Notificador-de-Conexion/releases/tag/' latestObj.version '">' LenguajeList.Actualizacion["Texto6"] ':</a>')

					
					Popup.Add("Edit", "w200 h80 ReadOnly", latestObj.change_notes)
					
					Popup.Add("Link",, '<a href="https://github.com/alejandrodarz/Notificador-de-Conexion">' LenguajeList.Actualizacion["Texto3"] '</a>')
					
					Popup.Add("Text",, LenguajeList.Actualizacion["Texto7"])
					
					MyBtnYes := Popup.Add("Button", "Default w80 xm+10", "Si")
					MyBtnYes.OnEvent("Click", Popup_BtnYes)
					MyBtnNo := Popup.Add("Button", "Default w80 yp x+5", "No")
					MyBtnNo.OnEvent("Click", Popup_BClose)
					

					SetDarkMode(Popup)
					
					Popup.Show("AutoSize Center")
					
					Popup_BtnYes(*)
					{
						WinClose Popup.Title
						try
						{
							Github.Download(latestObj.downloadURLs[1], A_ScriptDir "\Descarga")
							Run "Actualizar.exe"
							ExitApp
						}
						catch
							Msgbox(LenguajeList.Mensajes["Msgbox1"], LenguajeList.BarraMenu["BuscarActualizacion"], "16")
					}
					
					Popup_BClose(*)
					{
						WinClose Popup.Title
					}
				}
			}
			catch
			{
				if !actininorepeat
				{
					Popup := Gui()
					Popup.Title := LenguajeList.BarraMenu["BuscarActualizacion"]
				
					if DarkMode
					{
						Popup.SetFont("c0xE0E0E0")
						Popup.BackColor := 0x202020
					}
					else
					{
						Popup.SetFont("cBlack")
						Popup.BackColor := ""
					}
					
					Popup.OnEvent("Escape", Popup_Escape)
					Popup.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
					Popup.MarginX := 10
					Popup.MarginY := 10
					TextPopupV := Popup.Add("Text", , LenguajeList.Actualizacion["Texto10"])
					TextPopupV.SetFont("cRed")
					global HwndTextPopupV := ControlGetHwnd(TextPopupV)
					
					Popup.Add("Text", , LenguajeList.Actualizacion["Texto11"])
					
					TextPopupVI := Popup.Add("Text", "yp x+5", Version)
					TextPopupVI.SetFont("underline")
					
					Popup.Add("Text", "xm y+1", LenguajeList.Actualizacion["Texto2"] " AleTheKing")
					
					Popup.Add("Link",, '<a href="https://github.com/alejandrodarz/Notificador-de-Conexion">' LenguajeList.Actualizacion["Texto3"] '</a>')
					
					SetDarkMode(Popup)
					
					Popup.Show("AutoSize Center")
				}
			}
			
			actininorepeat := 0
			
			Popup_Escape(thisgui)
			{
				WinClose thisgui
			}
		}
		else
			WinActivate(PopupTittle)

	}
	else if (ItemName = LenguajeList.BarraMenu["Salir"])
	{
		if ProcessExist("PingHostName.exe")
			ProcessClose "PingHostName.exe"
		ExitApp
	}
}

if ActIni
{
	global actininorepeat := 1
	MenuHandler(LenguajeList.BarraMenu["BuscarActualizacion"], 8, A_TrayMenu)
}

Settings(*)
{	
	global IniciarConWindows
	global DarkMode
	global AbrirWebAlConectarse
	global WebAlConectarse
	
	global AbrirWebAlDesconocer
	global WebAlDesconocer
	
	global AbrirWebAlDesconectarse
	global WebAlDesconectarse
	
	global AbrirWebAlError
	global WebAlError
	
	global WebOption
	
	global VerificarConxCada
	global VerificarConx
	global VerificarPingCada
	global NotiConectado
	global NotiNacional
	global NotiDesconectado
	global NotiError
	
	global WebConectado 
	global WebDesconocido 
	global WebDesconectado 
	
	global SoundConectado
	global SoundNacional
	global SoundDesconectado
	global SoundError
	global EditConectado
	global EditNacional
	global EditDesconectado
	
	global EditUser1
	global EditPassword1
	global EditUser2
	global EditPassword2
	global DataPers
	global EditDataPers
	global EditPageLogin
	
	global WebOffAccount
	global EditWebOffAccount
	
	global IniFileReadTime
	global EditIniFileReadTime
	
	global CuentaOn
	
	global TitteGUI
	
	global Temporizador
	global TemporizadorH
	global TemporizadorM
	global TemporizadorS
	global TemporizadorNotiIcon
	global TemporizadorNotiTooltip
	global TemporizadorNotiWindows
	
	global NotiGifError
	global NotiGifDesconectado
	global NotiGifNacional
	global NotiGifConectado
	
	global NotiNormal
	
	
	global ConectadoGif 
	global DesconocidoGif 
	global DesconectadoGif
	global ErrorGif 

	global PosVGif1
	global TamanodelGif1
	global AnchoGif1
	global LargoGif1
	global RelacionGif1
	global EfectoEntradaGif1
	global UpDownEfectoEntradaGif1
	global UpDownTiempoEntradaGif1
	global EfectoSalidaGif1
	global UpDownEfectoSalidaGif1
	global GifSelected1
	global GifSelectedText1
	global BarradeTareasGif1

	global PosVGif2
	global TamanodelGif2
	global AnchoGif2
	global LargoGif2
	global RelacionGif2
	global EfectoEntradaGif2
	global UpDownEfectoEntradaGif2
	global UpDownTiempoEntradaGif2
	global EfectoSalidaGif2
	global UpDownEfectoSalidaGif2
	global GifSelected2
	global GifSelectedText2
	global BarradeTareasGif2

	global PosVGif3
	global TamanodelGif3
	global AnchoGif3
	global LargoGif3
	global RelacionGif3
	global EfectoEntradaGif3
	global UpDownEfectoEntradaGif3
	global UpDownTiempoEntradaGif3
	global EfectoSalidaGif3
	global UpDownEfectoSalidaGif3
	global GifSelected3
	global GifSelectedText3
	global BarradeTareasGif3

	global PosVGif4
	global TamanodelGif4
	global AnchoGif4
	global LargoGif4
	global RelacionGif4
	global EfectoEntradaGif4
	global UpDownEfectoEntradaGif4
	global UpDownTiempoEntradaGif4
	global EfectoSalidaGif4
	global UpDownEfectoSalidaGif4
	global GifSelected4
	global GifSelectedText4
	global BarradeTareasGif4
	
	global VoltearEntradaGif1
	global VoltearSalidaGif1

	global VoltearEntradaGif2
	global VoltearSalidaGif2

	global VoltearEntradaGif3
	global VoltearSalidaGif3

	global VoltearEntradaGif4
	global VoltearSalidaGif4
	
	global UsarSegundaCuenta
	
	global LenguajeText
	
	
	
	MyGui := Gui()
	
	if DarkMode
	{
		MyGui.SetFont("c0xE0E0E0")
		MyGui.BackColor := 0x202020
	}
	else
	{
		MyGui.SetFont("cBlack")
		MyGui.BackColor := ""
	}
	
	TitteGUI := MyGui.Title := LenguajeList.Configuracion["Titulo"]
	
	;////// [Acerca de:]
	MyGui.Add("Text","x+460 y+5", LenguajeList.Configuracion["Texto1"])
	MyTextInfo := MyGui.Add("Text","x+5 yp", "( ? )")
	MyTextInfo.OnEvent("Click", GTextInfo)
	
	if DarkMode
		MyTextInfo.SetFont("cAqua")
	else
		MyTextInfo.SetFont("cBlue")
	
	global HwndMyTextInfo := ControlGetHwnd(MyTextInfo)
	;//////
	
	MyTab := MyGui.Add("Tab3","xm ym", StrSplit(LenguajeList.Configuracion["Pestanas"], ","))
	
	
	;////////////////////////  GroupBox [Básicas]
	MyGroupBoxGenerales := MyGui.Add("GroupBox","w250 h160 Section", LenguajeList.General["BasicasTexto1"])
	MyGroupBoxGenerales.GetPos(&XMyGroupBoxGenerales, &YMyGroupBoxGenerales, &WMyGroupBoxGenerales, &HMyGroupBoxGenerales)
	

	;////// [Iniciar con el Sistema]
	MyCheckIniciarConWindows := MyGui.Add("Checkbox","xs+15 yp+25 vinitialize", " ")
	MyCheckIniciarConWindows.value := IniciarConWindows
	MyCheckIniciarConWindowsText := MyGui.Add("Text","x+-1 yp", LenguajeList.General["BasicasTexto2"])
	MyCheckIniciarConWindowsText.OnEvent("Click", GIniciarConWindowsText)
	
	GIniciarConWindowsText(*)
	{
		if MyCheckIniciarConWindows.value
			MyCheckIniciarConWindows.value := 0
		else
			MyCheckIniciarConWindows.value := 1
	}
	;//////
	
	;////// [Buscar actualización al iniciar]
	MyCheckActIni := MyGui.Add("Checkbox","xs+15 y+10 vActIni", " ")
	MyCheckActIni.value := ActIni
	MyCheckActIniText := MyGui.Add("Text","x+-1 yp", LenguajeList.General["BasicasTexto9"])
	MyCheckActIniText.OnEvent("Click", GMyCheckActIniText)
	
	GMyCheckActIniText(*)
	{
		if MyCheckActIni.value
			MyCheckActIni.value := 0
		else
			MyCheckActIni.value := 1
	}
	;//////
	
	
	;////// [Modo Oscuro]
	MyCheckDarkMode := MyGui.Add("Checkbox","xs+15 y+10 vDarkMode", " ")
	MyCheckDarkMode.value := DarkMode

	MyCheckDarkModeText := MyGui.Add("Text","x+-1 yp", LenguajeList.General["BasicasTexto3"])
	MyCheckDarkModeText.OnEvent("Click", GMyCheckDarkModeText)
	
	GMyCheckDarkModeText(*)
	{
		if MyCheckDarkMode.value
			MyCheckDarkMode.value := 0
		else
			MyCheckDarkMode.value := 1
	}
	;//////


	;////// [Lenguaje]
	MyGui.Add("Text","xs+15 y+12", LenguajeList.General["BasicasTexto4"])
	Lenguajes := []
	
	Lenguaje := 1
	PredLang := RegRead("HKEY_CURRENT_USER\Control Panel\Desktop", "PreferredUILanguages")
	PredLang := RTrim(PredLang, "`n")

	Loop Files "Lenguajes\*.ini"
	{
		Lenguajes.InsertAt(0, A_LoopFileName)
		if (A_LoopFileName = LenguajeText)
			Lenguaje := A_Index
	}
	
	MyDropDownLenguaje := MyGui.Add("DropDownList", "x+5 yp-3 w120 vLenguaje R5", Lenguajes)
	MyDropDownLenguaje.Value := Lenguaje
	;//////
	
	;////// [Verificar conexión cada]
	MyGui.Add("Text","xs+15 y+15", LenguajeList.General["BasicasTexto5"])
	MyEditSeg := MyGui.Add("Edit", "x+5 yp-3 w48 h20")
	MyEditSeg.SetFont("cBlack")
	MyUpDownVerificarConxCada := MyGui.Add("UpDown", "vMyUpDown Range1-100", 0)
	MyUpDownVerificarConxCada.value := VerificarConxCada
	MyGui.Add("Text","x+5 yp+3", "s.")
	;//////
	

	;////////////////////////  GroupBox [Ping]
	MyGui.Add("GroupBox", "xs w250 h210 Section", LenguajeList.General["PingTexto1"])
	
	;////// [Ping a Internet]
	MyCheckWebConectado := MyGui.Add("Checkbox","xs+15 yp+20 Section vMyCheckConectado", " ")
	MyCheckWebConectado.OnEvent("Click", GMyCheckWebConectado)
	MyCheckWebConectado.value := WebConectado
	
	MyCheckWebConectadoText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.General["PingTexto2"])
	MyCheckWebConectadoText.OnEvent("Click", GMyCheckWebConectadoText)
	
	GMyCheckWebConectadoText(*)
	{
		if MyCheckWebConectado.value
			MyCheckWebConectado.value := 0
		else
			MyCheckWebConectado.value := 1
			
		GMyCheckWebConectado
	}
	
	MyEditConectado := MyGui.Add("Edit","xs w220 h22 vMyEditConectado")
	MyEditConectado.value := EditConectado
	MyEditConectado.SetFont("underline cBlue")	

	GMyCheckWebConectado
	
	GMyCheckWebConectado(*)
	{
		if MyCheckWebConectado.value
			MyEditConectado.Enabled := 1
		else
			MyEditConectado.Enabled := 0
	}
	;//////
	
	
	;////// [Ping a Intranet]
	MyCheckWebDesconocido := MyGui.Add("Checkbox","xs y+10 vMyCheckDesconocido", " ")
	MyCheckWebDesconocido.OnEvent("Click", GMyCheckWebDesconocido)
	MyCheckWebDesconocido.value := WebDesconocido
	
	MyCheckWebDesconocidoText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.General["PingTexto3"])
	MyCheckWebDesconocidoText.OnEvent("Click", GMyCheckWebDesconocidoText)
	
	GMyCheckWebDesconocidoText(*)
	{
		if MyCheckWebDesconocido.value
			MyCheckWebDesconocido.value := 0
		else
			MyCheckWebDesconocido.value := 1
			
		GMyCheckWebDesconocido
	}
	
	MyEditNacional := MyGui.Add("Edit","xs w220 h22 vMyEditNacional")
	MyEditNacional.value := EditNacional
	MyEditNacional.SetFont("underline cBlue")
	

		
	GMyCheckWebDesconocido
		
	GMyCheckWebDesconocido(*)
	{
		if MyCheckWebDesconocido.value
			MyEditNacional.Enabled := 1
		else
			MyEditNacional.Enabled := 0
	}
	;////// 
	
	
	;////// [Ping al Portal]
	MyCheckWebDesconectado := MyGui.Add("Checkbox","xs y+10 vMyCheckDesconectado", " ")
	MyCheckWebDesconectado.OnEvent("Click", GMyCheckWebDesconectado)
	MyCheckWebDesconectado.value := WebDesconectado
	
	MyCheckWebDesconectadoText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.General["PingTexto4"])
	MyCheckWebDesconectadoText.OnEvent("Click", GMyCheckWebDesconectadoText)
	
	GMyCheckWebDesconectadoText(*)
	{
		if MyCheckWebDesconectado.value
			MyCheckWebDesconectado.value := 0
		else
			MyCheckWebDesconectado.value := 1
			
		GMyCheckWebDesconectado
	}
	
	MyEditDesconectado := MyGui.Add("Edit","xs w220 h22 vMyEditDesconectado")
	MyEditDesconectado.value := EditDesconectado
	MyEditDesconectado.SetFont("underline cBlue")
	
	
	GMyCheckWebDesconectado
		
	GMyCheckWebDesconectado(*)
	{
		if MyCheckWebDesconectado.value
			MyEditDesconectado.Enabled := 1
		else
			MyEditDesconectado.Enabled := 0
	}
	;//////
	
	
	;////// [Verificar ping]
	MyGui.Add("Text","xs y+15", LenguajeList.General["BasicasTexto6"])
	
	MyEditConxPing := MyGui.Add("Edit", "x+5 yp-3 w35 h20")
	MyEditConxPing.SetFont("cBlack")
	MyUpDownConxPing := MyGui.Add("UpDown", "vMyUpDownVerificarPingCada Range1-100", 0)
	MyUpDownConxPing.value := VerificarPingCada
	MyTextConxPing := MyGui.Add("Text","x+5 yp+3", "s.")
	
	MyEditConx := MyGui.Add("Edit", "x+5 yp-3 w35 h20")
	MyEditConx.SetFont("cBlack")
	MyUpDownVerificarConx := MyGui.Add("UpDown", "vMyUpDownConx Range1-100", 0)
	MyUpDownVerificarConx.OnEvent("Change", GMyUpDownVerificarConx)
	MyUpDownVerificarConx.value := VerificarConx
	MyTextVerificarConx := MyGui.Add("Text","w40 x+5 yp+3", "")
	
	
	GMyUpDownVerificarConx
	
	GMyUpDownVerificarConx(*)
	{
		if (MyUpDownVerificarConx.value != 1)
			MyTextVerificarConx.value := LenguajeList.General["BasicasTexto7"]
		else
			MyTextVerificarConx.value := LenguajeList.General["BasicasTexto8"]
	}
	;//////

	
	;////////////////////////  GroupBox [Cuenta]

	MyGui.Add("GroupBox","y" YMyGroupBoxGenerales " x" (XMyGroupBoxGenerales+WMyGroupBoxGenerales+MyGui.MarginX) " w260 h160 Section", LenguajeList.General["CuentaTexto1"])
	
	;////// [Usuario]
	MyEditUserText := MyGui.Add("Text","xs+15 yp+25", LenguajeList.General["CuentaTexto2"])
	MyEditUser := MyGui.Add("Edit","xp yp+18 w230 h22 vMyEditUser")
	MyEditUser.SetFont("cBlack")
	
	;//////
	
	
	;////// [Contrasena]
	MyEditPasswordText := MyGui.Add("Text","xp yp+30", LenguajeList.General["CuentaTexto3"])
	MyEditPassword := MyGui.Add("Edit","xp w230 h22 vMyEditPassword Password")
	MyEditPassword.SetFont("cBlack")
	
	;//////
	
	;////// [UsarSegundaCuenta]
	MyCheckUsarSegundaCuenta := MyGui.Add("Checkbox","xp y+15 vUsarSegundaCuenta", " ")
	MyCheckUsarSegundaCuenta.value := UsarSegundaCuenta
	MyCheckUsarSegundaCuenta.OnEvent("Click", GUsarSegundaCuenta1)
	MyTextUsarSegundaCuenta := MyGui.Add("Text","yp x+-0.5", LenguajeList.General["CuentaTexto4"])
	MyTextUsarSegundaCuenta.OnEvent("Click", GUsarSegundaCuenta)
	
	
	GUsarSegundaCuenta(*)
	{
		if MyCheckUsarSegundaCuenta.value
			MyCheckUsarSegundaCuenta.value := 0
		else
			MyCheckUsarSegundaCuenta.value := 1
		
		GUsarSegundaCuenta1
	}
	
	GUsarSegundaCuenta1
	
	GUsarSegundaCuenta1(*)
	{
		if MyCheckUsarSegundaCuenta.value
		{
			MyEditUser.value := EditUser2
			MyEditPassword.value := EditPassword2
		}
		else
		{
			MyEditUser.value := EditUser1
			MyEditPassword.value := EditPassword1
		}
	}
	
	;//////

	
	;////////////////////////  GroupBox [Notificaciones]
	
	MyGui.Add("GroupBox", "xs w260 h210 Section", LenguajeList.General["NotificacionesTexto1"])
	
	MySound := ["none"]
	SoundFilesPath := A_ScriptDir "\Sonidos"
	
	if DirExist(SoundFilesPath)
	{ 
		Loop Files SoundFilesPath "\*.wav*"
		{
			MySound.InsertAt(0, A_LoopFileName) 
			sleep(1)
		}
	}
	else
	    DirCreate SoundFilesPath
	
	for a in MySound
	{
		if(a == SoundConectado)
			SoundConectadoNum := A_Index
		if(a == SoundNacional)
			SoundNacionalNum := A_Index	
		if (a == SoundDesconectado)
			SoundDesconectadoNum := A_Index
		if (a == SoundError)
			SoundErrorNum := A_Index
	}
	
	MyTextGIF := MyGui.Add("Text","xp+99 yp+25", LenguajeList.General["NotificacionesTexto2"])
	MyTextGIF.SetFont("underline")
	MyTextGIF.OnEvent("Click", GMyTextGIF)
	
	MyTextWindows := MyGui.Add("Text","x+12 yp", LenguajeList.General["NotificacionesTexto3"])
	MyTextWindows.SetFont("underline")
	MyTextWindows.OnEvent("Click", GMyTextWindows)
	
	
	MyTextSonido := MyGui.Add("Text","x+18 yp", LenguajeList.General["NotificacionesTexto4"]).SetFont("underline")
	
	;////// [Conectado]
	MyCheckNotiConectadoText := MyGui.Add("Text","xs+15 yp+30", LenguajeList.General["NotificacionesTexto5"])
	MyCheckNotiGifConectado := MyGui.Add("Checkbox","xs+100 yp vNotiGifConectado", " ")
	MyCheckNotiGifConectado.value := NotiGifConectado
	MyCheckNotiConectado := MyGui.Add("Checkbox","xs+140 yp vConectado", " ")
	MyCheckNotiConectado.value := NotiConectado
	MyDropDownListSoundConectadoNum := MyGui.Add("DropDownList", "xs+180 yp-5 w65 vSoundConectado", MySound)
	MyDropDownListSoundConectadoNum.Value := SoundConectadoNum
	;//////
	
	
	;////// [Desconocido]
	MyCheckNotiNacionalText := MyGui.Add("Text","xs+15 yp+35", LenguajeList.General["NotificacionesTexto6"])
	MyCheckNotiGifNacional := MyGui.Add("Checkbox","xs+100 yp vNotiGifNacional", " ")
	MyCheckNotiGifNacional.value := NotiGifNacional
	MyCheckNotiNacional := MyGui.Add("Checkbox","xs+140 yp vNacional", " ")
	MyCheckNotiNacional.value := NotiNacional
	MyDropDownListSoundNacionalNum := MyGui.Add("DropDownList", "xs+180 yp-5 w65 vSoundNacional", MySound)
	MyDropDownListSoundNacionalNum.Value := SoundNacionalNum
	;////// 
	
	
	;////// [Desconectado]
	MyCheckNotiDesconectadoText := MyGui.Add("Text","xs+15 yp+35", LenguajeList.General["NotificacionesTexto7"])
	MyCheckNotiGifDesconectado := MyGui.Add("Checkbox","xs+100 yp vNotiGifDesconectado", " ")
	MyCheckNotiGifDesconectado.value := NotiGifDesconectado
	MyCheckNotiDesconectado := MyGui.Add("Checkbox","xs+140 yp vDesconectado", " ")
	MyCheckNotiDesconectado.value := NotiDesconectado
	MyDropDownListSoundDesconectadoNum := MyGui.Add("DropDownList", "xs+180 yp-5 w65 vSoundDesconectado", MySound)
	MyDropDownListSoundDesconectadoNum.Value := SoundDesconectadoNum
	;////// 
	
	
	;////// [Error]
	MyCheckNotiErrorText := MyGui.Add("Text","xs+15 yp+35", LenguajeList.General["NotificacionesTexto8"])
	MyCheckNotiGifError := MyGui.Add("Checkbox","xs+100 yp vNotiGifError", " ")
	MyCheckNotiGifError.value := NotiGifError
	MyCheckNotiError := MyGui.Add("Checkbox","xs+140 yp vError", " ")
	MyCheckNotiError.value := NotiError
	MyDropDownListSoundErrorNum := MyGui.Add("DropDownList", "xs+180 yp-5 w65 vSoundError", MySound)
	MyDropDownListSoundErrorNum.Value := SoundErrorNum
	;//////
	
	
	;////// [Notificaciones básicas y de información.]
	MyCheckNotiNormal := MyGui.Add("Checkbox","xs+15 yp+40 vNotiNormal", " ")
	MyCheckNotiNormal.value := NotiNormal
	MyTextNotiNormal := MyGui.Add("Text","yp x+-1", LenguajeList.General["NotificacionesTexto9"])
	MyTextNotiNormal.OnEvent("Click", GMyTextNotiNormal)

	;//////
	

	GMyTextNotiNormal(*)
	{
		if MyCheckNotiNormal.value
			MyCheckNotiNormal.value := 0
		else
			MyCheckNotiNormal.value := 1	
	}
	
	GMyTextGIF(*)
	{
		if (!MyCheckNotiGifConectado.value or !MyCheckNotiGifNacional.value or !MyCheckNotiGifDesconectado.value or !MyCheckNotiGifError.value)
		{
			MyCheckNotiGifConectado.value := 1
			MyCheckNotiGifNacional.value := 1
			MyCheckNotiGifDesconectado.value := 1
			MyCheckNotiGifError.value := 1
		}
		else
		{
			MyCheckNotiGifConectado.value := 0
			MyCheckNotiGifNacional.value := 0
			MyCheckNotiGifDesconectado.value := 0
			MyCheckNotiGifError.value := 0
		}
	}
	
	GMyTextWindows(*)
	{
	
		if (!MyCheckNotiConectado.value or !MyCheckNotiNacional.value or !MyCheckNotiDesconectado.value or !MyCheckNotiError.value)
		{
			MyCheckNotiConectado.value := 1
			MyCheckNotiNacional.value := 1
			MyCheckNotiDesconectado.value := 1
			MyCheckNotiError.value := 1

		}
		else
		{
			MyCheckNotiConectado.value := 0
			MyCheckNotiNacional.value := 0
			MyCheckNotiDesconectado.value := 0
			MyCheckNotiError.value := 0
		}
	}
	
	;////////////////////////
	
	
	MyTab.UseTab(2)
	
	;////////////////////////  GroupBox [Paginas Web]
	MyGroupBoxPaginasWeb := MyGui.Add("GroupBox", "w250 h280 Section", LenguajeList.Opciones["PaginasWebTexto1"])
	MyGroupBoxPaginasWeb.GetPos(&XMyGroupBoxPaginasWeb, &YMyGroupBoxPaginasWeb, &WMyGroupBoxPaginasWeb, &HMyGroupBoxPaginasWeb)

	;////// [Abrir WEB si hay Internet]
	MyCheckAbrirWebAlConectarse := MyGui.Add("Checkbox","xs+15 yp+25 Section vwebopenAlConectarse", " ")
	MyCheckAbrirWebAlConectarse.OnEvent("Click", GwebopenAlConectarse)
	MyCheckAbrirWebAlConectarse.value := AbrirWebAlConectarse
	
	MyCheckAbrirWebAlConectarseText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["PaginasWebTexto2"])
	MyCheckAbrirWebAlConectarseText.OnEvent("Click", GMyCheckAbrirWebAlConectarseText)
	
	GMyCheckAbrirWebAlConectarseText(*)
	{
		if MyCheckAbrirWebAlConectarse.value
			MyCheckAbrirWebAlConectarse.value := 0
		else
			MyCheckAbrirWebAlConectarse.value := 1
			
		GwebopenAlConectarse
	}
	
	
	
	MyEditWebAlConectarse := MyGui.Add("Edit","xs w220 h22 vMyEditWebAlConectarse")
	MyEditWebAlConectarse.value := WebAlConectarse
	MyEditWebAlConectarse.SetFont("underline cBlue")
	
	
	GwebopenAlConectarse

	GwebopenAlConectarse(*)
	{
		if MyCheckAbrirWebAlConectarse.value
			MyEditWebAlConectarse.Enabled := 1
		else
			MyEditWebAlConectarse.Enabled := 0
	}
	;//////

	
	
	;////// [Abrir web al desconocerse]
	MyCheckAbrirWebAlDesconocer := MyGui.Add("Checkbox","xs y+10 vwebopenAlDesconocer", " ")
	MyCheckAbrirWebAlDesconocer.OnEvent("Click", GwebopenAlDesconocer)
	MyCheckAbrirWebAlDesconocer.value := AbrirWebAlDesconocer
	
	MyCheckAbrirWebAlDesconocerText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["PaginasWebTexto3"])
	MyCheckAbrirWebAlDesconocerText.OnEvent("Click", GMyCheckAbrirWebAlDesconocerText)
	
	GMyCheckAbrirWebAlDesconocerText(*)
	{
		if MyCheckAbrirWebAlDesconocer.value
			MyCheckAbrirWebAlDesconocer.value := 0
		else
			MyCheckAbrirWebAlDesconocer.value := 1
			
		GwebopenAlDesconocer
	}
	
	MyEditWebAlDesconocer := MyGui.Add("Edit","xs w220 h22 vMyEditWebAlDesconocer")
	MyEditWebAlDesconocer.value := WebAlDesconocer
	MyEditWebAlDesconocer.SetFont("underline cBlue")
	
	
	GwebopenAlDesconocer
	
	GwebopenAlDesconocer(*)
	{
		if MyCheckAbrirWebAlDesconocer.value
			MyEditWebAlDesconocer.Enabled := 1
		else
			MyEditWebAlDesconocer.Enabled := 0
	}
	;//////
	
	
	
	
	;////// [Abrir web al desconectarse]
	MyCheckAbrirWebAlDesconectarse := MyGui.Add("Checkbox","xs y+10 vwebopenAlDesconectarse", " ")
	MyCheckAbrirWebAlDesconectarse.OnEvent("Click", GwebopenAlDesconectarse)
	MyCheckAbrirWebAlDesconectarse.value := AbrirWebAlDesconectarse
	
	MyCheckAbrirWebAlDesconectarseText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["PaginasWebTexto4"])
	MyCheckAbrirWebAlDesconectarseText.OnEvent("Click", GMyCheckAbrirWebAlDesconectarseText)
	
	GMyCheckAbrirWebAlDesconectarseText(*)
	{
		if MyCheckAbrirWebAlDesconectarse.value
			MyCheckAbrirWebAlDesconectarse.value := 0
		else
			MyCheckAbrirWebAlDesconectarse.value := 1
			
		GwebopenAlDesconectarse
	}
	
	
	
	MyEditWebAlDesconectarse := MyGui.Add("Edit","xs w220 h22 vMyEditWebAlDesconectarse")
	MyEditWebAlDesconectarse.value := WebAlDesconectarse
	MyEditWebAlDesconectarse.SetFont("underline cBlue")
	
	
	GwebopenAlDesconectarse
	
	GwebopenAlDesconectarse(*)
	{
		if MyCheckAbrirWebAlDesconectarse.value
			MyEditWebAlDesconectarse.Enabled := 1
		else
			MyEditWebAlDesconectarse.Enabled := 0
	}
	;//////
	
	
	;////// [Abrir web al obtener error]
	MyCheckAbrirWebAlError := MyGui.Add("Checkbox","xs y+10 vwebopenAlError", " ")
	MyCheckAbrirWebAlError.OnEvent("Click", GwebopenAlError)
	MyCheckAbrirWebAlError.value := AbrirWebAlError
	
	MyCheckAbrirWebAlErrorText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["PaginasWebTexto5"])
	MyCheckAbrirWebAlErrorText.OnEvent("Click", GMyCheckAbrirWebAlErrorText)
	
	GMyCheckAbrirWebAlErrorText(*)
	{
		if MyCheckAbrirWebAlError.value
			MyCheckAbrirWebAlError.value := 0
		else
			MyCheckAbrirWebAlError.value := 1
			
		GwebopenAlError
	}
	
	MyEditWebAlError := MyGui.Add("Edit","xs w220 h22 vMyEditWebAlError")
	MyEditWebAlError.value := WebAlError
	MyEditWebAlError.SetFont("underline cBlue")
		
	
	GwebopenAlError
		
	GwebopenAlError(*)
	{
		if MyCheckAbrirWebAlError.value
			MyEditWebAlError.Enabled := 1
		else
			MyEditWebAlError.Enabled := 0
	}
	;//////
	
	
	;////// [Abrir webs siempre]
	MyCheckWebOption := MyGui.Add("Checkbox","xs y+20 vMyCheckWebOption", " ")
	MyCheckWebOption.value := WebOption
	
	MyCheckWebOptionText := MyGui.Add("Text","x+-0.5 yp-5", LenguajeList.Opciones["PaginasWebTexto6"] "`n" LenguajeList.Opciones["PaginasWebTexto61"])
	MyCheckWebOptionText.OnEvent("Click", GMyCheckWebOptionText)
	
	
	GMyCheckWebOptionText(*)
	{
		if MyCheckWebOption.value
			MyCheckWebOption.value := 0
		else
			MyCheckWebOption.value := 1
	}
	
	
	MyTextInfoWeb := MyGui.Add("Text","xp+180 yp+5", "( ? )")
	MyTextInfoWeb.OnEvent("Click", GTextInfoWeb)
	
	if DarkMode
		MyTextInfoWeb.SetFont("cAqua")
	else
		MyTextInfoWeb.SetFont("cBlue")
	
	global HwndMyTextInfoWeb := ControlGetHwnd(MyTextInfoWeb)
	
	GTextInfoWeb(*)
	{
		MyTextInfoWeb.SetFont("cGray")
		Result := Msgbox(LenguajeList.Opciones["PaginasWebTexto7"], "Info", "32")
		if Result
		{
			if DarkMode
				MyTextInfoWeb.SetFont("cAqua")
			else
				MyTextInfoWeb.SetFont("cBlue")
		}
	}
	;//////
	



	;////////////////////////  GroupBox [Avanzado]
	MyGui.Add("GroupBox","y" YMyGroupBoxPaginasWeb " x" (XMyGroupBoxPaginasWeb+WMyGroupBoxPaginasWeb+MyGui.MarginX) " w260 h280 Section", LenguajeList.Opciones["AvanzadoTexto1"])
	
	;////// [Web para poner la cuenta]
	MyGui.Add("Text","xs+15 yp+25", LenguajeList.Opciones["AvanzadoTexto2"])
	MyEditPageLogin := MyGui.Add("Edit","xp w230 h22 vMyEditPageLogin")
	MyEditPageLogin.SetFont("underline cBlue")
	MyEditPageLogin.value := EditPageLogin
	;//////

	
	;////// [Personalizar datos requeridos]
	MyCheckDataPers := MyGui.Add("Checkbox","xp yp+40 vMyDataPers", " ")
	MyCheckDataPers.OnEvent("Click", GDataPers)
	MyCheckDataPers.Value := DataPers
	
	MyCheckDataPersText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["AvanzadoTexto3"])
	MyCheckDataPersText.OnEvent("Click", GMyCheckDataPersText)
	
	GMyCheckDataPersText(*)
	{
		if MyCheckDataPers.value
			MyCheckDataPers.value := 0
		else
			MyCheckDataPers.value := 1
			
		GDataPers
	}

	MyEditDataPers := MyGui.Add("Edit","xp-25 y+8 w230 h22 vMyEditDataPers")
	MyEditDataPers.SetFont("cBlack")
	MyEditDataPers.value := EditDataPers
	
	
	GDataPers
		
	GDataPers(*)
	{
		if MyCheckDataPers.Value
		{
			MyEditUser.Enabled := 0
			MyEditPassword.Enabled := 0
			
			MyEditDataPers.Enabled := 1
		}
		else
		{
			MyEditUser.Enabled := 1
			MyEditPassword.Enabled := 1
			
			MyEditDataPers.Enabled := 0
		}
	}
	;//////


	;////// [Web para quitar la cuenta]
	MyCheckWebOffAccount := MyGui.Add("Checkbox","xp yp+40 vMyWebOffAccount", " ")
	MyCheckWebOffAccount.value := WebOffAccount
	MyCheckWebOffAccount.OnEvent("Click", GWebOffAccount)
	
	MyCheckWebOffAccountText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["AvanzadoTexto4"])
	MyCheckWebOffAccountText.OnEvent("Click", GMyCheckWebOffAccountText)
	
	GMyCheckWebOffAccountText(*)
	{
		if MyCheckWebOffAccount.value
			MyCheckWebOffAccount.value := 0
		else
			MyCheckWebOffAccount.value := 1
			
		GWebOffAccount
	}
	
	MyEditWebOffAccount := MyGui.Add("Edit","xp-25 y+8 w230 h22 vMyEditWebOffAccount")
	MyEditWebOffAccount.SetFont("underline cBlue")
	MyEditWebOffAccount.value := EditWebOffAccount
	

	GWebOffAccount
	
	GWebOffAccount(*)
	{
		if MyCheckWebOffAccount.value
			MyEditWebOffAccount.Enabled := 1
		else
			MyEditWebOffAccount.Enabled := 0
	}
	;//////
	
	
	
	;////// [Utilizar "InternetAccount.ini"]
	MyCheckIniFileReadTime := MyGui.Add("Checkbox","xp yp+40 vMyIniFileReadTime", " ")
	MyCheckIniFileReadTime.value := IniFileReadTime
	MyCheckIniFileReadTime.OnEvent("Click", GIniFileReadTime)
	
	MyCheckIniFileReadTimeText := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["AvanzadoTexto5"])
	MyCheckIniFileReadTimeText.OnEvent("Click", GMyCheckIniFileReadTimeText)
	
	GMyCheckIniFileReadTimeText(*)
	{
		if MyCheckIniFileReadTime.value
			MyCheckIniFileReadTime.value := 0
		else
			MyCheckIniFileReadTime.value := 1
			
		GIniFileReadTime
	}
	
	MyEditIniFileReadTime := MyGui.Add("Edit","xp-25 y+8 w230 h22 vMyEditIniFileReadTime")
	MyEditIniFileReadTime.SetFont("cBlack")
	MyEditIniFileReadTime.value := EditIniFileReadTime
	
	GIniFileReadTime
		
	GIniFileReadTime(*)
	{
		if MyCheckIniFileReadTime.value
			MyEditIniFileReadTime.Enabled := 1
		else
			MyEditIniFileReadTime.Enabled := 0
	}
	;//////
	
	
	
	;////// GroupBox [Temporizador]
	MyGroupBoxTemporizador := MyGui.Add("GroupBox", "x" XMyGroupBoxPaginasWeb " y" (YMyGroupBoxPaginasWeb+HMyGroupBoxPaginasWeb+MyGui.MarginY) " w" (510+MyGui.MarginX) " h90 Section", LenguajeList.Opciones["TemporizadorTexto1"])
	MyGroupBoxTemporizador.GetPos(&XMyGroupBoxTemporizador, &YMyGroupBoxTemporizador, &WMyGroupBoxTemporizador, &HMyGroupBoxTemporizador)
	
	;////// [Quitar la cuenta al cabo de:]
	MyCheckTemporizador := MyGui.Add("Checkbox","xs+15 yp+23 Section vTemporizador", " ")
	MyCheckTemporizador.value := Temporizador
	
	MyTextTemporizador := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["TemporizadorTexto2"])
	MyTextTemporizador.OnEvent("Click", GMyCheckTemporizador1)

	MyEditTemporizadorH := MyGui.Add("Edit","xs y+15 w35 h20")
	MyUpDownTemporizadorH := MyGui.Add("UpDown", "vTemporizadorH Range0-23", 0)
	
	MyUpDownTemporizadorH.OnEvent("Change", GMyUpDownTemporizadorH)
	MyUpDownTemporizadorH.value := TemporizadorH
	
	
	MyGui.Add("Text","x+5 yp+3", "h :")
	
	MyEditTemporizadorM := MyGui.Add("Edit","x+10 yp-3 w35 h20")
	MyUpDownTemporizadorM := MyGui.Add("UpDown", "vTemporizadorM Range0-59", 0)
	MyUpDownTemporizadorM.OnEvent("Change", GMyUpDownTemporizadorM)
	MyUpDownTemporizadorM.value := TemporizadorM
	

	MyGui.Add("Text","x+5 yp+3", "m :")
	
	MyEditTemporizadorS := MyGui.Add("Edit","x+10 yp-3 w35 h20")
	MyUpDownTemporizadorS := MyGui.Add("UpDown", "vTemporizadorS Range0-59", 0)
	MyUpDownTemporizadorS.OnEvent("Change", GMyUpDownTemporizadorS)
	MyUpDownTemporizadorS.value := TemporizadorS
	MyGui.Add("Text","x+5 yp+3", "s")
	
	GMyUpDownTemporizadorH(Gui, GuiValue)
	{
		global TempUpDownH
		if !isset(TempUpDownH)
			TempUpDownH := 0
		if (GuiValue = 23)
		{
			TempUpDownH += 1
			if (TempUpDownH = 2)
			{
				Gui.Value := 0
				TempUpDownH := 1
			}
		}
		else if (GuiValue = 0)
		{
			TempUpDownH += 1
			if (TempUpDownH = 2)
			{
				Gui.Value := 23
				TempUpDownH := 1
			}
		}
		else
			TempUpDownH := 0
	}
	
	GMyUpDownTemporizadorM(Gui, GuiValue)
	{
		global TempUpDownM
		if !isset(TempUpDownM)
			TempUpDownM := 0
		if (GuiValue = 59)
		{
			TempUpDownM += 1
			if (TempUpDownM = 2)
			{
				Gui.Value := 0
				TempUpDownM := 1
				MyUpDownTemporizadorH.value += 1
			}
		}
		else if (GuiValue = 0)
		{
			TempUpDownM += 1
			if (TempUpDownM = 2)
			{
				Gui.Value := 59
				TempUpDownM := 1
				MyUpDownTemporizadorH.value -= 1
			}
		}
		else
			TempUpDownM := 0
	}
	
	
	
	GMyUpDownTemporizadorS(Gui, GuiValue)
	{
		global TempUpDownS
		if !isset(TempUpDownS)
			TempUpDownS := 0
		if (GuiValue = 59)
		{
			TempUpDownS += 1
			if (TempUpDownS = 2)
			{
				Gui.Value := 0
				TempUpDownS := 1
				if (MyUpDownTemporizadorM.value = 59 and MyUpDownTemporizadorH.value != 23)
				{
					MyUpDownTemporizadorH.value += 1
					MyUpDownTemporizadorM.value := 0
				}
				else if (MyUpDownTemporizadorM.value != 59)
					MyUpDownTemporizadorM.value += 1
			}
		}
		else if (GuiValue = 0)
		{
			TempUpDownS += 1
			if (TempUpDownS = 2)
			{
				Gui.Value := 59
				TempUpDownS := 1
				if (MyUpDownTemporizadorM.value = 0 and MyUpDownTemporizadorH.value != 0)
				{
					MyUpDownTemporizadorH.value -= 1
					MyUpDownTemporizadorM.value := 59
				}
				else if (MyUpDownTemporizadorM.value != 0)
					MyUpDownTemporizadorM.value -= 1
			}
		}
		else
			TempUpDownS := 0
	}


	GMyCheckTemporizador1(*)
	{
		if MyCheckTemporizador.value
			MyCheckTemporizador.value := 0
		else
			MyCheckTemporizador.value := 1
			
	}

	;//////
	
	
	;////// [Mostar cuenta atras en el Icono]
	MyCheckTempNotiIcon := MyGui.Add("Checkbox","x+90 ys Section vTempNotiIcon", " ")
	MyCheckTempNotiIcon.value := TemporizadorNotiIcon
	MyTextTempNotiIcon := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["TemporizadorTexto3"])
	MyTextTempNotiIcon.OnEvent("Click", GMyCheckTempNotiIcon)
	
	GMyCheckTempNotiIcon(*)
	{
		if MyCheckTempNotiIcon.value
			MyCheckTempNotiIcon.value := 0
		else
			MyCheckTempNotiIcon.value := 1
	}
	;////// 
	
	
	
	;////// [Mostar cuenta atras en la Info del Icono]
	MyCheckTempNotiTooltip := MyGui.Add("Checkbox","xs  vTempNotiTooltip", " ")
	MyCheckTempNotiTooltip.value := TemporizadorNotiTooltip
	MyTextTempNotiTooltip := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["TemporizadorTexto4"])
	MyTextTempNotiTooltip.OnEvent("Click", GMyCheckTempNotiTooltip)
	
	GMyCheckTempNotiTooltip(*)
	{
		if MyCheckTempNotiTooltip.value
			MyCheckTempNotiTooltip.value := 0
		else
			MyCheckTempNotiTooltip.value := 1
	}
	;////// 
	
	
	
	;////// [Mostar cuenta atras en una Notificacion de Windows]
	MyCheckTempNotiWindows := MyGui.Add("Checkbox","xs vTempNotiWindows", " ")
	MyCheckTempNotiWindows.value := TemporizadorNotiWindows
	MyTextTempNotiWindows := MyGui.Add("Text","x+-0.5 yp", LenguajeList.Opciones["TemporizadorTexto5"])
	MyTextTempNotiWindows.OnEvent("Click", GMyCheckTempNotiWindows)
	
	GMyCheckTempNotiWindows(*)
	{
		if MyCheckTempNotiWindows.value
			MyCheckTempNotiWindows.value := 0
		else
			MyCheckTempNotiWindows.value := 1
	}
	
	
	
	;////// 
	
	
	;////////////////////////
	

	MyTab.UseTab(3)
	
	;//////////////////////// GroupBox [Perfil]
	MyGui.Add("GroupBox", "w520 h45 Section", LenguajeList.GIF["PerfilTexto1"])
	
	
	MyRadioGroupConectadoGif := MyGui.Add("Radio", "xs+15 yp+20 vConectadoGif", LenguajeList.GIF["PerfilTexto2"])
	MyRadioGroupConectadoGif.value := ConectadoGif
	MyRadioGroupConectadoGif.OnEvent("Click", GMyRadioGroup) 
	MyRadioGroupDesconocidoGif := MyGui.Add("Radio", "yp xs+140 vDesconocidoGif", LenguajeList.GIF["PerfilTexto3"])
	MyRadioGroupDesconocidoGif.value := DesconocidoGif
	MyRadioGroupDesconocidoGif.OnEvent("Click", GMyRadioGroup) 
	MyRadioGroupDesconectadoGif := MyGui.Add("Radio", "yp xs+280 vDesconectadoGif", LenguajeList.GIF["PerfilTexto4"])
	MyRadioGroupDesconectadoGif.value := DesconectadoGif
	MyRadioGroupDesconectadoGif.OnEvent("Click", GMyRadioGroup) 
	MyRadioGroupErrorGif := MyGui.Add("Radio", "yp xs+420 vErrorGif", LenguajeList.GIF["PerfilTexto5"])
	MyRadioGroupErrorGif.value := ErrorGif
	MyRadioGroupErrorGif.OnEvent("Click", GMyRadioGroup) 
	
	NumberToLoad := 0
	if MyRadioGroupConectadoGif.value
		NumberToLoad := 1
	else if MyRadioGroupDesconocidoGif.value
		NumberToLoad := 2
	else if MyRadioGroupDesconectadoGif.value
		NumberToLoad := 3
	else if MyRadioGroupErrorGif.value
		NumberToLoad := 4
		
	
	if NotiGifConectado
		MyRadioGroupConectadoGif.Enabled := 1
	else
		MyRadioGroupConectadoGif.Enabled := 0
		
	if NotiGifNacional
		MyRadioGroupDesconocidoGif.Enabled := 1
	else
		MyRadioGroupDesconocidoGif.Enabled := 0
		
	if NotiGifDesconectado
		MyRadioGroupDesconectadoGif.Enabled := 1
	else
		MyRadioGroupDesconectadoGif.Enabled := 0
		
	if NotiGifError
		MyRadioGroupErrorGif.Enabled := 1
	else
		MyRadioGroupErrorGif.Enabled := 0

	;//////////////////////// GroupBox [Ajustes]
	MyGroupBoxAjustes := MyGui.Add("GroupBox", "xs w250 h132 Section", LenguajeList.GIF["AjustesTexto1"])
	MyGroupBoxAjustes.GetPos(&XMyGroupBoxAjustes, &YMyGroupBoxAjustes, &WMyGroupBoxAjustes, &HMyGroupBoxAjustes)
	
	;////// [Barra de Tareas]
	MyCheckBarradeTareasGif := MyGui.Add("Checkbox","xs+15 yp+20 vBarradeTareasGif", " ")
	MyCheckBarradeTareasGif.value := BarradeTareasGif%NumberToLoad%
	MyTextBarradeTareasGif := MyGui.Add("Text","x+-0.5", LenguajeList.GIF["AjustesTexto2"])
	MyTextBarradeTareasGif.OnEvent("Click", GBarradeTareasGif)
	;////// 
	
	;////// [Corrección de posición del GIF verticalmente]
	try
		WinGetPos ,,, &H, "ahk_class Shell_TrayWnd"
	catch
		H := 48
	MyTextPosVGif := MyGui.Add("Text","xs+15 yp+22", LenguajeList.GIF["AjustesTexto3"])
	MyEditPosVGif := MyGui.Add("Edit", "yp-3 x+5 w40 h20")
	MyUpDownPosVGif := MyGui.Add("UpDown", "vPosVGif Range0-" H+12, 0)
	MyUpDownPosVGif.value := PosVGif%NumberToLoad%
	;////// 
	
	;////// [Tamaño del GIF]
	MyCheckTamanodelGif := MyGui.Add("Checkbox","xs+15 yp+25 vTamanodelGif", " ")
	MyCheckTamanodelGif.value := TamanodelGif%NumberToLoad%
	MyCheckTamanodelGif.OnEvent("Click", GAnchoxLargo)
	MyTextTamanodelGif := MyGui.Add("Text","x+-0.5", LenguajeList.GIF["AjustesTexto4"])
	MyTextTamanodelGif.OnEvent("Click", GTamanodelGif)
	
	
	MyGui.Add("Text","xs+15 y+10", LenguajeList.GIF["AjustesTexto5"])
	MyEditAnchoGif := MyGui.Add("Edit","x+5 yp-3 w40 h22 Center Number vAnchoGif")
	MyEditAnchoGif.value := AnchoGif%NumberToLoad%
	
	MyGui.Add("Text","x+5 yp+3", LenguajeList.GIF["AjustesTexto6"])
	MyEditLargoGif := MyGui.Add("Edit","x+5 yp-3 w40 h22 Center Number vLargoGif")
	MyEditLargoGif.value := LargoGif%NumberToLoad%

	MyCheckRelacionGif := MyGui.Add("Checkbox","xs+15 y+5 vRelacionGif", " ")
	MyCheckRelacionGif.value := RelacionGif%NumberToLoad%
	MyTextRelacionGif := MyGui.Add("Text","x+-0.5 yp", LenguajeList.GIF["AjustesTexto7"])
	MyTextRelacionGif.OnEvent("Click", GRelacionGif)
	
	GBarradeTareasGif(*)
	{
		if MyCheckBarradeTareasGif.value
			MyCheckBarradeTareasGif.value := 0
		else
			MyCheckBarradeTareasGif.value := 1

	}
	
	GRelacionGif(*)
	{
		if MyCheckRelacionGif.value
			MyCheckRelacionGif.value := 0
		else
			MyCheckRelacionGif.value := 1

	}
	
	
	GTamanodelGif(*)
	{
		if MyCheckTamanodelGif.value
			MyCheckTamanodelGif.value := 0
		else
			MyCheckTamanodelGif.value := 1
		
		GAnchoxLargo
	}
	
	GAnchoxLargo
		
	GAnchoxLargo(*)
	{
		if MyCheckTamanodelGif.value
		{
			MyEditAnchoGif.Enabled := 1
			MyEditLargoGif.Enabled := 1
		}
		else
		{
			MyEditAnchoGif.Enabled := 0
			MyEditLargoGif.Enabled := 0
		}
	}
	;////// 
	
	;//////////////////////// GroupBox [Efectos]
	MyGui.Add("GroupBox", "xs w250 h185 Section", LenguajeList.GIF["EfectosTexto1"])
	
	Efectos := StrSplit(LenguajeList.GIF["EfectosTexto2"], ",")
	
	;////// [Entrada]
	MyGui.Add("Text","xs+15 yp+25", LenguajeList.GIF["EfectosTexto3"])
	
	MyDropDownListEfectoEntradaGif := MyGui.Add("DropDownList", "yp-3 x+5 w190 vEfectoEntradaGif R10", Efectos)
	MyDropDownListEfectoEntradaGif.Value :=  EfectoEntradaGif%NumberToLoad%
	
	MyGui.Add("Text","xs+15 y+10", LenguajeList.GIF["EfectosTexto4"])
	MyEditEfectoEntradaGif := MyGui.Add("Edit", "yp-3 x+5 w50 h20")
	MyUpDownEfectoEntradaGif := MyGui.Add("UpDown", "vUpDownEfectoEntradaGif Range200-5000", 0)
	MyUpDownEfectoEntradaGif.value := UpDownEfectoEntradaGif%NumberToLoad%
	MyTextEfectoEntradaGif := MyGui.Add("Text","yp+3 x+5", "ms.")
	
	MyCheckVoltearEntradaGif := MyGui.Add("Checkbox","x+20 yp vVoltearEntradaGif", " ")
	MyCheckVoltearEntradaGif.value := VoltearEntradaGif%NumberToLoad%
	MyTextVoltearEntradaGif := MyGui.Add("Text","x+-0.5", LenguajeList.GIF["EfectosTexto5"])
	MyTextVoltearEntradaGif.OnEvent("Click", GVoltearEntradaGif)
	
	GVoltearEntradaGif(*)
	{
		if MyCheckVoltearEntradaGif.value
			MyCheckVoltearEntradaGif.value := 0
		else
			MyCheckVoltearEntradaGif.value := 1
	}
	;////// 
	
	

	;////// [Salida]
	MyGui.Add("Text","xs+15 y+25 ", LenguajeList.GIF["EfectosTexto6"])
	
	MyDropDownListEfectoSalidaGif := MyGui.Add("DropDownList", "yp-3 x+5 w190 vEfectoSalidaGif R10", Efectos)
	MyDropDownListEfectoSalidaGif.Value := EfectoSalidaGif%NumberToLoad%
	
	MyGui.Add("Text","xs+15 y+10", LenguajeList.GIF["EfectosTexto4"])
	MyEditEfectoSalidaGif := MyGui.Add("Edit", "yp-3 x+5 w50 h20")
	MyUpDownEfectoSalidaGif := MyGui.Add("UpDown", "vUpDownEfectoSalidaGif Range200-5000", 0)
	MyUpDownEfectoSalidaGif.value := UpDownEfectoSalidaGif%NumberToLoad%
	MyTextEfectoSalidaGif := MyGui.Add("Text","yp+3 x+5", "ms.")

	MyCheckVoltearSalidaGif := MyGui.Add("Checkbox","x+20 yp vVoltearSalidaGif", " ")
	MyCheckVoltearSalidaGif.value := VoltearSalidaGif%NumberToLoad%
	MyTextVoltearSalidaGif := MyGui.Add("Text","x+-0.5", LenguajeList.GIF["EfectosTexto5"])
	MyTextVoltearSalidaGif.OnEvent("Click", GVoltearSalidaGif)
	
	GVoltearSalidaGif(*)
	{
		if MyCheckVoltearSalidaGif.value
			MyCheckVoltearSalidaGif.value := 0
		else
			MyCheckVoltearSalidaGif.value := 1
	}
	;//////
	
	
	;////// [Tiempo en Pantalla:]
	MyGui.Add("Text","xs+15 y+25", LenguajeList.GIF["EfectosTexto7"])
	MyEditTiempoEntradaGif := MyGui.Add("Edit", "yp-3 x+5 w50 h20")
	MyUpDownTiempoEntradaGif := MyGui.Add("UpDown", "vUpDownTiempoEntradaGif Range0-20", 0)
	MyUpDownTiempoEntradaGif.value := UpDownTiempoEntradaGif%NumberToLoad%
	MyTextTiempoEntradaGif := MyGui.Add("Text","yp+3 x+5", "s.")
	;////// 

	MyLV := MyGui.Add("ListView", "y" (YMyGroupBoxAjustes+5) " x" (XMyGroupBoxAjustes+WMyGroupBoxAjustes+MyGui.MarginX ) " w260 h290 Icon")
	
	MyLV.Opt("-Multi")
	
	ImageListID := DllCall("comctl32.dll\ImageList_Create", "int", 75, "int", 75, "uint", 0x20, "int", 255, "int", 10)
	MyLV.SetImageList(ImageListID, 0)
	
	Loop Files, A_WorkingDir "\Gifs\*.gif"
	{
		Bitmap := Gdip_CreateBitmapFromFile(A_LoopFileFullPath)
		HBitmap := Gdip_CreateHBITMAPFromBitmap(Bitmap)
		IL_Add(ImageListID, "HBITMAP:" HBitmap, 0xFFFFFF, 1)
		MyLV.Add("Icon" A_INDEX, RegExReplace(A_LoopFileName, "(.gif)$", "",, 1, -4))
	}
	MyLV.Modify(GifSelected%NumberToLoad%, "Select")
	
	MyGui.Add("Button", "Default w260 xp", LenguajeList.GIF["Boton1"]).OnEvent("Click", Gui_BProbar)


	GMyRadioGroup(*)
	{
		
		NumberToLoad := 0
	if MyRadioGroupConectadoGif.value
		NumberToLoad := 1
	else if MyRadioGroupDesconocidoGif.value
		NumberToLoad := 2
	else if MyRadioGroupDesconectadoGif.value
		NumberToLoad := 3
	else if MyRadioGroupErrorGif.value
		NumberToLoad := 4
			
		MyUpDownPosVGif.value := PosVGif%NumberToLoad%
		MyCheckTamanodelGif.value := TamanodelGif%NumberToLoad%
		MyEditAnchoGif.value := AnchoGif%NumberToLoad%
		MyEditLargoGif.value := LargoGif%NumberToLoad%
		MyCheckRelacionGif.value := RelacionGif%NumberToLoad%
		MyDropDownListEfectoEntradaGif.Value := EfectoEntradaGif%NumberToLoad%
		MyUpDownEfectoEntradaGif.value := UpDownEfectoEntradaGif%NumberToLoad%
		MyDropDownListEfectoSalidaGif.Value := EfectoSalidaGif%NumberToLoad%
		MyUpDownEfectoSalidaGif.value := UpDownEfectoSalidaGif%NumberToLoad%
		MyUpDownTiempoEntradaGif.value := UpDownTiempoEntradaGif%NumberToLoad%
		
		MyCheckBarradeTareasGif.value := BarradeTareasGif%NumberToLoad%
		
		MyCheckVoltearSalidaGif.value := VoltearSalidaGif%NumberToLoad%
		MyCheckVoltearEntradaGif.value := VoltearEntradaGif%NumberToLoad%
		
		try
			MyLV.Modify(GifSelected%NumberToLoad%, "Select")
		
		GAnchoxLargo
	}
	
	
	Gui_BProbar(Gui, *)
	{	
		Gui.Enabled := 0
		if (MyLV.GetNext() != 0)
			SelectGifInLV := MyLV.GetNext()
		else 
			SelectGifInLV := 1
		
		SelectGifInLVText := MyLV.GetText(SelectGifInLV) 
		
		global Prueba := 1
		
		global activePrueba := MyCheckTamanodelGif.value
		global anchoPrueba := MyEditAnchoGif.value
		global largoPrueba := MyEditLargoGif.value
		global relacionPrueba := MyCheckRelacionGif.value
		global VoltearEntradaPrueba := MyCheckVoltearEntradaGif.value
		global VoltearSalidaPrueba := MyCheckVoltearSalidaGif.value
		
		global VoltearSalidaPrueba := MyCheckVoltearSalidaGif.value


		PlayGiftAction(SelectGifInLVText, MyDropDownListEfectoEntradaGif.Value, MyUpDownPosVGif.value, MyUpDownEfectoEntradaGif.value, MyUpDownTiempoEntradaGif.value, MyDropDownListEfectoSalidaGif.Value, MyUpDownEfectoSalidaGif.value, MyCheckBarradeTareasGif.value)
		global Prueba := 0
		Gui.Enabled := 1
	}
	;//////
	
	MyTab.UseTab()
	
	
	;MyGui.Add("GroupBox","xp y+-8 w546 h50 Section")
	MyButtonGuardar := MyGui.Add("Button", "Default w170 xp+10 y+10 Section", LenguajeList.Configuracion["Boton1"])
	MyButtonGuardar.OnEvent("Click", Gui_BGuardar)
	
	MyButtonYes := MyGui.Add("Button", "Default w80 xp yp", LenguajeList.Actualizacion["Texto8"])
	MyButtonNo := MyGui.Add("Button", "Default w80 x+10 yp", LenguajeList.Actualizacion["Texto9"])
	MyButtonYes.OnEvent("Click", Gui_BYes)
	MyButtonNo.OnEvent("Click", Gui_BNo)
	MyButtonYes.Visible := 0
	MyButtonNo.Visible := 0
	MyGui.Add("Button", "Default w170 yp", LenguajeList.Configuracion["Boton2"]).OnEvent("Click", Gui_BClose)
	MyGui.Add("Button", "Default w170 yp", LenguajeList.Configuracion["Boton3"]).OnEvent("Click", Gui_BRestablecer)



	GTextInfo(*)
	{
		global PopupAcerca
		if (!isset(PopupAcerca) or !winexist(PopupAcerca))
		{
			global Version
			MyTextInfo.SetFont("cGray")
			
			Popup := Gui()
			global PopupAcerca := Popup.Title := LenguajeList.Configuracion["Texto1"]

			if DarkMode
			{
				Popup.SetFont("c0xE0E0E0")
				Popup.BackColor := 0x202020
			}
			else
			{
				Popup.SetFont("cBlack")
				Popup.BackColor := ""
			}

			Popup.OnEvent("Escape", Popup_Escape)
			Popup.OnEvent("Close", Popup_Close)
			Popup.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
			Popup.MarginX := 10
			Popup.MarginY := 10

			Popup.Add("Text", , LenguajeList.Actualizacion["Texto11"])

			TextPopupVI := Popup.Add("Text", "yp x+5", Version)
			TextPopupVI.SetFont("underline")

			Popup.Add("Text", "xm y+1", LenguajeList.Actualizacion["Texto2"] " AleTheKing")

			Popup.Add("Link",, '<a href="https://github.com/alejandrodarz/Notificador-de-Conexion">' LenguajeList.Actualizacion["Texto3"] '</a>')

			SetDarkMode(Popup)

			Popup.Show("w200 Center")

			Popup_Escape(thisgui)
			{
				WinClose thisgui
				
				if DarkMode
					MyTextInfo.SetFont("cAqua")
				else
					MyTextInfo.SetFont("cBlue")
			}
			
			Popup_Close(*)
			{
				if DarkMode
					MyTextInfo.SetFont("cAqua")
				else
					MyTextInfo.SetFont("cBlue")
			}
		}
		else
			WinActivate(PopupAcerca)
	}

	MyGui.MarginY := 10
	
	MyGui.OnEvent("Escape", Gui_Escape)
	
	
	SetDarkMode(MyGui)

	MyGui.Opt("-DPIScale")
	MyGui.Show("Center")

	
	Gui_BRestablecer(Gui, *)
	{
		if (ControlGetText(Gui.Hwnd) = LenguajeList.Configuracion["Boton3"])
		{
			NumRestablecer := 3
			global funRestablecer := FuncRest.Bind(Gui.Hwnd)
			ControlSetText NumRestablecer "...", Gui.Hwnd
			SetTimer funRestablecer, 1000
		}
		else
		{
			global funRestablecer
			SetTimer funRestablecer, 0
			ControlSetText LenguajeList.Configuracion["Boton3"], Gui.Hwnd
		}
		
		FuncRest(Gui,*)
		{
			NumRestablecer -= 1
				
			if (NumRestablecer = 0)
			{
				ControlSetText LenguajeList.Configuracion["Boton3"], Gui
				global funRestablecer
				SetTimer funRestablecer, 0
				MyCheckIniciarConWindows.value := 0
				MyCheckDarkMode.value := 0

				MyCheckAbrirWebAlConectarse.value := 0
				MyEditWebAlConectarse.value := "https://www.google.com/"
				
				MyCheckAbrirWebAlDesconocer.value := 0
				MyEditWebAlDesconocer.value := "https://www.cubadebate.cu/"
				
				MyCheckAbrirWebAlDesconectarse.value := 0
				MyEditWebAlDesconectarse.value := "https://secure.etecsa.net:8443/"
				
				MyCheckAbrirWebAlError.value := 0
				MyEditWebAlError.value := "http://192.168.1.1/"
				
				MyCheckWebOption.value := 0
				
				MyEditWebAlConectarse.Enabled := 0
				MyEditWebAlDesconocer.Enabled := 0
				MyEditWebAlDesconectarse.Enabled := 0
				MyEditWebAlError.Enabled := 0
				
				MyUpDownVerificarConxCada.value := 5
				MyUpDownVerificarConx.value := 2
				
				MyUpDownConxPing.value := 1
				
				MyCheckNotiConectado.value := 1
				MyCheckNotiNacional.value := 0
				MyCheckNotiDesconectado.value := 1
				MyCheckNotiError.value := 0
				
				MyDropDownListSoundConectadoNum.Value := 1
				MyDropDownListSoundNacionalNum.Value := 1
				MyDropDownListSoundDesconectadoNum.Value := 1
				MyDropDownListSoundErrorNum.Value := 1
				
				MyEditConectado.value := "google.com"
				MyEditConectado.Enabled := 1
				MyEditNacional.value := "cubadebate.cu"
				MyEditNacional.Enabled := 1
				MyEditDesconectado.value := "secure.etecsa.net"
				MyEditDesconectado.Enabled := 1
				
				MyEditPageLogin.value := "https://secure.etecsa.net:8443//LoginServlet"
				MyEditUser.value := ""
				MyEditUser.Enabled := 1
				MyEditPassword.value := ""
				MyEditPassword.Enabled := 1
				MyCheckDataPers.Value := 0
				MyEditDataPers.value := "username=usuario&password=contraseña"
				MyEditDataPers.Enabled := 0
				MyCheckWebOffAccount.value := 0
				MyEditWebOffAccount.value := "http://2.2.2.2/"
				MyCheckIniFileReadTime.value := 0
				MyEditIniFileReadTime.Enabled := 0
				MyEditIniFileReadTime.value := "ftp://usuario:contraseña@ip/archivo"
				
				MyCheckTemporizador.value := 0
				MyUpDownTemporizadorH.value := 0
				MyUpDownTemporizadorM.value := 0
				MyUpDownTemporizadorS.value := 0
				MyCheckTempNotiIcon.value := 0
				MyCheckTempNotiTooltip.value := 0
				MyCheckTempNotiWindows.value := 0
				MyCheckNotiGifError.value := 0 
				MyCheckNotiGifDesconectado.value := 0
				MyCheckNotiGifNacional.value := 0
				MyCheckNotiGifConectado.value := 0
				MyCheckNotiNormal.value := 1
				

				MyUpDownPosVGif.value := 0
				MyCheckTamanodelGif.value := 0
				MyEditAnchoGif.value := 0
				MyEditLargoGif.value := 0
				MyCheckRelacionGif.value := 0
				MyDropDownListEfectoEntradaGif.value := 1
				MyUpDownEfectoEntradaGif.value := 1000
				
				MyDropDownListEfectoSalidaGif.value := 1
				MyUpDownEfectoSalidaGif.value := 1000
				MyUpDownTiempoEntradaGif.value := 2
				MyCheckBarradeTareasGif.value := 0
				
				MyCheckVoltearEntradaGif.value := 0
				MyCheckVoltearSalidaGif.value := 0
				
				MyCheckUsarSegundaCuenta.value := 0
				
				try
					MyLV.Modify(1, "Select")

			}
			else
				ControlSetText NumRestablecer "...", Gui
		
		}
	}
	
	Gui_BNo(*)
	{
		MyButtonYes.Visible := 0
		MyButtonNo.Visible := 0
		MyButtonGuardar.Visible := 1	
	}
	
	Gui_BYes(*)
	{
		MyButtonYes.Visible := 0
		MyButtonNo.Visible := 0
		MyButtonGuardar.Visible := 1
		
		SaveData := MyGui.Submit(0)
			
		global DarkMode
		RestMenu := 0
		if DarkMode != SaveData.DarkMode
			RestMenu := 1
		
		global IniciarConWindows := SaveData.initialize
		global ActIni := SaveData.ActIni
		global DarkMode := SaveData.DarkMode
		global AbrirWebAlConectarse := SaveData.webopenAlConectarse
		global WebAlConectarse := SaveData.MyEditWebAlConectarse
		global AbrirWebAlDesconocer := SaveData.webopenAlDesconocer 
		global WebAlDesconocer := SaveData.MyEditWebAlDesconocer
		global AbrirWebAlDesconectarse := SaveData.webopenAlDesconectarse
		global WebAlDesconectarse := SaveData.MyEditWebAlDesconectarse
		global AbrirWebAlError := SaveData.webopenAlError
		global WebAlError := SaveData.MyEditWebAlError
		global WebOption := SaveData.MyCheckWebOption
		global VerificarConxCada := SaveData.MyUpDown
		global VerificarConx := SaveData.MyUpDownConx
		global VerificarPingCada := SaveData.MyUpDownVerificarPingCada
		global NotiConectado := SaveData.Conectado
		global NotiNacional := SaveData.Nacional
		global NotiDesconectado := SaveData.Desconectado
		global NotiError := SaveData.Error
		global WebConectado := SaveData.MyCheckConectado
		global WebDesconocido := SaveData.MyCheckDesconocido
		global WebDesconectado := SaveData.MyCheckDesconectado
		global SoundConectado := SaveData.SoundConectado 
		global SoundNacional := SaveData.SoundNacional
		global SoundDesconectado := SaveData.SoundDesconectado 
		global SoundError := SaveData.SoundError
		global EditConectado := SaveData.MyEditConectado 
		global EditNacional := SaveData.MyEditNacional 
		global EditDesconectado := SaveData.MyEditDesconectado
		
		global UsarSegundaCuenta := SaveData.UsarSegundaCuenta
		
		global EditUser1
		global EditPassword1
		global EditUser2
		global EditPassword2
		
		if UsarSegundaCuenta
		{
			global EditUser2 := SaveData.MyEditUser 
			global EditPassword2 := SaveData.MyEditPassword 
		}
		else
		{
			global EditUser1 := SaveData.MyEditUser 
			global EditPassword1 := SaveData.MyEditPassword 
		}
		global DataPers := SaveData.MyDataPers
		global EditDataPers := SaveData.MyEditDataPers 
		global EditPageLogin := SaveData.MyEditPageLogin
		global WebOffAccount := SaveData.MyWebOffAccount
		global EditWebOffAccount := SaveData.MyEditWebOffAccount
		global IniFileReadTime := SaveData.MyIniFileReadTime
		global EditIniFileReadTime := SaveData.MyEditIniFileReadTime
		
		global Temporizador := SaveData.Temporizador
		global TemporizadorH := SaveData.TemporizadorH
		global TemporizadorM := SaveData.TemporizadorM
		global TemporizadorS := SaveData.TemporizadorS
		global TemporizadorNotiIcon := SaveData.TempNotiIcon
		global TemporizadorNotiTooltip := SaveData.TempNotiTooltip
		global TemporizadorNotiWindows := SaveData.TempNotiWindows
		global NotiGifError := SaveData.NotiGifError 
		global NotiGifDesconectado := SaveData.NotiGifDesconectado
		global NotiGifNacional := SaveData.NotiGifNacional
		global NotiGifConectado := SaveData.NotiGifConectado
		
		
		global NotiNormal := SaveData.NotiNormal
		
		global ConectadoGif := SaveData.ConectadoGif
		global DesconocidoGif := SaveData.DesconocidoGif
		global DesconectadoGif := SaveData.DesconectadoGif
		global ErrorGif := SaveData.ErrorGif
		
		global LenguajeText
		
		restlanguaje := 0
		if (LenguajeText != MyDropDownLenguaje.Text)
			restlanguaje := 1
		
		global LenguajeText := MyDropDownLenguaje.Text

		global PosVGif1
		global TamanodelGif1
		global AnchoGif1
		global LargoGif1
		global RelacionGif1
		global EfectoEntradaGif1
		global UpDownEfectoEntradaGif1
		global UpDownTiempoEntradaGif1
		global EfectoSalidaGif1
		global UpDownEfectoSalidaGif1
		global GifSelected1
		global GifSelectedText1
		global BarradeTareasGif1

		global PosVGif2
		global TamanodelGif2
		global AnchoGif2
		global LargoGif2
		global RelacionGif2
		global EfectoEntradaGif2
		global UpDownEfectoEntradaGif2
		global UpDownTiempoEntradaGif2
		global EfectoSalidaGif2
		global UpDownEfectoSalidaGif2
		global GifSelected2
		global GifSelectedText2
		global BarradeTareasGif2

		global PosVGif3
		global TamanodelGif3
		global AnchoGif3
		global LargoGif3
		global RelacionGif3
		global EfectoEntradaGif3
		global UpDownEfectoEntradaGif3
		global UpDownTiempoEntradaGif3
		global EfectoSalidaGif3
		global UpDownEfectoSalidaGif3
		global GifSelected3
		global GifSelectedText3
		global BarradeTareasGif3

		global PosVGif4
		global TamanodelGif4
		global AnchoGif4
		global LargoGif4
		global RelacionGif4
		global EfectoEntradaGif4
		global UpDownEfectoEntradaGif4
		global UpDownTiempoEntradaGif4
		global EfectoSalidaGif4
		global UpDownEfectoSalidaGif4
		global GifSelected4
		global GifSelectedText4
		global BarradeTareasGif4
		
		global VoltearEntradaGif1
		global VoltearSalidaGif1

		global VoltearEntradaGif2
		global VoltearSalidaGif2

		global VoltearEntradaGif3
		global VoltearSalidaGif3

		global VoltearEntradaGif4
		global VoltearSalidaGif4
		
		NumberToSave := 0
		if ConectadoGif
			NumberToSave := 1
		else if DesconocidoGif
			NumberToSave := 2
		else if DesconectadoGif
			NumberToSave := 3
		else if ErrorGif
			NumberToSave := 4
		
		
		PosVGif%NumberToSave% := SaveData.PosVGif
		TamanodelGif%NumberToSave% := SaveData.TamanodelGif
		AnchoGif%NumberToSave% := SaveData.AnchoGif
		LargoGif%NumberToSave% := SaveData.LargoGif
		RelacionGif%NumberToSave% := SaveData.RelacionGif
		EfectoEntradaGif%NumberToSave% := MyDropDownListEfectoEntradaGif.Value
		UpDownEfectoEntradaGif%NumberToSave% := SaveData.UpDownEfectoEntradaGif
		UpDownTiempoEntradaGif%NumberToSave% := SaveData.UpDownTiempoEntradaGif
		EfectoSalidaGif%NumberToSave% := MyDropDownListEfectoSalidaGif.Value
		UpDownEfectoSalidaGif%NumberToSave% := SaveData.UpDownEfectoSalidaGif
		VoltearEntradaGif%NumberToSave% := SaveData.VoltearEntradaGif
		VoltearSalidaGif%NumberToSave% := SaveData.VoltearSalidaGif
		BarradeTareasGif%NumberToSave% := SaveData.BarradeTareasGif
	
		if (MyLV.GetNext() != 0)
			GifSelected%NumberToSave% := MyLV.GetNext()
		else 
			GifSelected%NumberToSave% := 1
		
		GifSelectedText%NumberToSave% := MyLV.GetText(GifSelected%NumberToSave%) 

		
		if WebOffAccount
		{
			if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
				A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
			else
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
		}
		else
		{
			global CuentaOn
			if (!CuentaOn)
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
			else
				A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
		}
		
		
		if Temporizador
		{
			if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
			{
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
				A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
			}
			else
			{
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
			}
		}
		else
		{
			if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
			{
				A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
			}
			else
			{
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
			}
		}
		

		if NotiGifConectado
			MyRadioGroupConectadoGif.Enabled := 1
		else
			MyRadioGroupConectadoGif.Enabled := 0
			
		if NotiGifNacional
			MyRadioGroupDesconocidoGif.Enabled := 1
		else
			MyRadioGroupDesconocidoGif.Enabled := 0
			
		if NotiGifDesconectado
			MyRadioGroupDesconectadoGif.Enabled := 1
		else
			MyRadioGroupDesconectadoGif.Enabled := 0
			
		if NotiGifError
			MyRadioGroupErrorGif.Enabled := 1
		else
			MyRadioGroupErrorGif.Enabled := 0


		DllCall(SetPreferredAppMode, "int", DarkMode) ; Dark
		DllCall(FlushMenuThemes)
		
		
		options := "[settings]`n"
		options .= "IniciarConWindows=" SaveData.initialize "`n"
		options .= "ActIni=" SaveData.ActIni "`n"
		options .= "DarkMode=" SaveData.DarkMode "`n"
		options .= "AbrirWebAlConectarse=" SaveData.webopenAlConectarse "`n"
		options .= "WebAlConectarse=" SaveData.MyEditWebAlConectarse "`n"
		options .= "AbrirWebAlDesconocer=" SaveData.webopenAlDesconocer "`n"
		options .= "WebAlDesconocer=" SaveData.MyEditWebAlDesconocer "`n"
		options .= "AbrirWebAlDesconectarse=" SaveData.webopenAlDesconectarse "`n"
		options .= "WebAlDesconectarse=" SaveData.MyEditWebAlDesconectarse "`n"
		options .= "AbrirWebAlError=" SaveData.webopenAlError "`n"
		options .= "WebAlError=" SaveData.MyEditWebAlError ",`n"
		options .= "WebOption=" SaveData.MyCheckWebOption "`n"
		options .= "VerificarConxCada=" SaveData.MyUpDown "`n"
		options .= "VerificarConx=" SaveData.MyUpDownConx "`n"
		options .= "NotiConectado=" SaveData.Conectado "`n"
		options .= "NotiNacional=" SaveData.Nacional "`n"
		options .= "NotiDesconectado=" SaveData.Desconectado "`n"
		options .= "NotiError=" SaveData.Error "`n"
		options .= "SoundConectado=" SaveData.SoundConectado "`n"
		options .= "SoundNacional=" SaveData.SoundNacional "`n"
		options .= "SoundDesconectado=" SaveData.SoundDesconectado  "`n"
		options .= "SoundError=" SaveData.SoundError "`n"
		options .= "EditConectado=" SaveData.MyEditConectado "`n"
		options .= "EditNacional=" SaveData.MyEditNacional "`n"
		options .= "EditDesconectado=" SaveData.MyEditDesconectado "`n"
		options .= "EditUser1=" EditUser1 "`n"
		options .= "EditPassword1=" EditPassword1 "`n"
		options .= "EditUser2=" EditUser2 "`n"
		options .= "EditPassword2=" EditPassword2 "`n"
		options .= "DataPers=" SaveData.MyDataPers "`n"
		options .= "EditDataPers=" SaveData.MyEditDataPers "`n"
		options .= "EditPageLogin=" SaveData.MyEditPageLogin "`n"
		options .= "WebOffAccount=" SaveData.MyWebOffAccount "`n"
		options .= "EditWebOffAccount=" SaveData.MyEditWebOffAccount "`n"
		options .= "IniFileReadTime=" SaveData.MyIniFileReadTime "`n"
		options .= "EditIniFileReadTime=" SaveData.MyEditIniFileReadTime "`n"
		options .= "WebConectado=" SaveData.MyCheckConectado "`n"
		options .= "WebDesconocido=" SaveData.MyCheckDesconocido "`n"
		options .= "WebDesconectado=" SaveData.MyCheckDesconectado "`n"
		options .= "VerificarPingCada=" SaveData.MyUpDownVerificarPingCada "`n"
		options .= "CuentaOn=" CuentaOn "`n"
		options .= "TemporizadorH=" SaveData.TemporizadorH "`n"
		options .= "TemporizadorM=" SaveData.TemporizadorM "`n"
		options .= "TemporizadorS=" SaveData.TemporizadorS "`n"
		options .= "TemporizadorNotiIcon=" SaveData.TempNotiIcon "`n"
		options .= "TemporizadorNotiTooltip=" SaveData.TempNotiTooltip "`n"
		options .= "TemporizadorNotiWindows=" SaveData.TempNotiWindows "`n"
		options .= "NotiGifError=" SaveData.NotiGifError  "`n"
		options .= "NotiGifDesconectado=" SaveData.NotiGifDesconectado "`n"
		options .= "NotiGifNacional=" SaveData.NotiGifNacional "`n"
		options .= "NotiGifConectado=" SaveData.NotiGifConectado "`n"
		options .= "NotiNormal=" SaveData.NotiNormal "`n"
		options .= "ConectadoGif=" SaveData.ConectadoGif "`n"
		options .= "DesconocidoGif=" SaveData.DesconocidoGif "`n"
		options .= "DesconectadoGif=" SaveData.DesconectadoGif "`n"
		options .= "ErrorGif=" SaveData.ErrorGif "`n"
		
		options .= "PosVGif1=" PosVGif1 "`n"
		options .= "TamanodelGif1=" TamanodelGif1 "`n"
		options .= "AnchoGif1=" AnchoGif1 "`n"
		options .= "LargoGif1=" LargoGif1 "`n"
		options .= "RelacionGif1=" RelacionGif1 "`n"
		options .= "EfectoEntradaGif1=" EfectoEntradaGif1 "`n"
		options .= "UpDownEfectoEntradaGif1=" UpDownEfectoEntradaGif1 "`n"
		options .= "UpDownTiempoEntradaGif1=" UpDownTiempoEntradaGif1 "`n"
		options .= "EfectoSalidaGif1=" EfectoSalidaGif1 "`n"
		options .= "GifSelected1=" GifSelected1 "`n"
		options .= "UpDownEfectoSalidaGif1=" UpDownEfectoSalidaGif1 "`n"
		options .= "GifSelected1=" GifSelected1 "`n"
		options .= "GifSelectedText1=" GifSelectedText1 "`n"
		options .= "BarradeTareasGif1=" BarradeTareasGif1 "`n"
		
		options .= "PosVGif2=" PosVGif2 "`n"
		options .= "TamanodelGif2=" TamanodelGif2 "`n"
		options .= "AnchoGif2=" AnchoGif2 "`n"
		options .= "LargoGif2=" LargoGif2 "`n"
		options .= "RelacionGif2=" RelacionGif2 "`n"
		options .= "EfectoEntradaGif2=" EfectoEntradaGif2 "`n"
		options .= "UpDownEfectoEntradaGif2=" UpDownEfectoEntradaGif2 "`n"
		options .= "UpDownTiempoEntradaGif2=" UpDownTiempoEntradaGif2 "`n"
		options .= "EfectoSalidaGif2=" EfectoSalidaGif2 "`n"
		options .= "GifSelected2=" GifSelected2 "`n"
		options .= "UpDownEfectoSalidaGif2=" UpDownEfectoSalidaGif2 "`n"
		options .= "GifSelected2=" GifSelected2 "`n"
		options .= "GifSelectedText2=" GifSelectedText2 "`n"
		options .= "BarradeTareasGif2=" BarradeTareasGif2 "`n"
		
		options .= "PosVGif3=" PosVGif3 "`n"
		options .= "TamanodelGif3=" TamanodelGif3 "`n"
		options .= "AnchoGif3=" AnchoGif3 "`n"
		options .= "LargoGif3=" LargoGif3 "`n"
		options .= "RelacionGif3=" RelacionGif3 "`n"
		options .= "EfectoEntradaGif3=" EfectoEntradaGif3 "`n"
		options .= "UpDownEfectoEntradaGif3=" UpDownEfectoEntradaGif3 "`n"
		options .= "UpDownTiempoEntradaGif3=" UpDownTiempoEntradaGif3 "`n"
		options .= "EfectoSalidaGif3=" EfectoSalidaGif3 "`n"
		options .= "GifSelected3=" GifSelected3 "`n"
		options .= "UpDownEfectoSalidaGif3=" UpDownEfectoSalidaGif3 "`n"
		options .= "GifSelected3=" GifSelected3 "`n"
		options .= "GifSelectedText3=" GifSelectedText3 "`n"
		options .= "BarradeTareasGif3=" BarradeTareasGif3 "`n"

		options .= "PosVGif4=" PosVGif4 "`n"
		options .= "TamanodelGif4=" TamanodelGif4 "`n"
		options .= "AnchoGif4=" AnchoGif4 "`n"
		options .= "LargoGif4=" LargoGif4 "`n"
		options .= "RelacionGif4=" RelacionGif4 "`n"
		options .= "EfectoEntradaGif4=" EfectoEntradaGif4 "`n"
		options .= "UpDownEfectoEntradaGif4=" UpDownEfectoEntradaGif4 "`n"
		options .= "UpDownTiempoEntradaGif4=" UpDownTiempoEntradaGif4 "`n"
		options .= "EfectoSalidaGif4=" EfectoSalidaGif4 "`n"
		options .= "GifSelected4=" GifSelected4 "`n"
		options .= "UpDownEfectoSalidaGif4=" UpDownEfectoSalidaGif4 "`n"
		options .= "GifSelected4=" GifSelected4 "`n"
		options .= "GifSelectedText4=" GifSelectedText4 "`n"
		options .= "BarradeTareasGif4=" BarradeTareasGif4 "`n"
		
		options .= "VoltearEntradaGif1=" VoltearEntradaGif1 "`n"
		options .= "VoltearSalidaGif1=" VoltearSalidaGif1 "`n"
		
		options .= "VoltearEntradaGif2=" VoltearEntradaGif2 "`n"
		options .= "VoltearSalidaGif2=" VoltearSalidaGif2 "`n"
		
		options .= "VoltearEntradaGif3=" VoltearEntradaGif3 "`n"
		options .= "VoltearSalidaGif3=" VoltearSalidaGif3 "`n"
		
		options .= "VoltearEntradaGif4=" VoltearEntradaGif4 "`n"
		options .= "VoltearSalidaGif4=" VoltearSalidaGif4 "`n"
		options .= "UsarSegundaCuenta=" SaveData.UsarSegundaCuenta "`n"
		options .= "LenguajeText=" LenguajeText
		
		if FileExist("options.ini")
			FileDelete "options.ini"	

		FileAppend options, "options.ini"
		
		if RestMenu
		{
			Gui_BClose
			Settings
		}
		

		MsgBox(LenguajeList.Mensajes["Msgbox2"], TitteGUI, "Ok")
		
		if restlanguaje
		{
			restlanguaje := 0
			A_TrayMenu.Delete()
			Gui_BClose
			LangChange(MyDropDownLenguaje.Text)
			TrayMenuCreate
			Settings
		}
		
		
	}
	
	
	Gui_BGuardar(Gui, *)
	{
		MyButtonGuardar.Visible := 0
		MyButtonYes.Visible := 1
		MyButtonNo.Visible := 1
	}
	
}
	
Gui_BClose(*)
{
	global TitteGUI
	WinClose TitteGUI
}

Gui_Escape(thisgui)
{
	WinClose thisgui
}


SetDarkMode(MyGui, *)
{
	global DarkColors          := Map("Background", "0x202020", "Controls", "0x404040", "Font", "0xE0E0E0")
	global TextBackgroundBrush := DllCall("gdi32\CreateSolidBrush", "UInt", DarkColors["Background"], "Ptr")
	global DarkMode

	if VerCompare(A_OSVersion, "10.0.17763") >= 0 {
		attr := 19
		if VerCompare(A_OSVersion, "10.0.18985") >= 0
			attr := 20 ; DWMWA_USE_IMMERSIVE_DARK_MODE is officially defined for 10.0.22000 as 20.
		DllCall("dwmapi\DwmSetWindowAttribute", "ptr", MyGui.hWnd, "int", attr, "int*", DarkMode, "int", 4)
	}
	
	static ES_MULTILINE       := 0x0004
	static LV_Init            := False
	static LVM_GETTEXTCOLOR   := 0x1023
	static LVM_SETTEXTCOLOR   := 0x1024
	static LVM_GETTEXTBKCOLOR := 0x1025
	static LVM_SETTEXTBKCOLOR := 0x1026
	static LVM_GETBKCOLOR     := 0x1000
	static LVM_SETBKCOLOR     := 0x1001
	static LVM_GETHEADER      := 0x101F
	static GWL_STYLE          := -16
	static GetWindowLong      := A_PtrSize = 8 ? "GetWindowLongPtr" : "GetWindowLong"
	Mode_Explorer  := (DarkMode ? "DarkMode_Explorer"  : "Explorer" )
	Mode_CFD       := (DarkMode ? "DarkMode_CFD"       : "CFD"      )
	Mode_ItemsView := (DarkMode ? "DarkMode_ItemsView" : "ItemsView")
	
	for hWnd, GuiCtrlObj in MyGui
	{
		switch GuiCtrlObj.Type
		{
			case "Button", "CheckBox", "ListBox", "UpDown":
			{
				DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_Explorer, "Ptr", 0)
			}
			case "ComboBox", "DDL":
			{
				DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_CFD, "Ptr", 0)
			}
			case "Edit":
			{
				if (DllCall("user32\" GetWindowLong, "Ptr", GuiCtrlObj.hWnd, "Int", GWL_STYLE) & ES_MULTILINE)
				{
					DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_Explorer, "Ptr", 0)
				}
				else
				{
					DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_CFD, "Ptr", 0)
				}
			}
			case "ListView":
			{
				if !(LV_Init)
				{
					static LV_TEXTCOLOR   := SendMessage(LVM_GETTEXTCOLOR,   0, 0, GuiCtrlObj.hWnd)
					static LV_TEXTBKCOLOR := SendMessage(LVM_GETTEXTBKCOLOR, 0, 0, GuiCtrlObj.hWnd)
					static LV_BKCOLOR     := SendMessage(LVM_GETBKCOLOR,     0, 0, GuiCtrlObj.hWnd)
					LV_Init := True
				}
				GuiCtrlObj.Opt("-Redraw")
				switch DarkMode
				{
					case True:
					{
						SendMessage(LVM_SETTEXTCOLOR,   0, DarkColors["Font"],       GuiCtrlObj.hWnd)
						SendMessage(LVM_SETTEXTBKCOLOR, 0, DarkColors["Background"], GuiCtrlObj.hWnd)
						SendMessage(LVM_SETBKCOLOR,     0, DarkColors["Background"], GuiCtrlObj.hWnd)
					}
					default:
					{
						SendMessage(LVM_SETTEXTCOLOR,   0, LV_TEXTCOLOR,   GuiCtrlObj.hWnd)
						SendMessage(LVM_SETTEXTBKCOLOR, 0, LV_TEXTBKCOLOR, GuiCtrlObj.hWnd)
						SendMessage(LVM_SETBKCOLOR,     0, LV_BKCOLOR,     GuiCtrlObj.hWnd)
					}
				}
				DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_Explorer, "Ptr", 0)
				
				; To color the selection - scrollbar turns back to normal
				;DllCall("uxtheme\SetWindowTheme", "Ptr", GuiCtrlObj.hWnd, "Str", Mode_ItemsView, "Ptr", 0)

				; Header Text needs some NM_CUSTOMDRAW coloring
				LV_Header := SendMessage(LVM_GETHEADER, 0, 0, GuiCtrlObj.hWnd)
				DllCall("uxtheme\SetWindowTheme", "Ptr", LV_Header, "Str", Mode_ItemsView, "Ptr", 0)
				GuiCtrlObj.Opt("+Redraw")
			}
		}
	}
	
	static SetWindowLong := A_PtrSize = 8 ? "SetWindowLongPtr" : "SetWindowLong"
	static GWL_WNDPROC        := -4
	
	global DarkColors          := Map("Background", "0x202020", "Controls", "0x404040", "Font", "0xE0E0E0")
	global TextBackgroundBrush := DllCall("gdi32\CreateSolidBrush", "UInt", DarkColors["Background"], "Ptr")


	global WindowProcNew := CallbackCreate(WindowProc)  ; Avoid fast-mode for subclassing.
	global WindowProcOld := DllCall("user32\" SetWindowLong, "Ptr", MyGui.Hwnd, "Int", GWL_WNDPROC, "Ptr", WindowProcNew, "Ptr")
}
	
OnMessage(0x404, AHK_NOTIFYICON)
OnMessage( 0x200, WM_MOUSEMOVE ) 

WM_MOUSEMOVE( wparam, lparam, msg, hwnd )
{
	if wparam = 1 ; LButton
	{
		global TitteGUI
		try
		{
			if (isset(TitteGUI) and WinExist(TitteGUI))
				PostMessage 0xA1, 2,,, TitteGUI ; WM_NCLBUTTONDOWN
		}
	}
		
}

AHK_NOTIFYICON(wParam, lParam, *) 
{
	if (lParam = 0x203) { 
		global TitteGUI
		try
		{
			if !winexist(TitteGUI)
				Settings
			else
				WinActivate (TitteGUI)
		}
		catch
		{
			Settings
		}
    }
	else if (lParam = 0x200) {
		if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
		{
			global IniFileReadTime
			ToolTip1 := 0
			ToolTip2 := 0
			MouseGetPos &OutputVarX, &OutputVarY
			PosXOld := OutputVarX
			PosYOld := OutputVarY
			
			if !IniFileReadTime
			{
				global StartTime
				global TimeAccount
				global UserNameAccount
				
				
				if (isset(StartTime) and StartTime != 0)	
					ToolTip1 := 1
			}
			
			global Temporizador
			global TemporizadorNotiTooltip
			if Temporizador and TemporizadorNotiTooltip
			{	
				global SecondsTemp
				global StartTimeTemp
				
				if isset(SecondsTemp)
					ToolTip2 := 1 
			}
			
			
			
			While(PosXOld = OutputVarX and PosYOld = OutputVarY)
			{
				if ToolTip1
				{
					ElapsedTime := (A_TickCount - StartTime)//1000
					StartTime := A_TickCount
					
					if !IsInteger(TimeAccount)
					{
						TimeAccount := StrSplit(TimeAccount, ":")
						TimeAccount := TimeAccount[1] * 3600 + TimeAccount[2] * 60 + TimeAccount[3]
					}
					
					TimeAccount := FormatSeconds(TimeAccount - ElapsedTime)
					
					if InStr(A_IconTip, LenguajeList.Mensajes["IconTip5"])
					{
						A_IconTipnew := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount  "`n" LenguajeList.Mensajes["IconTip3"] " " TimeAccount
					}
					else
						A_IconTipnew := LenguajeList.Mensajes["IconTip7"] " " UserNameAccount "`n" LenguajeList.Mensajes["IconTip3"] " " TimeAccount
					
					if (A_IconTip != A_IconTipnew)
						A_IconTip := A_IconTipnew
				}
				
				if ToolTip2
				{
					TimeRestTemp := SecondsTemp - (A_TickCount - StartTimeTemp)//1000
					if (TimeRestTemp < 0)
						TimeRestTemp := 0
					if !InStr(A_IconTip, "Temporizador")
						global AIconTipold := A_IconTip
						
					A_IconTip := AIconTipold "`n" LenguajeList.Mensajes["IconTip4"] " " FormatSeconds(TimeRestTemp)
				}
				
				MouseGetPos &OutputVarX, &OutputVarY
				sleep(1)
			}	
			
			
		}
	}
}
	
try
{
	if FileExist("Actualizar.exe.new")
	{
		if ProcessExist("Actualizar.exe")
		{
			ProcessClose "Actualizar.exe"
			ProcessWaitClose("Actualizar.exe", 10)
		}
		
		FileMove A_WorkingDir "\Actualizar.exe.new", A_WorkingDir "\Actualizar.exe", 1
	}
}
	
SetTimer VerefyConx, (VerificarConxCada * 1000)

VerefyConx()
{
	global TitteGUI
	
	if !isset(TitteGUI)
		TitteGUI := false
	
	if !winexist(TitteGUI) or !TitteGUI
	{
		global WinAutoRunVerify
		global IniciarConWindows
	   
		if IniciarConWindows and WinAutoRunVerify
		{
			try 
			{
				if (RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "InternetNotification") != '"' A_AhkPath '"')
					RegWrite '"' A_AhkPath '"', "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "InternetNotification"
			}
			catch
				RegWrite '"' A_AhkPath '"', "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "InternetNotification"
				
			WinAutoRunVerify := false
			
		} else if !IniciarConWindows and !WinAutoRunVerify
		{
			try
				RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "InternetNotification"
			WinAutoRunVerify := true
		}
		

		global AbrirWebAlConectarse
		global WebAlConectarse
		
		global AbrirWebAlDesconocer
		global WebAlDesconocer
		
		global AbrirWebAlDesconectarse
		global WebAlDesconectarse
		
		global AbrirWebAlError
		global WebAlError

		global VerificarConx
		global VerificarPingCada
		global NotiConectado
		global NotiNacional
		global NotiDesconectado
		global NotiError
		
		global WebAlreadyAlConectarse
		global WebAlreadyAlDesconocer
		global WebAlreadyAlDesconectarse
		global WebAlreadyAlError
		
		global WebConectado 
		global WebDesconocido 
		global WebDesconectado 
		
		global WebOption
		
		global SoundConectado
		global SoundNacional
		global SoundDesconectado
		global SoundError
		global EditConectado
		global EditNacional
		global EditDesconectado
		
		global IniFileReadTime
		global EditIniFileReadTime
		global CuentaOn
			
		Ping := 0

		global StartTime
		global TimeAccount
		global UserNameAccount
		global WebOffAccount
		
		global StartTimeTemp
		global SecondsTemp
		global Temporizador
		
		
		global TemporizadorH
		global TemporizadorM
		global TemporizadorS
		
		global NotificationTemp
		global NotificationTempIcon
		global TemporizadorNotiIcon
		global TemporizadorNotiWindows
		
		global NotiNormal
		
		global NotiGifConectado
		global NotiGifNacional
		global NotiGifDesconectado
		global NotiGifError
		
		Efectos := StrSplit(LenguajeList.GIF["EfectosTexto2"], ",")
		
		Webs := []
		if WebConectado
			Webs.InsertAt(0, EditConectado)
		if WebDesconocido
			Webs.InsertAt(0, EditNacional)
		if WebDesconectado
			Webs.InsertAt(0, EditDesconectado)

		if (Webs.Length != 0)
		{
			For w in Webs
			{
				IpResolve := "Failed"
				IpResolve := ResolveHostname(w)
				if(IpResolve != "Failed")
				{
					DataEnv := IpResolve " " VerificarPingCada " " VerificarConx
					
					if !ProcessExist("PingHostName.exe")
					{
						try
						{
							Run "PingHostName.exe"
							Prev_DetectHiddenWindows := A_DetectHiddenWindows
							DetectHiddenWindows True
							timeleft := 0
							while (!WinExist("ahk_exe PingHostName.exe") and timeleft < 5000)
							{
								timeleft += 10
								sleep(10)
							}
							DetectHiddenWindows Prev_DetectHiddenWindows  ; Restore original setting for the caller.
						}
						catch
							exitapp
					}
							
					if !ProcessExist("PingHostName.exe")
						exitapp
					  
					try
						Ping := Send_WM_COPYDATA(DataEnv, "ahk_exe PingHostName.exe")
						
					if (Ping != 0 and Ping != 1)
						Ping := 0

					if Ping
					{
						if (w != EditDesconectado)
						{
							if (w = EditConectado)
							{ 
								if (A_IconNumber != 5 and A_IconNumber != 6 and A_IconNumber != 7 and A_IconNumber != 8 and A_IconNumber != 9 and A_IconNumber != 10)
								{
									try
										TraySetIcon("Icons.dll", 5) ;8
										
									A_TrayMenu.Enable(LenguajeList.BarraMenu["BuscarActualizacion"])
										
									A_IconTip := LenguajeList.Mensajes["IconTip5"]
										
									if !IniFileReadTime
									{
										if FileExist("LoginDataInfo.txt")
										{
											if (CuentaOn)
											{
												IpResolveEtecsa := "Failed"
												IpResolveEtecsa := ResolveHostname("secure.etecsa.net")
												
												if(IpResolveEtecsa != "Failed")
												{	
													DataEnv := IpResolveEtecsa " " VerificarPingCada " " VerificarConx
								
													if !ProcessExist("PingHostName.exe")
													{
														try
														{
															Run "PingHostName.exe"
															Prev_DetectHiddenWindows := A_DetectHiddenWindows
															DetectHiddenWindows True
															timestart := A_TickCount
															while (!WinExist("ahk_exe PingHostName.exe") and (A_TickCount - timestart) < 5000)
																sleep(10)
															
															DetectHiddenWindows Prev_DetectHiddenWindows  ; Restore original setting for the caller.
														}
														catch
															exitapp
													}
															
													if !ProcessExist("PingHostName.exe")
														exitapp
														
													PingEtecsa := 0

													try
														PingEtecsa := Send_WM_COPYDATA(DataEnv, "ahk_exe PingHostName.exe")
														
													if (PingEtecsa != 0 and PingEtecsa != 1)
														PingEtecsa := 0

													If PingEtecsa
													{
														Text := FileRead("LoginDataInfo.txt")
														
														FoundPosAT := InStr(Text, "ATTRIBUTE_UUID")
														ATTRIBUTE_UUID := SubStr(Text, FoundPosAT, (InStr(Text, '"', , FoundPosAT)-FoundPosAT))
														
														FoundPosLI:= InStr(Text, "loggerId")
														loggerId := SubStr(Text, FoundPosLI, (InStr(Text, '"', , FoundPosLI)-FoundPosLI))
														
														FoundPosUN:= InStr(Text, "username")
														username := SubStr(Text, FoundPosUN, (InStr(Text, '"', , FoundPosUN)-FoundPosUN))
														
														usernamearray := StrSplit(username, "=",, 2)

														try
														{
															requestdata := "op=getLeftTime&" ATTRIBUTE_UUID "&" loggerId "&" username
															whr := ComObject("WinHttp.WinHttpRequest.5.1")
															whr.Open("POST", "https://secure.etecsa.net:8443/EtecsaQueryServlet")
															whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
															whr.Send(requestdata)
															
															if (whr.ResponseText = "errorop")
															{
																FileDelete "LoginDataInfo.txt"
																StartTime := 0
															}
															else
															{
																A_IconTip := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " usernamearray[2] "`n" LenguajeList.Mensajes["IconTip3"] " " whr.ResponseText
																
																StartTime := A_TickCount
																
																UserNameAccount := usernamearray[2]
																aTime := StrSplit(whr.ResponseText, ":")
																SecondsaTime := aTime[1] * 3600 + aTime[2] * 60 + aTime[3]
																TimeAccount := SecondsaTime
															}
														}
													}
												}
											}
										}
									}
									
									A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])		
									
									if WebOffAccount
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
									else if (!CuentaOn)
										A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
									else
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
										
									
									if !Temporizador
									{
										A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
										A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
									}
									else
									{
										A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
									}
											
										
									
									if AbrirWebAlConectarse
									{
										if (WebAlConectarse != "")
										{
											WebVerify := StrSplit(WebAlConectarse, [":", "."])
											if (WebVerify[1] == "https" or WebVerify[1] == "http" or WebVerify[1] == "www")
												WebPageVisit := WebAlConectarse
											else
												WebPageVisit := "https://" WebAlConectarse
												
											if WebOption
											{
												if (!IsSet(WebAlreadyAlConectarse) or !ProcessExist(WebAlreadyAlConectarse))
												{
													Run WebPageVisit,,,&OutputVarPID
													ProcessName := ProcessGetName(OutputVarPID)
													WebAlreadyAlConectarse := ProcessName
												}
											}
											else
												Run WebPageVisit	
										}
									}
									
								
									
									if IniFileReadTime
									{
										;ftp://invitado:invitado@192.168.20.1/InternetAccount.ini
										try
											Download EditIniFileReadTime, "InternetAccount.ini"
										
										try
										{
											if FileExist("InternetAccount.ini")
											{
												Account := IniRead("InternetAccount.ini", "Info", "Cuenta")
												Saldo := IniRead("InternetAccount.ini", "Info", "Saldo")
												Factor := IniRead("InternetAccount.ini", "Info", "FactorHoras")
												Tiempo := Integer((Saldo/Factor)*3600)
												Horas := Tiempo//3600 ":" FormatTime(DateAdd(19990101, Tiempo, "Seconds"), "mm:ss")
												
												A_IconTip := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " Account "`n" LenguajeList.Mensajes["IconTip3"] " " Horas
												
												FileDelete "InternetAccount.ini"
											}
										}
									}
		
									if (SoundConectado != "none")
									{
										try
											SoundPlay A_WorkingDir "\Sonidos\" SoundConectado
									}
									if NotiConectado
										TrayTip A_IconTip,, "Mute"
										
									if NotiGifConectado
									{
										global GifSelectedText1
										global EfectoEntradaGif1
										global PosVGif1
										global UpDownEfectoEntradaGif1
										global UpDownTiempoEntradaGif1
										global EfectoSalidaGif1
										global UpDownEfectoSalidaGif1
										global BarradeTareasGif1
										
										PlayGiftAction(GifSelectedText1, EfectoEntradaGif1, PosVGif1, UpDownEfectoEntradaGif1, UpDownTiempoEntradaGif1, EfectoSalidaGif1, UpDownEfectoSalidaGif1, BarradeTareasGif1)
									}
								}
								
								if Temporizador
								{
									if (!isset(SecondsTemp) or SecondsTemp = 0)
									{
										SecondsTemp := TemporizadorH * 3600 + TemporizadorM * 60 + TemporizadorS
										if (SecondsTemp = 0)
										{
											Temporizador := 0
											if NotiNormal
												TrayTip LenguajeList.Mensajes["TrayTip8"], LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
											A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
										}
										else
										{
											A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
											StartTimeTemp := A_TickCount
										}
									}
									else
									{
										ElapsedTimeTemp := (A_TickCount - StartTimeTemp)//1000
									
										if TemporizadorNotiWindows
										{
											if (!isset(NotificationTemp) or NotificationTemp = 0)
											{
												TrayTip FormatSeconds(SecondsTemp),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
												NotificationTemp := 1
											}
											else 
											{
												DivisionPartTemp := (SecondsTemp//4)

												if (DivisionPartTemp != 0)
												{
													if (NotificationTemp != 4 and NotificationTemp != 5)
													{
														if (ElapsedTimeTemp >= ((NotificationTemp * DivisionPartTemp)))
														{
															TrayTip FormatSeconds(SecondsTemp-ElapsedTimeTemp),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp += 1
														}
													}
													else if (NotificationTemp = 4)
													{
														DivisionPartTempFinal := DivisionPartTemp//3
														if (ElapsedTimeTemp >= (((NotificationTemp-1) * DivisionPartTemp)+(DivisionPartTempFinal*2)))	
														{
															TrayTip LenguajeList.Mensajes["TrayTip9"] FormatSeconds(SecondsTemp-ElapsedTimeTemp), LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp += 1
														}
													}
													else if (NotificationTemp = 5)
													{
														if (ElapsedTimeTemp >= SecondsTemp)
														{
															TrayTip LenguajeList.Mensajes["TrayTip10"] FormatSeconds(0), LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp := 0
														}
													}
												}
												else
												{	
													if NotiNormal
														TrayTip LenguajeList.Mensajes["TrayTip11"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
													TemporizadorNotiWindows := 0
													NotificationTemp :=0
												}
											}
										}
										
										if TemporizadorNotiIcon
										{
											if (!isset(NotificationTempIcon) or NotificationTempIcon = 0 )
											{
												NotificationTempIcon :=1
											}
											
											if !isset(DivisionPartTemp)
												DivisionPartTemp := (SecondsTemp//4)
												
											if (DivisionPartTemp != 0)
											{
												if (NotificationTempIcon != 4 and NotificationTempIcon != 5)
												{
													if (ElapsedTimeTemp >= ((NotificationTempIcon * DivisionPartTemp)))
													{
														NotificationTempIcon +=1
														try
															TraySetIcon("Icons.dll", (5+NotificationTempIcon))
														
													}
												}
												else if (NotificationTempIcon = 4)
												{
													if !isset(DivisionPartTempFinal)
														DivisionPartTempFinal := DivisionPartTemp//3
													if (ElapsedTimeTemp >= (((NotificationTempIcon-1) * DivisionPartTemp)+(DivisionPartTempFinal*2)))	
													{
														NotificationTempIcon +=1
														try
															TraySetIcon("Icons.dll", (5+NotificationTempIcon))
														
													}
												}
												else if (NotificationTempIcon = 5)
												{
													if (ElapsedTimeTemp >= SecondsTemp)
													{
														NotificationTempIcon :=0
														try
															TraySetIcon("Icons.dll", 5)
														
													}
												}
											}
											else
											{
												if NotiNormal
													TrayTip LenguajeList.Mensajes["TrayTip12"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
												TemporizadorNotiIcon := 0
												NotificationTempIcon :=0
											}
										}
										
										
										if (ElapsedTimeTemp >= SecondsTemp)
										{
											SecondsTemp := 0
											Temporizador := 0
											
											if TemporizadorNotiWindows
											{
												if (NotificationTemp = 5)
												{
													TrayTip LenguajeList.Mensajes["TrayTip10"] FormatSeconds(0),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
													NotificationTemp :=0
												}
											}
											
											if (NotificationTempIcon = 5)
											{
												try
													TraySetIcon("Icons.dll", 5)
												NotificationTempIcon :=0
											}
											
											global AIconTipold
											A_IconTip := AIconTipold
											
											MenuHandler(LenguajeList.BarraMenu["QuitarCuenta"], 4, A_TrayMenu)
											A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
										}
									}
									
									
								}

								break
							} else 
							{
								if (A_IconNumber != 4 and A_IconNumber != 11 and A_IconNumber != 12 and A_IconNumber != 13 and A_IconNumber != 14 and A_IconNumber != 15)
								{
									try
										TraySetIcon("Icons.dll", 4) ;9
										
									A_TrayMenu.Disable(LenguajeList.BarraMenu["BuscarActualizacion"])
									
									A_IconTip := LenguajeList.Mensajes["IconTip6"]
	
									A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])		
									
									if WebOffAccount
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
									else if (!CuentaOn)
										A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
									else
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])

									
									if !Temporizador
									{
										A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
										A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
									}
									else
									{
										A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
										A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
									}
																		
									if AbrirWebAlDesconocer
									{										
										if (WebAlDesconocer != "")
										{
											WebVerify := StrSplit(WebAlDesconocer, [":", "."])
											if (WebVerify[1] == "https" or WebVerify[1] == "http" or WebVerify[1] == "www")
												WebPageVisit := WebAlDesconocer
											else
												WebPageVisit := "https://" WebAlDesconocer
												
											if WebOption
											{
												if (!IsSet(WebAlreadyAlDesconocer) or !WinExist(WebAlreadyAlDesconocer))
												{
													Run WebPageVisit,,,&OutputVarPID
													ProcessName := ProcessGetName(OutputVarPID)
													WebAlreadyAlDesconocer := ProcessName
												}
											}
											else
												Run WebPageVisit	
										}
									}

									
									if (SoundNacional != "none")
									{
										try
											SoundPlay A_WorkingDir "\Sonidos\" SoundNacional
									}
									if NotiNacional
										TrayTip A_IconTip,, "Mute"
										
									if NotiGifNacional
									{
										global GifSelectedText2
										global EfectoEntradaGif2
										global PosVGif2
										global UpDownEfectoEntradaGif2
										global UpDownTiempoEntradaGif2
										global EfectoSalidaGif2
										global UpDownEfectoSalidaGif2
										global BarradeTareasGif2
										
										PlayGiftAction(GifSelectedText2, EfectoEntradaGif2, PosVGif2, UpDownEfectoEntradaGif2, UpDownTiempoEntradaGif2, EfectoSalidaGif2, UpDownEfectoSalidaGif2, BarradeTareasGif2)
									}
								}
								
								if Temporizador
								{
									if (!isset(SecondsTemp) or SecondsTemp = 0)
									{
										SecondsTemp := TemporizadorH * 3600 + TemporizadorM * 60 + TemporizadorS
										if (SecondsTemp = 0)
										{
											Temporizador := 0
											if NotiNormal
												TrayTip LenguajeList.Mensajes["TrayTip8"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
											A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
										}
										else
										{
											A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
											StartTimeTemp := A_TickCount
										}
									}
									else
									{
										ElapsedTimeTemp := (A_TickCount - StartTimeTemp)//1000
									
										if TemporizadorNotiWindows
										{
											if (!isset(NotificationTemp) or NotificationTemp = 0)
											{
												TrayTip FormatSeconds(SecondsTemp),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
												NotificationTemp :=1
											}
											else 
											{
												DivisionPartTemp := (SecondsTemp//4)

												if (DivisionPartTemp != 0)
												{
													if (NotificationTemp != 4 and NotificationTemp != 5)
													{
														if (ElapsedTimeTemp >= ((NotificationTemp * DivisionPartTemp)))
														{
															TrayTip FormatSeconds(SecondsTemp-ElapsedTimeTemp),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp +=1
														}
													}
													else if (NotificationTemp = 4)
													{
														DivisionPartTempFinal := DivisionPartTemp//3
														if (ElapsedTimeTemp >= (((NotificationTemp-1) * DivisionPartTemp)+(DivisionPartTempFinal*2)))	
														{
															TrayTip LenguajeList.Mensajes["TrayTip9"] FormatSeconds(SecondsTemp-ElapsedTimeTemp),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp +=1
														}
													}
													else if (NotificationTemp = 5)
													{
														if (ElapsedTimeTemp >= SecondsTemp)
														{
															TrayTip LenguajeList.Mensajes["TrayTip10"] FormatSeconds(0),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
															NotificationTemp :=0
														}
													}
												}
												else
												{
													if NotiNormal
														TrayTip LenguajeList.Mensajes["TrayTip11"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
													TemporizadorNotiWindows := 0
													NotificationTemp :=0
												}
											}
										}
										
										if TemporizadorNotiIcon
										{
											if (!isset(NotificationTempIcon) or NotificationTempIcon = 0)
											{
												NotificationTempIcon :=1
											}
											
											if !isset(DivisionPartTemp)
												DivisionPartTemp := (SecondsTemp//4)
												
											if (DivisionPartTemp != 0)
											{
												if (NotificationTempIcon != 4 and NotificationTempIcon != 5)
												{
													if (ElapsedTimeTemp >= ((NotificationTempIcon * DivisionPartTemp)))
													{
														NotificationTempIcon +=1
														try
															TraySetIcon("Icons.dll", (5+NotificationTempIcon))
														
													}
												}
												else if (NotificationTempIcon = 4)
												{
													if !isset(DivisionPartTempFinal)
														DivisionPartTempFinal := DivisionPartTemp//3
													if (ElapsedTimeTemp >= (((NotificationTempIcon-1) * DivisionPartTemp)+(DivisionPartTempFinal*2)))	
													{
														NotificationTempIcon +=1
														try
															TraySetIcon("Icons.dll", (5+NotificationTempIcon))
														
													}
												}
												else if (NotificationTempIcon = 5)
												{
													if (ElapsedTimeTemp >= SecondsTemp)
													{
														NotificationTempIcon :=0
														try
															TraySetIcon("Icons.dll", 4)
														
													}
												}
											}
											else
											{
												if NotiNormal
													TrayTip LenguajeList.Mensajes["TrayTip12"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
												TemporizadorNotiIcon := 0
												NotificationTempIcon :=0
											}
										}
										
										
										if (ElapsedTimeTemp >= SecondsTemp)
										{
											SecondsTemp := 0
											Temporizador := 0
											if (NotificationTemp = 5)
											{
												TrayTip LenguajeList.Mensajes["TrayTip10"] FormatSeconds(0),LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
												NotificationTemp :=0
											}
											
											if (NotificationTempIcon = 5)
											{
												try
													TraySetIcon("Icons.dll", 4)
												NotificationTempIcon :=0
											}
											
											global AIconTipold
											A_IconTip := AIconTipold
											
											MenuHandler(LenguajeList.BarraMenu["QuitarCuenta"], 4, A_TrayMenu)
											A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
											A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
										}
									}
								}
									
								break
							}
						} else 
						{
							if (A_IconNumber != 3)
							{
								try
									TraySetIcon("Icons.dll", 3) ;7
									
								A_IconTip := LenguajeList.Mensajes["IconTip8"]
								
								A_TrayMenu.Disable(LenguajeList.BarraMenu["BuscarActualizacion"])
								A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
							
								global EditUser1
								global EditUser2
								global UsarSegundaCuenta
								global DataPers 
								
								if !UsarSegundaCuenta
									EditUser := EditUser1
								else
									EditUser := EditUser2
								
								
								if (EditUser != "" or DataPers != "")
									A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerCuenta"])	
								else
									A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])	
								
								if Temporizador
								{
									Temporizador := 0
									SecondsTemp := 0
									if NotiNormal
										TrayTip LenguajeList.Mensajes["TrayTip13"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
								}
								
								A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
								A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])

								if AbrirWebAlDesconectarse
								{
									if (WebAlDesconectarse != "")
									{
										WebVerify := StrSplit(WebAlDesconectarse, [":", "."])
										if (WebVerify[1] == "https" or WebVerify[1] == "http" or WebVerify[1] == "www")
											WebPageVisit := WebAlDesconectarse
										else
											WebPageVisit := "https://" WebAlDesconectarse
											
										if WebOption
										{
											if (!IsSet(WebAlreadyAlDesconectarse) or !WinExist(WebAlreadyAlDesconectarse))
											{
												Run WebPageVisit,,,&OutputVarPID
												ProcessName := ProcessGetName(OutputVarPID)
												WebAlreadyAlDesconectarse := ProcessName
											}
										}
										else
											Run WebPageVisit	
									}
								}

								if IniFileReadTime
								{
									try
										Download EditIniFileReadTime, "InternetAccount.ini"
									
									try
									{
										if FileExist("InternetAccount.ini")
										{
											Account := IniRead("InternetAccount.ini", "Info", "Cuenta")
											Saldo := IniRead("InternetAccount.ini", "Info", "Saldo")
											
											if (Saldo = "No tiene saldo") 
												A_IconTip := LenguajeList.Mensajes["IconTip9"] " " Account "`n" LenguajeList.Mensajes["IconTip3"] " " Saldo

											FileDelete "InternetAccount.ini"
										}
									}
								}
								
								if (SoundDesconectado != "none")
								{
									try
										SoundPlay A_WorkingDir "\Sonidos\" SoundDesconectado
								}
								if NotiDesconectado
									TrayTip A_IconTip,, "Mute"
									
								if NotiGifDesconectado
								{
									global GifSelectedText3
									global EfectoEntradaGif3
									global PosVGif3
									global UpDownEfectoEntradaGif3
									global UpDownTiempoEntradaGif3
									global EfectoSalidaGif3
									global UpDownEfectoSalidaGif3
									global BarradeTareasGif3
									
									PlayGiftAction(GifSelectedText3, EfectoEntradaGif3, PosVGif3, UpDownEfectoEntradaGif3, UpDownTiempoEntradaGif3, EfectoSalidaGif3, UpDownEfectoSalidaGif3, BarradeTareasGif3)
								}
							}
							break
						}
					}
				}
				Sleep(1)
			}
		}
		
		if !Ping
		{
			if (A_IconNumber != 2)
			{
				try
					TraySetIcon("Icons.dll", 2)
					
				A_IconTip := LenguajeList.Mensajes["IconTip10"]

				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])		
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])	
				A_TrayMenu.Disable(LenguajeList.BarraMenu["BuscarActualizacion"])				
					
				if Temporizador
				{
					Temporizador := 0
					SecondsTemp := 0
					if NotiNormal
						TrayTip LenguajeList.Mensajes["TrayTip13"],LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
				}
				
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])

				if AbrirWebAlError
				{
					if (WebAlError != "")
					{
						WebVerify := StrSplit(WebAlError, [":", "."])
						if (WebVerify[1] == "https" or WebVerify[1] == "http" or WebVerify[1] == "www")
							WebPageVisit := WebAlError
						else
							WebPageVisit := "https://" WebAlError
							
						if WebOption
						{
							if (!IsSet(WebAlreadyAlError) or !WinExist(WebAlreadyAlError))
							{
								Run WebPageVisit,,,&OutputVarPID
								ProcessName := ProcessGetName(OutputVarPID)
								WebAlreadyAlError := ProcessName
							}
						}
						else
							Run WebPageVisit	
					}
				}
			
				
				if (SoundError != "none")
				{
					try
						SoundPlay A_WorkingDir "\Sonidos\" SoundError
				}
				if NotiError
					TrayTip LenguajeList.Mensajes["IconTip10"],, "Mute"
					
				if NotiGifError
				{
					global GifSelectedText4
					global EfectoEntradaGif4
					global PosVGif4
					global UpDownEfectoEntradaGif4
					global UpDownTiempoEntradaGif4
					global EfectoSalidaGif4
					global UpDownEfectoSalidaGif4
					global BarradeTareasGif4
					
					PlayGiftAction(GifSelectedText4, EfectoEntradaGif4, PosVGif4, UpDownEfectoEntradaGif4, UpDownTiempoEntradaGif4, EfectoSalidaGif4, UpDownEfectoSalidaGif4, BarradeTareasGif4)
				}
			}
		}
	}
	sleep(1)
}

PlayGiftAction(GifSelectedText, EfectoEntradaGif, PosVGif, UpDownEfectoEntradaGif, UpDownTiempoEntradaGif, EfectoSalidaGif, UpDownEfectoSalidaGif, BarradeTareasGif, *)
{							
	MyGif := Gui()
	MyGif.Opt("-Caption -Border +AlwaysOnTop +ToolWindow -DPIScale")
	WinSetTransColor 0xf0f0f0, MyGif.Hwnd
	MyGif.MarginX := 0
	MyGif.MarginY := 0
	
	RestPromoted := 0
										
	Loop Reg "HKEY_CURRENT_USER\Control Panel\NotifyIconSettings\", "R KV"
	{
		if (A_LoopRegName = "ExecutablePath")
		{
			Value := RegRead()
			if Value = A_ScriptFullPath
			{
				IpPromoted := RegRead(A_LoopRegKey, "IsPromoted")
				PahtIsPromoted := A_LoopRegKey
				
				if !IpPromoted
				{
					RegWrite "1", "REG_DWORD", A_LoopRegKey, "IsPromoted"
					RestPromoted := 1
					sleep(1000)
				}
					
				break
			}
		}
	}
	
	
	cbSize := A_PtrSize*3 + 16
	NII := Buffer(cbSize, 0)

	NumPut( "uint", cbSize, NII,  0 )
	NumPut( "ptr", A_ScriptHwnd, NII,  A_PtrSize)
	NumPut( "uint", 1028, NII, A_PtrSize*2 )

	Rect := Buffer(16)

	If !DllCall( "shell32\Shell_NotifyIconGetRect", "Ptr",NII, "Ptr",Rect )
	{
		Left   := NumGet(Rect, 0, "Int")
		Top    := NumGet(Rect, 4, "Int")
		Right  := NumGet(Rect, 8, "Int")
		Bottom := NumGet(Rect, 12,"Int")

		if (EfectoEntradaGif = 1)
			SelectEfect := "Center"
		else if (EfectoEntradaGif = 2)
			SelectEfect := "Move"
		else if (EfectoEntradaGif = 3)
			SelectEfect := "Move"
		else if (EfectoEntradaGif = 4)
			SelectEfect := "RL"
		else if (EfectoEntradaGif = 5)
			SelectEfect := "RL Slide"
		else if (EfectoEntradaGif = 6)
			SelectEfect := "LR"
		else if (EfectoEntradaGif = 7)
			SelectEfect := "LR Slide"
		else if (EfectoEntradaGif = 8)
			SelectEfect := "TB"
		else if (EfectoEntradaGif = 9)
			SelectEfect := "TB Slide"
		else if (EfectoEntradaGif = 10)
			SelectEfect := "BT"
		else if (EfectoEntradaGif = 11)
			SelectEfect := "BT Slide"
		else if (EfectoEntradaGif = 12)
			SelectEfect := "LR TB"
		else if (EfectoEntradaGif = 13)
			SelectEfect := "LR TB Slide"
		else if (EfectoEntradaGif = 14)
			SelectEfect := "LR BT"
		else if (EfectoEntradaGif = 15)
			SelectEfect := "LR BT Slide"
		else if (EfectoEntradaGif = 16)
			SelectEfect := "RL TB"
		else if (EfectoEntradaGif = 17)
			SelectEfect := "RL TB Slide"
		else if (EfectoEntradaGif = 18)
			SelectEfect := "RL BT "
		else if (EfectoEntradaGif = 19)
			SelectEfect := "RL BT Slide"
		
		global EntradaGifNow := 1
		try
			WinGetPos ,,, &H, "ahk_class Shell_TrayWnd"
		catch
			H := 48
		FilePathPic := "Gifs/" GifSelectedText ".gif"
		MyPicture := MyGif.Add("Picture"," ", FilePathPic)
		gif1 := Gif(FilePathPic, MyPicture.Hwnd)
		gif1.Play()
		Xgift := (((Right-Left)//2)+Left) - (gif1.newwidth//2)
		Ygift := (A_ScreenHeight - H - gif1.newheight + PosVGif)
		RightOculto := (A_ScreenWidth - gif1.newwidth)
		RightOcultold := RightOculto
		
		if (BarradeTareasGif)
		{
			try
				WinActivate "ahk_class Shell_TrayWnd"
		}
		
		if (EfectoEntradaGif != 2 and EfectoEntradaGif != 3)
		{
			MyGif.Show("Hide AutoSize x" Xgift " y" Ygift )
			AnimateWindow(MyGif.HWND, "Activate " SelectEfect, UpDownEfectoEntradaGif)
		} 
		else
		{
			MyGif.Show("Hide AutoSize x" RightOculto " y" Ygift )
			AnimateWindow(MyGif.HWND, "Activate RL Slide", (UpDownEfectoEntradaGif//3))
			if (EfectoEntradaGif = 3)
				SetWinDelay 0
			else
				SetWinDelay 1
				

			while(RightOculto > Xgift)
			{
				RightOculto -= (4313/UpDownEfectoEntradaGif)
				WinMove RightOculto, Ygift, , , "ahk_id " MyGif.HWND
			}
		}

		sleep(UpDownTiempoEntradaGif*1000)
		
		global EntradaGifNow := 0
		
		if (EfectoSalidaGif = 1)
			SelectEfect := "Center"
		else if (EfectoSalidaGif = 2)
			SelectEfect := "Move"
		else if (EfectoSalidaGif = 3)
			SelectEfect := "Move"
		else if (EfectoSalidaGif = 4)
			SelectEfect := "RL"
		else if (EfectoSalidaGif = 5)
			SelectEfect := "RL Slide"
		else if (EfectoSalidaGif = 6)
			SelectEfect := "LR"
		else if (EfectoSalidaGif = 7)
			SelectEfect := "LR Slide"
		else if (EfectoSalidaGif = 8)
			SelectEfect := "TB"
		else if (EfectoSalidaGif = 9)
			SelectEfect := "TB Slide"
		else if (EfectoSalidaGif = 10)
			SelectEfect := "BT"
		else if (EfectoSalidaGif = 11)
			SelectEfect := "BT Slide"
		else if (EfectoSalidaGif = 12)
			SelectEfect := "LR TB"
		else if (EfectoSalidaGif = 13)
			SelectEfect := "LR TB Slide"
		else if (EfectoSalidaGif = 14)
			SelectEfect := "LR BT"
		else if (EfectoSalidaGif = 15)
			SelectEfect := "LR BT Slide"
		else if (EfectoSalidaGif = 16)
			SelectEfect := "RL TB"
		else if (EfectoSalidaGif = 17)
			SelectEfect := "RL TB Slide"
		else if (EfectoSalidaGif = 18)
			SelectEfect := "RL BT "
		else if (EfectoSalidaGif = 19)
			SelectEfect := "RL BT Slide"
			
		if (EfectoSalidaGif != 2 and EfectoSalidaGif != 3 )
		{
			AnimateWindow(MyGif.HWND, "Hide " SelectEfect, UpDownEfectoSalidaGif)
		}
		else
		{	
			if (EfectoSalidaGif = 3)
				SetWinDelay 0
			else
				SetWinDelay 1
				
			while(RightOcultold > Xgift)
			{
				Xgift += (4313/UpDownEfectoEntradaGif)
				WinMove Xgift, Ygift, , , "ahk_id " MyGif.HWND
			}
			AnimateWindow(MyGif.HWND, "Hide LR Slide", (UpDownEfectoSalidaGif//3))
		}
		
		if RestPromoted
			RegWrite "0", "REG_DWORD", PahtIsPromoted, "IsPromoted"
	}
	
	gif1.Pause()
}

AnimateWindow(HWND, Options, t)
{
   o := 0, op := {Activate : 0x00020000, Slide  : 0x00040000
                , Center   : 0x00000010, Hide   : 0x00010000
                , LR       : 0x00000001, RL     : 0x00000002
                , TB       : 0x00000004, BT     : 0x00000008}
                
   List := "Activate|Slide|Center|Hide|LR|RL|TB|BT"

   Loop Parse, List, "|"
      If InStr(Options, A_LoopField, false)
         o |= op.%A_LoopField%
   return DllCall("AnimateWindow", "UPtr", HWND, "Int", t, "UInt", o)
}

ResolveHostname(hostname)
{
    WSADATA := Buffer(394 + (A_PtrSize - 2) + A_PtrSize, 0) 
	WSADATAPtr := WSADATA.Ptr
	
    if (DllCall("ws2_32\WSAStartup", "ushort", 0x0202, "uptr", WSADATAPtr) != 0)
        return "Failed"

    hints := Buffer(16 + 4 * A_PtrSize, 0)
	hintsPtr := hints.Ptr
	
    if (DllCall("ws2_32\getaddrinfo", "astr", hostname, "ptr", 0, "ptr", hints, "ptr*", &hintsPtr))
        return "Failed"

	addr := hintsPtr
	offset := 16 + 2 * A_PtrSize
	var := NumGet(addr+0, offset, "ptr")
	ipaddr := DllCall("ws2_32\inet_ntoa", "uint", NumGet(var + 4, 0, "uint"), "astr")
	
    return ipaddr
}

Send_WM_COPYDATA(StringToSend, TargetScriptTitle)
; This function sends the specified string to the specified window and returns the reply.
; The reply is 1 if the target window processed the message, or 0 if it ignored it.
{
    CopyDataStruct := Buffer(3*A_PtrSize)  ; Set up the structure's memory area.
    ; First set the structure's cbData member to the size of the string, including its zero terminator:
    SizeInBytes := (StrLen(StringToSend) + 1) * 2
    NumPut( "Ptr", SizeInBytes  ; OS requires that this be done.
          , "Ptr", StrPtr(StringToSend)  ; Set lpData to point to the string itself.
          , CopyDataStruct, A_PtrSize)
    Prev_DetectHiddenWindows := A_DetectHiddenWindows
    ;Prev_TitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows True
    ;SetTitleMatchMode 2
    TimeOutTime := 4000  ; Optional. Milliseconds to wait for response from receiver.ahk. Default is 5000
    ; Must use SendMessage not PostMessage.
    RetValue := SendMessage(0x004A, 0, CopyDataStruct,, TargetScriptTitle,,,, TimeOutTime) ; 0x004A is WM_COPYDATA.
    DetectHiddenWindows Prev_DetectHiddenWindows  ; Restore original setting for the caller.
    ;SetTitleMatchMode Prev_TitleMatchMode         ; Same.
    return RetValue  ; Return SendMessage's reply back to our caller.
}

WindowProc(hwnd, uMsg, wParam, lParam)
{
	critical
	static WM_CTLCOLOREDIT    := 0x0133
	static WM_CTLCOLORLISTBOX := 0x0134
	static WM_CTLCOLORBTN     := 0x0135
	static WM_CTLCOLORSTATIC  := 0x0138
	static DC_BRUSH           := 18
	
	if (DarkMode)
	{
		switch uMsg
		{
			case WM_CTLCOLOREDIT, WM_CTLCOLORLISTBOX:
			{
				DllCall("gdi32\SetTextColor", "Ptr", wParam, "UInt", 0xffff00)
				DllCall("gdi32\SetBkColor", "Ptr", wParam, "UInt", DarkColors["Controls"])
				DllCall("gdi32\SetDCBrushColor", "Ptr", wParam, "UInt", DarkColors["Controls"], "UInt")
				return DllCall("gdi32\GetStockObject", "Int", DC_BRUSH, "Ptr")
			}
			case WM_CTLCOLORBTN:
			{
				DllCall("gdi32\SetDCBrushColor", "Ptr", wParam, "UInt", DarkColors["Background"], "UInt")
				return DllCall("gdi32\GetStockObject", "Int", DC_BRUSH, "Ptr")
			}
			case WM_CTLCOLORSTATIC:
			{
				global HwndMyTextInfoWeb
				global HwndMyTextInfo 
				global HwndTextPopupV
				if (lParam != HwndMyTextInfoWeb and lParam != HwndMyTextInfo and lParam != HwndTextPopupV)
				{
					DllCall("gdi32\SetTextColor", "Ptr", wParam, "UInt", DarkColors["Font"])
					DllCall("gdi32\SetBkColor", "Ptr", wParam, "UInt", DarkColors["Background"])
					return TextBackgroundBrush
				}
			}
		}
	}
	
	return DllCall("user32\CallWindowProc", "Ptr", WindowProcOld, "Ptr", hwnd, "UInt", uMsg, "Ptr", wParam, "Ptr", lParam)
}

FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
    time := 19990101  ; *Midnight* of an arbitrary date.
    time := DateAdd(time, NumberOfSeconds, "Seconds")
    return NumberOfSeconds//3600 ":" FormatTime(time, "mm:ss")
    /*
    ; Unlike the method used above, this would not support more than 24 hours worth of seconds:
    return FormatTime(time, "h:mm:ss")
    */
}


class Gif
{   
   __New(file, hwnd, cycle := true)
   {
      this.file := file
      this.hwnd := hwnd
      this.cycle := cycle
      this.pBitmap := Gdip_CreateBitmapFromFile(this.file)
      Gdip_GetImageDimensions(this.pBitmap, &width, &height)
      this.width := width, this.height := height
      this.isPlaying := false
	  
      DllCall("Gdiplus\GdipImageGetFrameDimensionsCount", "ptr", this.pBitmap, "uptr*", &frameDimensions:=0)
	  this.dimensionIDs := Buffer(16*frameDimensions)
      DllCall("Gdiplus\GdipImageGetFrameDimensionsList", "ptr", this.pBitmap, "uptr", this.dimensionIDs.ptr, "int", frameDimensions)
      DllCall("Gdiplus\GdipImageGetFrameCount", "ptr", this.pBitmap, "uptr", this.dimensionIDs.ptr, "int*", &count:=0)
      this.frameCount := count
      this.frameCurrent := -1
      this.frameDelay := this.GetFrameDelay(this.pBitmap)

      this._Play("")
   }

   ; Return a zero-based array, containing the frames delay (in milliseconds)
   GetFrameDelay(pImage) {
      static PropertyTagFrameDelay := 0x5100
      DllCall("Gdiplus\GdipGetPropertyItemSize", "Ptr", pImage, "UInt", PropertyTagFrameDelay, "UInt*", &ItemSize:=0)
	  this.Item := Buffer(ItemSize, 0) 
      DllCall("Gdiplus\GdipGetPropertyItem"    , "Ptr", pImage, "UInt", PropertyTagFrameDelay, "UInt", ItemSize, "Ptr", this.Item.ptr)
      PropLen := NumGet(this.Item, 4, "UInt")
      PropVal := NumGet(this.Item, 8 + A_PtrSize, "UPtr")
      outArray := []
	  
      Loop(PropLen//4) {
         if !n := NumGet(PropVal+0, (A_Index-1)*4, "UInt")
            n := 10
		
         outArray.InsertAt(0, n * 10)
      }
      return outArray
   }
     
   Play()
   {
	 this.isPlaying := true
      fn := this._Play.Bind(this)
      this._fn := fn
      SetTimer fn, -1
   }
   
   Pause()
   {
      this.isPlaying := false
      fn := this._fn
      SetTimer fn, 0
   }
   
   _Play(mode := "set")
   {
      this.frameCurrent := mod(++this.frameCurrent, this.frameCount)
      DllCall("Gdiplus\GdipImageSelectActiveFrame", "ptr", this.pBitmap, "uptr", this.dimensionIDs.ptr, "int", this.frameCurrent)
      ;hBitmap := Gdip_CreateHBITMAPFromBitmap(this.pBitmap)
	 
	  H := this.height 
	  W := this.width
	  
	  global Prueba 
	  
	  if !Prueba
	  {
			
			global ConectadoGif
			global DesconocidoGif
			global DesconectadoGif
			global ErrorGif
			
			NumberToSave := 0
			if ConectadoGif
				NumberToSave := 1
			else if DesconocidoGif
				NumberToSave := 2
			else if DesconectadoGif
				NumberToSave := 3
			else if ErrorGif
				NumberToSave := 4

			global TamanodelGif1
			global AnchoGif1
			global LargoGif1
			global RelacionGif1
		
			global TamanodelGif2
			global AnchoGif2
			global LargoGif2
			global RelacionGif2
		
			global TamanodelGif3
			global AnchoGif3
			global LargoGif3
			global RelacionGif3

			global TamanodelGif4
			global AnchoGif4
			global LargoGif4
			global RelacionGif4
			
			
			global VoltearEntradaGif1
			global VoltearSalidaGif1

			global VoltearEntradaGif2
			global VoltearSalidaGif2

			global VoltearEntradaGif3
			global VoltearSalidaGif3

			global VoltearEntradaGif4
			global VoltearSalidaGif4
				
			if TamanodelGif%NumberToSave%
			{
			  H := LargoGif%NumberToSave%
			  W := AnchoGif%NumberToSave%
			  
			   if RelacionGif%NumberToSave%
			  {
				if ((Ratio1 := this.width / W) > (Ratio2 := this.height / H))
					H := Round(this.height / Ratio1)
				else
					W := Round(this.width / Ratio2)
			  }
			}
			else if RelacionGif%NumberToSave%
			{
			if ((Ratio1 := this.width / this.width) > (Ratio2 := this.height / this.height))
				H := Round(this.height / Ratio1)
			else
				W := Round(this.width / Ratio2)
			}
	  }
	  else
	  {
		global activePrueba
		global anchoPrueba
		global largoPrueba 
		global relacionPrueba
		
		global VoltearEntradaPrueba
		global VoltearSalidaPrueba
	
		if activePrueba
		{
		  H := largoPrueba
		  W := anchoPrueba
		  
		   if relacionPrueba
		  {
			if ((Ratio1 := this.width / W) > (Ratio2 := this.height / H))
				H := Round(this.height / Ratio1)
			else
				W := Round(this.width / Ratio2)
		  }
		}
		else if relacionPrueba
		{
		if ((Ratio1 := this.width / this.width) > (Ratio2 := this.height / this.height))
			H := Round(this.height / Ratio1)
		else
			W := Round(this.width / Ratio2)
		}
	 }
	  
	  this.newwidth := W
	  this.newheight := H
	  
	  this.pBitmapnew := Gdip_CreateBitmap(W, H)  
	  G := Gdip_GraphicsFromImage(this.pBitmapnew)
	  Gdip_SetSmoothingMode(G, 4)
	  Gdip_SetInterpolationMode(G, 7)
	  Gdip_DrawImage(G, this.pBitmap, 0, 0, W, H)
	  Gdip_DeleteGraphics(G)
	  
	  global EntradaGifNow
	  if !Prueba
	  {
			if EntradaGifNow and (VoltearEntradaGif%NumberToSave% or VoltearSalidaGif%NumberToSave%)
				  Gdip_ImageRotateFlip(this.pBitmapnew, 4)
	  }
	  else
	  {
			if EntradaGifNow and (VoltearEntradaPrueba or VoltearSalidaPrueba)
				 Gdip_ImageRotateFlip(this.pBitmapnew, 4)
	  }
	   
	  hBitmap := Gdip_CreateHBITMAPFromBitmap(this.pBitmapnew)
      SetImage(this.hwnd, hBitmap)
	  
	  Gdip_DisposeImage(this.pBitmapnew)
      DeleteObject(hBitmap)	   
	  DeleteObject( this.pBitmap)
	  DeleteObject( this.pBitmapnew)	
	  DeleteObject( this.Item.ptr)
	  DeleteObject( this.dimensionIDs.ptr)

      if (mode = "set" && this.frameCurrent < (this.cycle ? 0xFFFFFFFF : this.frameCount - 1)) {
         fn := this._fn
         SetTimer fn, (-1* this.frameDelay[this.frameCurrent+1])
      }
   }
}
