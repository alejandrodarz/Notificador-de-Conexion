#SingleInstance Ignore
#Include "lib\Dark_MsgBox_v2.ahk"
#Include "lib\Gdip_All.ahk"
#Include "lib\github.ahk"
#Include "lib\socket.ahk"
pToken := Gdip_Startup()
#Warn All, Off
A_TrayMenu.Delete()

SetTitleMatchMode 2
SetControlDelay -1
SetMouseDelay -1
; <for compiled scripts>
;@Ahk2Exe-SetFileVersion 2.1.0
;@Ahk2Exe-SetDescription Notificador de Conexión
; </for compiled scripts>

global Version := "v2.1.0"
global WinAutoRunVerify := true
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

global WebOffAccount := 0
global EditWebOffAccount := "http://2.2.2.2/"

global IniFileReadTime := 0
global EditIniFileReadTime := "ftp://usuario:contraseña@ip/archivo"

global Temporizador := 0
global TemporizadorH := 0
global TemporizadorM := 0
global TemporizadorS := 0
global TemporizadorNotiIcon := 1
global TemporizadorNotiTooltip := 1
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

global DataSesion := ""

global RetrasoConectado := 0
global RetrasoNacional := 0
global RetrasoDesconectado := 0
global RetrasoError := 0

global UserNameAccount := ""

global client_data := ""
global FuncIpTimer := Map()

global ServerOnPort := 27015
global TimeRed := 0
global sockserver := 0
global StartTime := 0

global VolMusic := 100

global SetInternetAccountAuto  := 0

global OnAccountSendData := 0

global aTimeTimeAccount := 0


;global TimeRedAdapters := 0
;global IPAddOrRemove := ""


if FileExist("options.ini")
{
	;///// [MyChecks]
	MyChecks := ["IniciarConWindows", "DarkMode", "AbrirWebAlConectarse", "AbrirWebAlDesconocer", "AbrirWebAlDesconectarse", "AbrirWebAlError", "WebOption", "NotiConectado", "NotiNacional", "NotiDesconectado", "NotiError", "DataPers", "WebOffAccount", "IniFileReadTime", "WebConectado", "WebDesconocido", "WebDesconectado", "TemporizadorNotiTooltip", "TemporizadorNotiIcon", "TemporizadorNotiWindows", "NotiGifError", "NotiGifDesconectado", "NotiGifNacional", "NotiGifConectado", "NotiNormal", "ConectadoGif", "DesconocidoGif", "DesconectadoGif", "ErrorGif", "TamanodelGif1", "TamanodelGif2", "TamanodelGif3", "TamanodelGif4", "RelacionGif1", "RelacionGif2", "RelacionGif3", "RelacionGif4", "VoltearEntradaGif1", "VoltearSalidaGif1", "VoltearEntradaGif2", "VoltearSalidaGif2", "VoltearEntradaGif3", "VoltearSalidaGif3", "VoltearEntradaGif4", "VoltearSalidaGif4", "BarradeTareasGif1", "BarradeTareasGif2", "BarradeTareasGif3", "BarradeTareasGif4", "UsarSegundaCuenta", "ActIni", "TimeRed"]
	
	;///// [MyEdits]
	MyEdits := ["WebAlConectarse", "WebAlDesconocer", "WebAlDesconectarse", "WebAlError", "SoundConectado", "SoundNacional", "SoundDesconectado", "SoundError", "EditConectado", "EditNacional", "EditDesconectado", "EditUser1", "EditPassword1", "EditDataPers", "EditWebOffAccount", "EditIniFileReadTime", "AnchoGif1", "AnchoGif2", "AnchoGif3", "AnchoGif4", "LargoGif1", "LargoGif2", "LargoGif3", "LargoGif4", "GifSelected1", "GifSelected2", "GifSelected3", "GifSelected4", "GifSelectedText1", "GifSelectedText2", "GifSelectedText3", "GifSelectedText4", "EditUser2", "EditPassword2", "LenguajeText", "DataSesion"]
	
	;///// [MyUpDown0-18]
	MyUpDown1 := ["EfectoEntradaGif1", "EfectoEntradaGif2", "EfectoEntradaGif3", "EfectoEntradaGif4", "EfectoSalidaGif1", "EfectoSalidaGif2", "EfectoSalidaGif3", "EfectoSalidaGif4", "UpDownTiempoEntradaGif1", "UpDownTiempoEntradaGif2", "UpDownTiempoEntradaGif3", "UpDownTiempoEntradaGif4"]
	
	;///// [MyUpDown0-23]
	MyUpDown2 := ["TemporizadorH"]
	
	;///// [MyUpDown0-59]
	MyUpDown3 := ["TemporizadorM", "TemporizadorS"]
	
	;///// [MyUpDown1-100]
	MyUpDown4 := ["VerificarConx", "VerificarPingCada", "VerificarConxCada"]
	
	;///// [MyUpDown0-100]
	MyUpDown5 := ["PosVGif1", "PosVGif2", "PosVGif3", "PosVGif4", "VolMusic"]
	
	;///// [MyUpDown200-5000]
	MyUpDown6 := ["UpDownEfectoEntradaGif1", "UpDownEfectoEntradaGif2", "UpDownEfectoEntradaGif3", "UpDownEfectoEntradaGif4", "UpDownEfectoSalidaGif1", "UpDownEfectoSalidaGif2", "UpDownEfectoSalidaGif3", "UpDownEfectoSalidaGif4"]
	
	;///// [MyUpDown0-20000]
	MyUpDown7 := ["RetrasoConectado", "RetrasoNacional", "RetrasoDesconectado", "RetrasoError"]
	
	;///// [MyUpDown1-65535]
	MyUpDown8 := ["ServerOnPort"]
	
	
	MapOptions := Map(1, MyChecks, 2, MyEdits, 3,  MyUpDown1, 4, MyUpDown2, 5, MyUpDown3, 6, MyUpDown4, 7, MyUpDown5, 8, MyUpDown6, 9, MyUpDown7, 10, MyUpDown8)
	
	
	For Num, Options in MapOptions
	{
		For Key in Options
		{
			try
			{
				Value := IniRead("options.ini", "settings", Key)
				if (Num = 1)
					if (Value != 0 and Value != 1)
						Throw
				else if (Num = 3)
					if (Value < 0 or Value > 18)
						Throw
				else if (Num = 4)
					if (Value < 0 or Value > 23)
						Throw
				else if (Num = 5)
					if (Value < 0 or Value > 59)
						Throw
				else if (Num = 6)
					if (Value < 1 or Value > 100)
						Throw
				else if (Num = 7)
					if (Value < 0 or Value > 100)
						Throw
				else if (Num = 8)
					if (Value < 200 or Value > 5000)
						Throw
				else if (Num = 9)
					if (Value < 0 or Value > 20000)
						Throw
				else if (Num = 10)
					if (Value < 1 or Value > 65535)
						Throw
				
				%Key% := Value
			}
			catch
				IniWrite %Key%, "options.ini", "settings", Key
		}
	}
} else
{
	options := "
	(
	[settings]
	IniciarConWindows=0
	ActIni=1
	DarkMode=0
	AbrirWebAlConectarse=0
	WebAlConectarse=https://www.google.com/
	AbrirWebAlDesconocer=0
	WebAlDesconocer=https://www.cubadebate.cu/
	AbrirWebAlDesconectarse=0
	WebAlDesconectarse=https://secure.etecsa.net:8443/
	AbrirWebAlError=0
	WebAlError=http://192.168.1.1/
	WebOption=0
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
	TemporizadorH=0
	TemporizadorM=0
	TemporizadorS=0
	TemporizadorNotiIcon=1
	TemporizadorNotiTooltip=1
	TemporizadorNotiWindows=0
	NotiGifError=0
	NotiGifDesconectado=0
	NotiGifNacional=0
	NotiGifConectado=0
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
	UsarSegundaCuenta=0
	LenguajeText=
	DataSesion=
	RetrasoConectado=0
	RetrasoNacional=0
	RetrasoDesconectado=0
	RetrasoError=0
	ServerOnPort=27015
	TimeRed=0
	VolMusic=100
	)"
	
	FileAppend options, "options.ini"
}

try SoundPlay "soundfix.wav"
AppVol("Notificador de Conexión.exe", VolMusic)

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
		TrayTip5=Has been successfully removed the account.
		TrayTip6=There was an error while removing the account. 
		TrayTip7=There was an error removing the account. Try again.
		TrayTip8=The set time must be greater than 0.
		TrayTip9=The countdown is almost over.
		TrayTip10=The countdown ended successfully!.
		TrayTip11=The timer has a very short time to activate notifications.
		TrayTip12=The timer has a very short time to activate it on the Icon.
		TrayTip13=The countdown has been cancelled.
		TrayTip14=The connection has been lost.
		TrayTip15=You have made many attempts. Please try again later.
		Msgbox1=Update download failed, please try again.
		Msgbox2=Changes have been saved.
		Msgbox3=Connection Notifier: Updated successfully.
		Msgbox4=Saved!
		Msgbox5=Alert!
		Msgbox6=¡Error!
		Msgbox7=Information!
		Msgbox8=The ip range is invalid.
		Msgbox9=It`s not valid.
		Msgbox10=The prefix must be between 0-32.
		Msgbox11=The prefix is ??not valid.
		Msgbox12=The prefix cannot be empty (/).
		Msgbox13=In a range (-) there cannot be a prefix (/).
		Msgbox14=It cannot have empty spaces.
		Msgbox15=The IP is repeated.

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
		NotificationsTexto1=Events
		NotificationsText2=GIF
		NotificationsText3=Windows
		NotificationsText4=Sound
		NotificationsText5=Internet:
		NotificationsTexto6=Intranet:
		NotificationsTexto7=Portal:
		NotificationsText8=Offline:
		NotificationsTexto9=Basic and information notifications.
		NotificationsTexto10=Notifications
		NotificationsTexto11=Sounds
		NotificationsTexto12=Delay
		NotificationsTexto13=Volume:

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
		TextTimer3=Show countdown on the Icon.
		TextTimer4=Show countdown in Icon Info.
		TextTimer5=Show countdown in a Notification.
		NetTexto1=Network
		RedTexto2=Port:
		RedTexto3=Get time online:

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
		TrayTip1=Se ha puesto correctamente la cuenta.
		TrayTip2=No tiene saldo la cuenta.
		TrayTip3=Hubo algun error al poner la cuenta.
		TrayTip4=Hubo un error al poner la cuenta. Intentalo de nuevo.
		TrayTip5=Se ha quitado correctamente la cuenta.
		TrayTip6=Hubo algun error al quitar la cuenta.
		TrayTip7=Hubo un error al quitar la cuenta. Intentalo de nuevo.
		TrayTip8=El tiempo establecido debe de ser mayor que 0.
		TrayTip9=La cuenta atras está al acabarse.
		TrayTip10=La cuenta atras finalizó con éxito!.
		TrayTip11=El temporizador tiene un tiempo muy pequeño para poder activar las notificaciones.
		TrayTip12=El temporizador tiene un tiempo muy pequeño para poder activarlo en el Icono.
		TrayTip13=Se ha cancelado la cuenta atras.
		TrayTip14=Se ha perdido la conexión.
		TrayTip15=Usted ha realizado muchos intentos. Por favor intente más tarde.
		Msgbox1=La descarga de la actualización ha fallado intente de nuevo.
		Msgbox2=Se han guardado los cambios.
		Msgbox3=Notificador de Conexión: Se ha actualizado correctamente.
		Msgbox4=¡Guardado!
		Msgbox5=¡Alerta!
		Msgbox6=¡Error!
		Msgbox7=¡Información!
		Msgbox8=El rango de ip no es válido.
		Msgbox9=No es válido.
		Msgbox10=El prefijo debe de estar entre 0-32.
		Msgbox11=El prefijo no es válido.
		Msgbox12=El prefijo no puede estar vacio (/).
		Msgbox13=En un rango (-) no puede haber prefijo (/).
		Msgbox14=No puede tener espacios vacios.
		Msgbox15=El Ip está repetido..

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
		NotificacionesTexto1=Eventos
		NotificacionesTexto2=GIF
		NotificacionesTexto3=Windows
		NotificacionesTexto4=Sonido
		NotificacionesTexto5=Internet:
		NotificacionesTexto6=Intranet:
		NotificacionesTexto7=Portal:
		NotificacionesTexto8=Desconectado:
		NotificacionesTexto9=Notificaciones básicas y de información.
		NotificacionesTexto10=Notificaciones
		NotificacionesTexto11=Sonidos
		NotificacionesTexto12=Retraso
		NotificacionesTexto13=Volumen:

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
		TemporizadorTexto3=Mostar cuenta atras en el Icono.
		TemporizadorTexto4=Mostar cuenta atras en la Info del Icono.
		TemporizadorTexto5=Mostar cuenta atras en una Notificación.
		RedTexto1=Red
		RedTexto2=Puerto:
		RedTexto3=Obtener tiempo mediante la Red:

		[GIF]
		PerfilTexto1=Perfil
		PerfilTexto2=Internet
		PerfilTexto3=Intranet
		PerfilTexto4=Portal
		PerfilTexto5=Desconectado
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
	PredLang := ""
	LenguajeTextAux := ""
	try
	{
		PredLang := RegRead("HKEY_CURRENT_USER\Control Panel\Desktop", "PreferredUILanguages")
		PredLang := RTrim(PredLang, "`n")
	}
	catch
	{
		try
		{
			Loop Reg "HKEY_CURRENT_USER\Control Panel\Desktop\LanguageConfiguration", "VK"
			{
				PredLang := A_LoopRegName
				break
			}
			PredLang := RTrim(PredLang, "`n")
		}
		
	}
	
	if (PredLang = "")
	{
		try
			PredLang := RegRead("HKEY_CURRENT_USER\Control Panel\International", "LocaleName")
	}
	
	if (PredLang != "")
	{
		Loop Files "Lenguajes\*.ini"
		{
			if (A_LoopFileName ~= PredLang)
			{
				LenguajeText := A_LoopFileName
				break
			}
			else if (A_LoopFileName ~= StrSplit(PredLang, "-", , 2)[1])
			{
				LenguajeTextAux := A_LoopFileName
			}
		}
	}
	
	if (LenguajeText = "" and LenguajeTextAux = "")
	{
		LenguajeText := "English [en-EN].ini"
	}
	else if (LenguajeText = "" and LenguajeTextAux != "")
	{
		LenguajeText := LenguajeTextAux
	}	
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
			KeysInScript :=	["IconTip1","IconTip2","IconTip21","IconTip3","IconTip4","IconTip5","IconTip6","IconTip7","IconTip8","IconTip9","IconTip10","IconTip11","TrayTip1","TrayTip2","TrayTip3","TrayTip4","TrayTip5","TrayTip6","TrayTip7","TrayTip8","TrayTip9","TrayTip10","TrayTip11","TrayTip12","TrayTip13","TrayTip14","TrayTip15","Msgbox1","Msgbox2", "Msgbox3", "Msgbox4", "Msgbox5", "Msgbox6", "Msgbox7", "Msgbox8", "Msgbox9", "Msgbox10", "Msgbox11", "Msgbox12", "Msgbox13", "Msgbox14", "Msgbox15"]
		else if (NumSection = 2)
			KeysInScript :=	["Reiniciar","Pausar","PonerCuenta","QuitarCuenta","PonerTemporizador","QuitarTemporizador","Configuracion","BuscarActualizacion","Salir"]
		else if (NumSection = 3)
			KeysInScript :=	["Texto1","Texto2","Texto3","Texto4","Texto5","Texto6","Texto7","Texto8","Texto9","Texto10","Texto11"]
		else if (NumSection = 4)
			KeysInScript :=	["Titulo","Pestanas","Texto1","Boton1","Boton2","Boton3"]
		else if (NumSection = 5)
			KeysInScript :=	["BasicasTexto1","BasicasTexto2","BasicasTexto3","BasicasTexto4","BasicasTexto5","BasicasTexto6","BasicasTexto7","BasicasTexto8","BasicasTexto9","PingTexto1","PingTexto2","PingTexto3","PingTexto4","CuentaTexto1","CuentaTexto2","CuentaTexto3","CuentaTexto4","NotificacionesTexto1","NotificacionesTexto2","NotificacionesTexto3","NotificacionesTexto4","NotificacionesTexto5","NotificacionesTexto6","NotificacionesTexto7","NotificacionesTexto8","NotificacionesTexto9", "NotificacionesTexto10", "NotificacionesTexto11", "NotificacionesTexto12", "NotificacionesTexto13"]
		else if (NumSection = 6)
			KeysInScript :=	["PaginasWebTexto1","PaginasWebTexto2","PaginasWebTexto3","PaginasWebTexto4","PaginasWebTexto5","PaginasWebTexto6","PaginasWebTexto61","PaginasWebTexto7","AvanzadoTexto1","AvanzadoTexto2","AvanzadoTexto3","AvanzadoTexto4","AvanzadoTexto5","TemporizadorTexto1","TemporizadorTexto3","TemporizadorTexto4","TemporizadorTexto5","RedTexto1","RedTexto2","RedTexto3"]
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
		
	A_TrayMenu.Add(LenguajeList.BarraMenu["PonerCuenta"] " (Auto)", MenuHandler) 
	Try
		A_TrayMenu.SetIcon(LenguajeList.BarraMenu["PonerCuenta"] " (Auto)", "shell32.dll", 168)
		
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
			global UsarSegundaCuenta
			
			global DataPers 
			global EditDataPers
			global EditPageLogin 
			global UserNameAccount
			
			global NotiNormal 
			
			usernametomsg := ""

			if !DataPers
			{
				if !UsarSegundaCuenta
				{
					if (EditUser1 = "" or EditPassword1 = "")
						return
					
					usernametomsg := EditUser1
					requestdata := "username=" EditUser1 "&password=" EditPassword1
				}
				else
				{
					if (EditUser2 = "" or EditPassword2 = "")
						return
						
					usernametomsg := EditUser2
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
				global DataSesion
				whr := ComObject("WinHttp.WinHttpRequest.5.1")
				whr.Open("POST", EditPageLogin)
				whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
				whr.Send(requestdata)
		
				if InStr(whr.ResponseText, "Usted está conectado")
				{
					FoundPosAT := InStr(whr.ResponseText, "ATTRIBUTE_UUID")
					ATTRIBUTE_UUID := SubStr(whr.ResponseText, FoundPosAT, (InStr(whr.ResponseText, '"', , FoundPosAT)-FoundPosAT))
					
					FoundPosUN:= InStr(whr.ResponseText, "username")
					username := SubStr(whr.ResponseText, FoundPosUN, (InStr(whr.ResponseText, '"', , FoundPosUN)-FoundPosUN))
					
					DataSesion := ATTRIBUTE_UUID "&" username
					
					UserNameAccount := StrSplit(username, "=",, 2)[2]
					
					IniWrite DataSesion, "options.ini", "settings", "DataSesion"
					
					if NotiNormal
						Notify.Show(UserNameAccount, LenguajeList.Mensajes["TrayTip1"], 'Icons.dll|Icon5',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=2b5f00 Style=EDGE')
						
					A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])
					A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
				}
				else if NotiNormal
				{
					if NotiNormal
					{
						if InStr(whr.ResponseText, "Su tarjeta no tiene saldo disponible")
						{
							Notify.Show(LenguajeList.Mensajes["Msgbox5"], usernametomsg "`n" LenguajeList.Mensajes["TrayTip2"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')
						}
						else if InStr(whr.ResponseText, "Usted ha realizado muchos intentos")
						{
							Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Mensajes["TrayTip15"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')
						}
						else
						{
							Notify.Show(LenguajeList.Mensajes["Msgbox6"], LenguajeList.Mensajes["TrayTip3"], 'Icons.dll|Icon2',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=b10000 Style=EDGE')
						}
					}
				}
			}
			catch
			{
				if NotiNormal
					Notify.Show(LenguajeList.Mensajes["Msgbox6"], LenguajeList.Mensajes["TrayTip4"], 'Icons.dll|Icon2',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=b10000 Style=EDGE')
			}
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["PonerCuenta"] " (Auto)")
	{
		global SetInternetAccountAuto
		
		if SetInternetAccountAuto
		{
			A_TrayMenu.UnCheck(LenguajeList.BarraMenu["PonerCuenta"] " (Auto)")
			SetInternetAccountAuto := 0
		}
		else
		{
			A_TrayMenu.Check(LenguajeList.BarraMenu["PonerCuenta"] " (Auto)")
			SetInternetAccountAuto := 1
		}
	}
	else if (ItemName = LenguajeList.BarraMenu["QuitarCuenta"])
	{
		if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
		{
			global WebOffAccount 
			global VerificarPingCada
			global VerificarConx
			global DataSesion
			global UserNameAccount
			
			if !WebOffAccount
			{
				if (DataSesion = "")
					DataSesion := IniRead("options.ini", "settings", "DataSesion")
					
				if (DataSesion != "")
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
							try
							{
								whr := ComObject("WinHttp.WinHttpRequest.5.1")
								whr.Open("POST", "https://secure.etecsa.net:8443/LogoutServlet")
								whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
								whr.Send(DataSesion)
									
								global NotiNormal 
								
								if InStr(whr.ResponseText, "SUCCESS")
								{
									if NotiNormal
										Notify.Show(LenguajeList.Mensajes["Msgbox7"], UserNameAccount "`n" LenguajeList.Mensajes["TrayTip5"], 'Icons.dll|Icon4',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=3399ff Style=EDGE')
										
									DataSesion := ""
									IniWrite DataSesion, "options.ini", "settings", "DataSesion"
									
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
									
									UserNameAccount := ""
								}
								else
								{
									if NotiNormal
										Notify.Show(LenguajeList.Mensajes["Msgbox6"], UserNameAccount "`n" LenguajeList.Mensajes["TrayTip6"], 'Icons.dll|Icon2',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=b10000 Style=EDGE')
								}
							}
							catch
							{
								if NotiNormal
								{
									Notify.Show(LenguajeList.Mensajes["Msgbox6"], LenguajeList.Mensajes["TrayTip7"], 'Icons.dll|Icon2',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=b10000 Style=EDGE')
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
						if (latestObj.downloadURLs.Length != 0)
						{
							try
							{
								if (latestObj.downloadURLs.Length = 1)
									archivodownload := latestObj.downloadURLs[1]
								else
								{
									latestprevObj := Github.historicReleases(usr, repo)
									
									latestprevversion := latestObj.version
									Loop latestprevObj.Length
									{
										if (latestprevObj[A_Index].version != latestObj.version)
										{
											latestprevversion := latestprevObj[A_Index].version
											break
										}
									}
									
									if (latestprevversion = Version)
										namearchive := "Actualizacion"
									else
										namearchive := "Completa"
										
									Loop latestObj.downloadURLs.Length
									{
										if (latestObj.downloadURLs[A_Index] ~= namearchive)
										{
											archivodownload := latestObj.downloadURLs[A_Index]
											break
										}
									}
									
								}
								
								Github.Download(archivodownload, A_ScriptDir "\Descarga")
								
								Run "Actualizar.exe " '"' LenguajeList.Mensajes["Msgbox1"] '" "' LenguajeList.BarraMenu["BuscarActualizacion"] '" "' LenguajeList.Mensajes["Msgbox3"] '"'
								ExitApp
							}
							catch
								Msgbox(LenguajeList.Mensajes["Msgbox1"], LenguajeList.BarraMenu["BuscarActualizacion"], "16")
						}
						else
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

OnMessage(0x404, AHK_NOTIFYICON1)

AHK_NOTIFYICON1(wParam, lParam, *) 
{
if (lParam = 0x203) { 
		MenuHandler(LenguajeList.BarraMenu["Configuracion"], 8, A_TrayMenu)
    }
}

OnMessage(0x404, AHK_NOTIFYICON)

AHK_NOTIFYICON(wParam, lParam, *) 
{
	if (lParam = 0x200) {
		if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
		{
			CoordMode "Mouse", "Screen"
			MouseGetPos &OutputVarX, &OutputVarY
			

			ToolTip1 := 0
			ToolTip2 := 0
			
			global UserNameAccount
			global TimeAccount
			global StartTime
			
			if (StartTime != 0)
				ToolTip1 := 1

			global Temporizador
			global TemporizadorNotiTooltip
			if Temporizador and TemporizadorNotiTooltip
			{	
				global SecondsTemp
				global StartTimeTemp
				
				if isset(SecondsTemp)
					ToolTip2 := 1 
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
			}

			While(OutputVarX <= Right and OutputVarX >= Left and OutputVarY <= Bottom and OutputVarY >= Top)
			{
				if ToolTip1
				{
					ElapsedTime := (A_TickCount - StartTime)//1000
					
					if InStr(A_IconTip, LenguajeList.Mensajes["IconTip5"])
					{
						A_IconTipnew := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount  "`n" LenguajeList.Mensajes["IconTip3"] " " FormatSeconds(TimeAccount - ElapsedTime)
					}
					else
						A_IconTipnew := LenguajeList.Mensajes["IconTip7"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount  "`n" LenguajeList.Mensajes["IconTip3"] " " FormatSeconds(TimeAccount - ElapsedTime)
					
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
	
if TimeRed
{
	global sockserver
	if !sockserver
	{
		try
		{
			sockserver := Socket()
			sockserver.Bind(["0.0.0.0", ServerOnPort])
			sockserver.MemberShip(1,"224.13.133.233")
			
			msgtosend := "RequestData"
			respbuf := Buffer(StrPut(msgtosend, Encoding:="UTF-8") - ((Encoding = 'utf-16' || Encoding = 'cp1200') ? 2 : 1))
			respsize := StrPut(msgtosend, respbuf, Encoding)
			sockserver.SendTo(respbuf, respsize, ["224.13.133.233", ServerOnPort])
		}
	}
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
	
	global DataSesion

	global TitteGUI
	
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
	

	global ServerOnPort
	global TimeRed
	
	global VolMusic
	
	
	
	;global TimeRedAdapters

	
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
	MyGroupBoxGenerales := MyGui.Add("GroupBox","w250 h160 Section Center", LenguajeList.General["BasicasTexto1"])
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
	MyGui.Add("GroupBox", "xs w250 h220 Section Center", LenguajeList.General["PingTexto1"])
	
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
	MyGui.Add("Text","xs y+20", LenguajeList.General["BasicasTexto6"])
	
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

	MyGui.Add("GroupBox","y" YMyGroupBoxGenerales " x" (XMyGroupBoxGenerales+WMyGroupBoxGenerales+MyGui.MarginX) " w260 h160 Section Center", LenguajeList.General["CuentaTexto1"])
	
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

	
	;////////////////////////  GroupBox [Eventos]
	
	MyGui.Add("GroupBox", "xs w260 h220 Section Center", LenguajeList.General["NotificacionesTexto1"])
	
	if !DirExist(A_ScriptDir "\Sonidos")
		DirCreate A_ScriptDir "\Sonidos"  
		
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
	
	MyRadioGroupNotiChooose := MyGui.Add("Radio", "xs+40 yp+20 vNotiChooose", LenguajeList.General["NotificacionesTexto10"])
	MyRadioGroupNotiChooose.value := 1
	MyRadioGroupNotiChooose.OnEvent("Click", GNotiChooose) 
	MyRadioGroupSoundsChooose := MyGui.Add("Radio", "xs+140 yp vSoundsChooose", LenguajeList.General["NotificacionesTexto11"])
	MyRadioGroupSoundsChooose.OnEvent("Click", GNotiChooose) 
	

	;////// [GIF WINDOWS SONIDO]
	MyTextGIF := MyGui.Add("Text","xs+120 yp+25", LenguajeList.General["NotificacionesTexto2"])
	MyTextGIF.SetFont("underline")
	MyTextGIF.OnEvent("Click", GMyTextGIF)
	
	MyTextWindows := MyGui.Add("Text","xs170 yp", LenguajeList.General["NotificacionesTexto3"])
	MyTextWindows.SetFont("underline")
	MyTextWindows.OnEvent("Click", GMyTextWindows)


	MyTextSonido := MyGui.Add("Text","xs+113 yp", LenguajeList.General["NotificacionesTexto4"])
	MyTextSonido.SetFont("underline")
	
	MyTextRetraso := MyGui.Add("Text","xs+185 yp", LenguajeList.General["NotificacionesTexto12"])
	MyTextRetraso.SetFont("underline")
	
	MyTextRetrasoMs := MyGui.Add("Text","x+2 yp", "(ms)")
	
	

	;////// 
	
	;////// [Conectado]
	MyCheckNotiConectadoText := MyGui.Add("Text","xs+15 yp+20", LenguajeList.General["NotificacionesTexto5"])
	MyCheckNotiGifConectado := MyGui.Add("Checkbox","xs+121 yp vNotiGifConectado", " ")
	MyCheckNotiGifConectado.value := NotiGifConectado
	MyCheckNotiConectado := MyGui.Add("Checkbox","xs+181 yp vConectado", " ")
	MyCheckNotiConectado.value := NotiConectado
	MyDropDownListSoundConectadoNum := MyGui.Add("DropDownList", "xs+101 yp-5 w65 vSoundConectado", MySound)
	MyDropDownListSoundConectadoNum.Value := SoundConectadoNum
	
	MyEditRetrasoConectado := MyGui.Add("Edit", "xs+185 yp w56 h20")
	MyUpDownRetrasoConectado := MyGui.Add("UpDown", "vRetrasoConectado Range0-20000", 0)
	MyUpDownRetrasoConectado.value := RetrasoConectado
	;//////
	
	
	;////// [Desconocido]
	MyCheckNotiNacionalText := MyGui.Add("Text","xs+15 yp+28", LenguajeList.General["NotificacionesTexto6"])
	MyCheckNotiGifNacional := MyGui.Add("Checkbox","xs+121 yp vNotiGifNacional", " ")
	MyCheckNotiGifNacional.value := NotiGifNacional
	MyCheckNotiNacional := MyGui.Add("Checkbox","xs+181 yp vNacional", " ")
	MyCheckNotiNacional.value := NotiNacional
	MyDropDownListSoundNacionalNum := MyGui.Add("DropDownList", "xs+101 yp-5 w65 vSoundNacional", MySound)
	MyDropDownListSoundNacionalNum.Value := SoundNacionalNum
	
	MyEditRetrasoNacional:= MyGui.Add("Edit", "xs+185 yp w56 h20")
	MyUpDownRetrasoNacional := MyGui.Add("UpDown", "vRetrasoNacional Range0-20000", 0)
	MyUpDownRetrasoNacional.value := RetrasoNacional
	;////// 
	
	
	;////// [Desconectado]
	MyCheckNotiDesconectadoText := MyGui.Add("Text","xs+15 yp+28", LenguajeList.General["NotificacionesTexto7"])
	MyCheckNotiGifDesconectado := MyGui.Add("Checkbox","xs+121 yp vNotiGifDesconectado", " ")
	MyCheckNotiGifDesconectado.value := NotiGifDesconectado
	MyCheckNotiDesconectado := MyGui.Add("Checkbox","xs+181 yp vDesconectado", " ")
	MyCheckNotiDesconectado.value := NotiDesconectado
	MyDropDownListSoundDesconectadoNum := MyGui.Add("DropDownList", "xs+101 yp-5 w65 vSoundDesconectado", MySound)
	MyDropDownListSoundDesconectadoNum.Value := SoundDesconectadoNum
	
	MyEditRetrasoDesconectado:= MyGui.Add("Edit", "xs+185 yp w56 h20")
	MyUpDownRetrasoDesconectado := MyGui.Add("UpDown", "vRetrasoDesconectado Range0-20000", 0)
	MyUpDownRetrasoDesconectado.value := RetrasoDesconectado
	;////// 
	
	
	;////// [Error]
	MyCheckNotiErrorText := MyGui.Add("Text","xs+15 yp+28", LenguajeList.General["NotificacionesTexto8"])
	MyCheckNotiGifError := MyGui.Add("Checkbox","xs+121 yp vNotiGifError", " ")
	MyCheckNotiGifError.value := NotiGifError
	MyCheckNotiError := MyGui.Add("Checkbox","xs+181 yp vNotiError", " ")
	MyCheckNotiError.value := NotiError
	MyDropDownListSoundErrorNum := MyGui.Add("DropDownList", "xs+101 yp-5 w65 vSoundError", MySound)
	MyDropDownListSoundErrorNum.Value := SoundErrorNum
	
	MyEditRetrasoError := MyGui.Add("Edit", "xs+185 yp w56 h20")
	MyUpDownRetrasoError := MyGui.Add("UpDown", "vRetrasoError Range0-20000", 0)
	MyUpDownRetrasoError.value := RetrasoError
	;//////
	
	
	MySliderText := MyCheckNotiErrorText := MyGui.Add("Text","xs+15 yp+35", LenguajeList.General["NotificacionesTexto13"])
	MySlider := MyGui.Add("Slider", "xs+95 w152 h25 yp-7 vMySlider Range0-100 TickInterval10 ToolTipBottom")
	MySlider.Value := VolMusic
	
	MySliderText.Visible := 0
	MySlider.Visible := 0
	
	;////// [Notificaciones básicas y de información.]
	MyCheckNotiNormal := MyGui.Add("Checkbox","xs+15 y+12 vNotiNormal", " ")
	MyCheckNotiNormal.value := NotiNormal
	MyTextNotiNormal := MyGui.Add("Text","yp x+-1", LenguajeList.General["NotificacionesTexto9"])
	MyTextNotiNormal.OnEvent("Click", GMyTextNotiNormal)

	;//////
	
	GNotiChooose(MyRadioGroupNotiChooose)
	
	GNotiChooose(Gui ,*)
	{
		if (Gui.Text = LenguajeList.General["NotificacionesTexto10"])
		{
			MyTextSonido.Visible := 0
			MyDropDownListSoundConectadoNum.Visible := 0
			MyDropDownListSoundNacionalNum.Visible := 0
			MyDropDownListSoundDesconectadoNum.Visible := 0
			MyDropDownListSoundErrorNum.Visible := 0
			MyTextRetraso.Visible := 0
			MyUpDownRetrasoError.Visible := 0
			MyEditRetrasoError.Visible := 0
			MyUpDownRetrasoDesconectado.Visible := 0
			MyEditRetrasoDesconectado.Visible := 0
			MyUpDownRetrasoNacional.Visible := 0
			MyEditRetrasoNacional.Visible := 0
			MyUpDownRetrasoConectado.Visible := 0
			MyEditRetrasoConectado.Visible := 0
			MyTextRetrasoMs.Visible := 0
			
			MyTextGIF.Visible := 1
			MyTextWindows.Visible := 1
			MyCheckNotiGifConectado.Visible := 1
			MyCheckNotiConectado.Visible := 1
			MyCheckNotiGifNacional.Visible := 1
			MyCheckNotiNacional.Visible := 1
			MyCheckNotiGifDesconectado.Visible := 1
			MyCheckNotiDesconectado.Visible := 1
			MyCheckNotiGifError.Visible := 1
			MyCheckNotiError.Visible := 1
			
			MySliderText.Visible := 0
			MySlider.Visible := 0
		}
		else
		{
			MyTextGIF.Visible := 0
			MyTextWindows.Visible := 0
			MyCheckNotiGifConectado.Visible := 0
			MyCheckNotiConectado.Visible := 0
			MyCheckNotiGifNacional.Visible := 0
			MyCheckNotiNacional.Visible := 0
			MyCheckNotiGifDesconectado.Visible := 0
			MyCheckNotiDesconectado.Visible := 0
			MyCheckNotiGifError.Visible := 0
			MyCheckNotiError.Visible := 0
			
			
			MyTextSonido.Visible := 1
			MyDropDownListSoundConectadoNum.Visible := 1
			MyDropDownListSoundNacionalNum.Visible := 1
			MyDropDownListSoundDesconectadoNum.Visible := 1
			MyDropDownListSoundErrorNum.Visible := 1
			MyTextRetraso.Visible := 1
			MyUpDownRetrasoError.Visible := 1
			MyEditRetrasoError.Visible := 1
			MyUpDownRetrasoDesconectado.Visible := 1
			MyEditRetrasoDesconectado.Visible := 1
			MyUpDownRetrasoNacional.Visible := 1
			MyEditRetrasoNacional.Visible := 1
			MyUpDownRetrasoConectado.Visible := 1
			MyEditRetrasoConectado.Visible := 1
			MyTextRetrasoMs.Visible := 1
			
			MySliderText.Visible := 1
			MySlider.Visible := 1
		}
	}
	

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
	MyGroupBoxPaginasWeb := MyGui.Add("GroupBox", "w250 h270 Section Center", LenguajeList.Opciones["PaginasWebTexto1"])
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
	MyCheckWebOption := MyGui.Add("Checkbox","xs y+15 vMyCheckWebOption", " ")
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
	MyGui.Add("GroupBox","y" YMyGroupBoxPaginasWeb " x" (XMyGroupBoxPaginasWeb+WMyGroupBoxPaginasWeb+MyGui.MarginX) " w260 h270 Section Center", LenguajeList.Opciones["AvanzadoTexto1"])
	
	;////// [Web para poner la cuenta]
	MyGui.Add("Text","xs+15 yp+25", LenguajeList.Opciones["AvanzadoTexto2"])
	MyEditPageLogin := MyGui.Add("Edit","xp w230 h22 vMyEditPageLogin")
	MyEditPageLogin.SetFont("underline cBlue")
	MyEditPageLogin.value := EditPageLogin
	;//////

	
	;////// [Personalizar datos requeridos]
	MyCheckDataPers := MyGui.Add("Checkbox","xp yp+30 vMyDataPers", " ")
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
	MyCheckWebOffAccount := MyGui.Add("Checkbox","xp yp+30 vMyWebOffAccount", " ")
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
	MyCheckIniFileReadTime := MyGui.Add("Checkbox","xp yp+30 vMyIniFileReadTime", " ")
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
	
	;////// GroupBox [Red]
	MyGroupBoxRed := MyGui.Add("GroupBox","xs w260 h110 Section Center", LenguajeList.Opciones["RedTexto1"])
	
	MyGui.Add("Text","xs+208 yp+15", LenguajeList.Opciones["RedTexto2"])
	
	MyCheckTimeRed := MyGui.Add("Checkbox","xs+15 y+8 Section vTimeRed", " ")
	MyCheckTimeRed.value := TimeRed
	MyCheckTimeRed.OnEvent("Click", GTimeRed)
	
	MyTextTimeRed := MyGui.Add("Text","x+-0.5",  LenguajeList.Opciones["RedTexto3"])
	MyTextTimeRed.OnEvent("Click", GTextTimeRed)
	
	MyEditPuerto := MyGui.Add("Edit", "xs+191 yp-3 w40 h20 Number Limit5 vServerOnPort")
	MyEditPuerto.value := ServerOnPort
	
	GTimeRed
	
	GTimeRed(*)
	{
		if MyCheckTimeRed.value
			MyEditPuerto.Enabled := 1
		else
			MyEditPuerto.Enabled := 0
	}
	
	GTextTimeRed(*)
	{
		if MyCheckTimeRed.value
			MyCheckTimeRed.value := 0
		else
			MyCheckTimeRed.value := 1
		
		GTimeRed
	}
	
	/*
	MyTextTimeRed.OnEvent("Click", GTextTimeRed)

	MyGui.Add("Text","xs", "Adaptador de Red:")
	MyGui.Add("Text","xs+198 yp", LenguajeList.Opciones["RedTexto2"])
	
	global ADAPTER_INFO
	global TimeRedAdaptersIndx
	global ADAPTER_Only
	global IPAddOrRemove
	
	GetAdaptInfo
	
	MyDropDownListTimeRedAdapters := MyGui.Add("DropDownList", "xs w190 vTimeRedAdapters R10", ADAPTER_Only)
	MyDropDownListTimeRedAdapters.OnEvent("Change", GListTimeRedAdapters)
	MyDropDownListTimeRedAdapters.Value := TimeRedAdaptersIndx
	
	MyEditPuerto := MyGui.Add("Edit", "yp+1 x+5 w40 h20 Number Limit5 vServerOnPort")
	MyEditPuerto.value := ServerOnPort
	
	MyEditIPAddOrRemoveColumn := MyGui.Add("Edit","xs w30 h45 ReadOnly Number r3 -VScroll")
	MyEditIPAddOrRemoveColumn.Value := "#1`n#2`n#3"
	
	global MyEditIPAddOrRemove := MyGui.Add("Edit","yp+1 x+2 vIPAddOrRemove w203 h45 Section")
	
	if MyDropDownListTimeRedAdapters.Value != 0
	{
		if (IPAddOrRemove = "")
			MyEditIPAddOrRemove.value := ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IPList"]
		else
		{
			FoundAdapter := InStr(IPAddOrRemove, MyDropDownListTimeRedAdapters.Text)
			if FoundAdapter
			{
				LenghtFoundAdapter := StrLen(MyDropDownListTimeRedAdapters.Text)
				FoundEndAdapter := FoundAdapter+LenghtFoundAdapter+1
				FoundIps := InStr(IPAddOrRemove, ";",,FoundEndAdapter)
				GetIpsText := SubStr(IPAddOrRemove, FoundEndAdapter, FoundIps-FoundEndAdapter)
			
			sads := StrReplace(GetIpsText, ",", "`n")

				MyEditIPAddOrRemove.value := sads
			}
			else
				MyEditIPAddOrRemove.value := ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IPList"]
		}	
	}
		
	MyEditIPAddOrRemove.OnEvent("Focus", GMyEditIPAddOrRemove)

	
	GMyEditIPAddOrRemove(gui, *)
	{
		while(ControlGetFocus() = gui.HWND)
		{
			FirstLine := SendMessage(0x00CE, 0, 0, gui.HWND)+1
			if !isset(FirstLineOld) or FirstLine != FirstLineOld
			{
				FirstLineOld := FirstLine
				MyEditIPAddOrRemoveColumn.Value := "#" FirstLine "`n#" FirstLine+1 "`n#" FirstLine+2
			}
		}
	}
	
	;msgbox MyDropDownListTimeRedAdapters.Text
	
	GTimeRed
	
	GListTimeRedAdapters(*)
	{
		global ADAPTER_INFO
		MyEditIPAddOrRemove.value := ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IPList"]
	}
	
	GTextTimeRed(*)
	{
		if MyCheckTimeRed.value
			MyCheckTimeRed.value := 0
		else
			MyCheckTimeRed.value := 1
		
		GTimeRed
	}
	
	GTimeRed(*)
	{
		if MyCheckTimeRed.value
		{
			MyDropDownListTimeRedAdapters.Enabled := 1
			MyEditPuerto.Enabled := 1
			MyEditIPAddOrRemove.Enabled := 1
		}
		else
		{
			MyDropDownListTimeRedAdapters.Enabled := 0
			MyEditPuerto.Enabled := 0
			MyEditIPAddOrRemove.Enabled := 0
		}
	}
	
	GetAdaptInfo()
	{
		Addresses := SysGetIPAddresses()
		global ADAPTER_INFO := Map()
		global TimeRedAdaptersIndx := 0
		
		if (Addresses.Length > 0)
		{
			AddressesSTR := ""
			for address in Addresses
				AddressesSTR .= address " "
			
			static ERROR_SUCCESS                  := 0
			static ERROR_BUFFER_OVERFLOW          := 111
			static MAX_ADAPTER_DESCRIPTION_LENGTH := 128

			if (DllCall("iphlpapi\GetAdaptersInfo", "Ptr", 0, "UInt*", &Size := 0, "UInt") = ERROR_BUFFER_OVERFLOW)
			{
				Buf := Buffer(Size)
				if (DllCall("iphlpapi\GetAdaptersInfo", "Ptr", Buf, "UInt*", Size, "UInt") = ERROR_SUCCESS)
				{
					
					global ADAPTER_Only := []
					Addr := Buf.Ptr
					Index := 0
					while (Addr)
					{
						LengtAddrNow := Addr
						LengtAddrAfter := NumGet(Addr, "Ptr")

						Description := StrGet(Addr + 272, MAX_ADAPTER_DESCRIPTION_LENGTH + 4, "CP0")
						IpAddressList := StrGet(Addr + 440 + A_PtrSize, "CP0") 
						IpMaskList := StrGet(Addr + 440 + A_PtrSize + 16, "CP0")
						
						AddressesSTRLengthOld := StrLen(AddressesSTR)
						AddressesSTR := StrReplace(AddressesSTR, IpAddressList " ",,,, 1)
						AddressesSTRLengthNew := StrLen(AddressesSTR)
						
						AddressesEdit := ""
						if (AddressesSTRLengthOld != AddressesSTRLengthNew)
						{
							Index += 1
							ADAPTER_INFO.%Description% := Map()
							MapMask := ConvertMask(IpMaskList)
							
							AddressesEdit := IpAddressList  MapMask["Prefix"]
							
							IPArray := StrSplit(IpAddressList, ".")
							MASKIPArray := StrSplit(IpMaskList, ".")
							
							StartIP := [IPArray[1]&MASKIPArray[1], IPArray[2]&MASKIPArray[2], IPArray[3]&MASKIPArray[3], IPArray[4]&MASKIPArray[4]]
							LastIP := [StartIP[1]|(255-MASKIPArray[1]), StartIP[2]|(255-MASKIPArray[2]), StartIP[3]|(255-MASKIPArray[3]), StartIP[4]|(255-MASKIPArray[4])]
							
							ADAPTER_INFO.%Description%["IPCount"] := 1
							ADAPTER_INFO.%Description%["IPList"] := AddressesEdit
							ADAPTER_INFO.%Description%["IP1"] := IpAddressList
							ADAPTER_INFO.%Description%["IP1Prefix"] := MapMask["Prefix"]
							ADAPTER_INFO.%Description%["IP1Start"] := StartIP
							ADAPTER_INFO.%Description%["IP1Last"] := LastIP
							
							if (TimeRedAdapters = Description)
								TimeRedAdaptersIndx := Index
							ADAPTER_Only.Push(Description)
						
							if AddressesSTRLengthNew = 0
								break
			
							Offset := 712
							while (Offset <= (LengtAddrAfter - LengtAddrNow))
							{
								AddressGet := StrGet(Addr + Offset, "CP0")
								AddressMaskGet := StrGet(Addr + Offset + 16, "CP0")
								
								AddressesSTRLengthOld := AddressesSTRLengthNew
								AddressesSTR := StrReplace(AddressesSTR, AddressGet " ",,,, 1)
								AddressesSTRLengthNew := StrLen(AddressesSTR)
								
								if (AddressesSTRLengthOld != AddressesSTRLengthNew)
								{
									MapMask := ConvertMask(AddressMaskGet)
									AddressesEdit .= "`n" AddressGet MapMask["Prefix"]
									
									IPArray := StrSplit(AddressGet, ".")
									MASKIPArray := StrSplit(AddressMaskGet, ".")
									
									StartIP := [IPArray[1]&MASKIPArray[1], IPArray[2]&MASKIPArray[2], IPArray[3]&MASKIPArray[3], IPArray[4]&MASKIPArray[4]]
									LastIP := [StartIP[1]|(255-MASKIPArray[1]), StartIP[2]|(255-MASKIPArray[2]), StartIP[3]|(255-MASKIPArray[3]), StartIP[4]|(255-MASKIPArray[4])]
									
									ADAPTER_INFO.%Description%["IPCount"]++
									ADAPTER_INFO.%Description%["IPList"] := AddressesEdit
									ADAPTER_INFO.%Description%["IP" A_INDEX+1] := AddressGet
									ADAPTER_INFO.%Description%["IP" A_INDEX+1 "Prefix"] := MapMask["Prefix"]
									ADAPTER_INFO.%Description%["IP" A_INDEX+1 "Start"] := StartIP
									ADAPTER_INFO.%Description%["IP" A_INDEX+1 "Last"] := LastIP
								}
								else
									break
								
								if AddressesSTRLengthNew = 0
									break

								if !NumGet(Addr - A_PtrSize, "INT")
									break
									
								Offset += 48
							}
							
							if AddressesSTRLengthNew = 0
								break

						}

						Addr := LengtAddrAfter
					}
				}
			}

		}
	}
	
	*/
	
	/*
	MyRadioGroupServerOn := MyGui.Add("Radio", "xp+40 yp+30", LenguajeList.Opciones["AvanzadoTexto6"])
	MyRadioGroupServerOn.value := 1
	MyRadioGroupServerOn.OnEvent("Click", GServerClient)
	
	MyRadioGroupClienteOn := MyGui.Add("Radio", "x+15 yp", LenguajeList.Opciones["AvanzadoTexto7"])
	MyRadioGroupClienteOn.OnEvent("Click", GServerClient)
	
	
	MyCheckServerOn := MyGui.Add("Checkbox","xs+15 yp+25 Section vServerClientOn", " ")
	MyCheckServerOn.value := ServerOn
	MyCheckServerOn.OnEvent("Click", GServerOn)
	
	
	MyGui.Add("Text","x+-1", LenguajeList.Opciones["AvanzadoTexto8"])
	MyEditServerIP := MyGui.Add("Edit", "yp-3 x+5 w90 h20 Limit15 vServerClientOnIp")
	MyEditServerIP.value := ServerOnIp
	
	
	
	GServerOn
	
	GServerOn(*)
	{
		if MyCheckServerOn.value
		{
			MyEditServerIP.Enabled := 1
			MyEditPuerto.Enabled := 1
		}
		else
		{
			MyEditServerIP.Enabled := 0
			MyEditPuerto.Enabled := 0
		}
	}
	
	GServerClient(Gui, *)
	{
		if (Gui.Text = LenguajeList.Opciones["AvanzadoTexto6"])
		{
			MyCheckServerOn.value := ServerOn
			MyEditServerIP.value := ServerOnIp
			MyEditPuerto.value := ServerOnPort
		}
		else 
		{
			MyCheckServerOn.value := ClienteOn
			MyEditServerIP.value := ClienteOnIp
			MyEditPuerto.value := ClienteOnPort
		}
		GServerOn
	}
	*/
	
	;//////

	;////// GroupBox [Temporizador]
	MyGroupBoxTemporizador := MyGui.Add("GroupBox", "x" XMyGroupBoxPaginasWeb " y" (YMyGroupBoxPaginasWeb+HMyGroupBoxPaginasWeb+MyGui.MarginY) " w250 h110 Section Center", LenguajeList.Opciones["TemporizadorTexto1"])
	MyGroupBoxTemporizador.GetPos(&XMyGroupBoxTemporizador, &YMyGroupBoxTemporizador, &WMyGroupBoxTemporizador, &HMyGroupBoxTemporizador)
	

	MyEditTemporizadorH := MyGui.Add("Edit","xs+15 yp+20 w35 h20 Section")
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


	;//////
	
	
	;////// [Mostar cuenta atras en el Icono]
	MyCheckTempNotiIcon := MyGui.Add("Checkbox","xs y+15  Section vTempNotiIcon", " ")
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
	MyGui.Add("GroupBox", "w520 h45 Section Center", LenguajeList.GIF["PerfilTexto1"])
	
	
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
	MyGroupBoxAjustes := MyGui.Add("GroupBox", "xs w250 h132 Section Center", LenguajeList.GIF["AjustesTexto1"])
	MyGroupBoxAjustes.GetPos(&XMyGroupBoxAjustes, &YMyGroupBoxAjustes, &WMyGroupBoxAjustes, &HMyGroupBoxAjustes)
	
	;////// [Barra de Tareas]
	MyCheckBarradeTareasGif := MyGui.Add("Checkbox","xs+15 yp+20 vBarradeTareasGif", " ")
	MyCheckBarradeTareasGif.value := BarradeTareasGif%NumberToLoad%
	MyTextBarradeTareasGif := MyGui.Add("Text","x+-0.5", LenguajeList.GIF["AjustesTexto2"])
	MyTextBarradeTareasGif.OnEvent("Click", GBarradeTareasGif)
	;////// 
	
	;////// [Corrección de posición del GIF verticalmente]
	MyTextPosVGif := MyGui.Add("Text","xs+15 yp+22", LenguajeList.GIF["AjustesTexto3"])
	MyEditPosVGif := MyGui.Add("Edit", "yp-3 x+5 w40 h20")
	MyUpDownPosVGif := MyGui.Add("UpDown", "vPosVGif Range0-100", 0)
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
	MyGui.Add("GroupBox", "xs w250 h197 Section Center", LenguajeList.GIF["EfectosTexto1"])
	
	Efectos := StrSplit(LenguajeList.GIF["EfectosTexto2"], ",")
	
	;////// [Entrada]
	MyGui.Add("Text","xs+15 yp+30", LenguajeList.GIF["EfectosTexto3"])
	
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
	MyGui.Add("Text","xs+15 y+30 ", LenguajeList.GIF["EfectosTexto6"])
	
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

	MyLV := MyGui.Add("ListView", "y" (YMyGroupBoxAjustes+5) " x" (XMyGroupBoxAjustes+WMyGroupBoxAjustes+MyGui.MarginX ) " w260 h302 Icon")
	
	MyLV.Opt("-Multi")
	
	ImageListID := DllCall("comctl32.dll\ImageList_Create", "int", 58, "int", 58, "uint", 0x20, "int", 255, "int", 10)
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
		
		if MyRadioGroupConectadoGif.value
		{
			soundprueba := MyDropDownListSoundConectadoNum.text
			retraso := MyUpDownRetrasoConectado.value
		}
		else if MyRadioGroupDesconocidoGif.value
		{
			soundprueba := MyDropDownListSoundNacionalNum.text
			retraso := MyUpDownRetrasoNacional.value
		}
		else if MyRadioGroupDesconectadoGif.value
		{
			soundprueba := MyDropDownListSoundDesconectadoNum.text
			retraso := MyUpDownRetrasoDesconectado.value
		}
		else if MyRadioGroupErrorGif.value
		{
			soundprueba := MyDropDownListSoundErrorNum.text
			retraso := MyUpDownRetrasoError.value
		}
				
		if (soundprueba != "none")
		{
			soundtoplayretraso:= SoundToPlay.Bind(soundprueba)
			
			if (retraso = 0)
				retraso := -1
			else
				retraso := (retraso * -1)
				
			SetTimer soundtoplayretraso, retraso
		}

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
				
				MyUpDownRetrasoError.value := 0
				MyUpDownRetrasoDesconectado.value := 0
				MyUpDownRetrasoNacional.value := 0
				MyUpDownRetrasoConectado.value := 0
				
				
				MyCheckTimeRed.value := 0
				MyEditPuerto.value := 27015
				
				MySlider.Value := 100
				
				;MyDropDownListTimeRedAdapters.Value := 0
				;MyEditIPAddOrRemove.Value := ""
				
				GTimeRed

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
		global NotiError := SaveData.NotiError
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

		global VolMusic := SaveData.MySlider
		AppVol("Notificador de Conexión.exe", VolMusic)

		global RetrasoConectado := SaveData.RetrasoConectado
		global RetrasoNacional := SaveData.RetrasoNacional
		global RetrasoDesconectado := SaveData.RetrasoDesconectado
		global RetrasoError := SaveData.RetrasoError
		
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
		
		global TemporizadorH := SaveData.TemporizadorH
		global TemporizadorM := SaveData.TemporizadorM
		global TemporizadorS := SaveData.TemporizadorS
		
		global Temporizador
		
		if !Temporizador
		{
			if (TemporizadorH = 0 and TemporizadorM = 0 and TemporizadorS = 0)
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
			else if (A_IconNumber = 1 or A_IconNumber = 2 or A_IconNumber = 3)
				A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
			else
				A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
				
			A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
		}
		else
		{
			A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
			A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
		}
		
		
		global TemporizadorNotiIcon := SaveData.TempNotiIcon
		global TemporizadorNotiTooltip := SaveData.TempNotiTooltip
		global TemporizadorNotiWindows := SaveData.TempNotiWindows
		global NotiGifError := SaveData.NotiGifError 
		global NotiGifDesconectado := SaveData.NotiGifDesconectado
		global NotiGifNacional := SaveData.NotiGifNacional
		global NotiGifConectado := SaveData.NotiGifConectado
		
		global ServerOnPort
		global TimeRed := SaveData.TimeRed
		
		ServerOnPortOld := ServerOnPort
		if (SaveData.ServerOnPort >= 1 and SaveData.ServerOnPort <= 65535)
			ServerOnPort := SaveData.ServerOnPort 
		
		if TimeRed
		{
			global sockserver
			global StartTime
			if !sockserver
			{
				sockserver := Socket()
				sockserver.Bind(["0.0.0.0", ServerOnPort])
				sockserver.MemberShip(1,"224.13.133.233")
			}
			else if ServerOnPortOld != ServerOnPort
			{
				sockserver.__Delete()
				sockserver := Socket()
				sockserver.Bind(["0.0.0.0", ServerOnPort])
				sockserver.MemberShip(1,"224.13.133.233")
			}
			
			if (!StartTime)
			{
				msgtosend := "RequestData"
				respbuf := Buffer(StrPut(msgtosend, Encoding:="UTF-8") - ((Encoding = 'utf-16' || Encoding = 'cp1200') ? 2 : 1))
				respsize := StrPut(msgtosend, respbuf, Encoding)
				sockserver.SendTo(respbuf, respsize, ["224.13.133.233", ServerOnPort])
			}
		}
		else
		{
			global sockserver
			if sockserver
			{
				sockserver.__Delete()
			}
		}
		
		/*
		global TimeRedAdapters := SaveData.TimeRedAdapters
		
		global IPAddOrRemove
		
		ProblemsListIP := ""
		IndexAdap := 0
		SetLineOnSave := ""
		SetLineOnSaveValue := ""
		
		if MyEditIPAddOrRemove.value != ""
		{
			Loop Parse MyEditIPAddOrRemove.value, "`r`n"	
			{
				LineaError := A_LoopField
				IndexAdap++
				if InStr(A_LoopField, " ")
				{
					ProblemsListIP .= "#" IndexAdap " -> " LenguajeList.Mensajes["Msgbox14"] "`n"
					continue
				}

				if (A_LoopField = "")
				{
					ProblemsListIP .= "#" IndexAdap " -> " LenguajeList.Mensajes["Msgbox14"] "`n"
					continue
				}

				if InStr(SetLineOnSave, A_LoopField)
				{
					ProblemsListIP .= "#" IndexAdap ' -> "' LineaError '" - ' LenguajeList.Mensajes["Msgbox15"] "`n"
					continue
				}
				
				VerifyIp2Array := 0
				if InStr(A_LoopField, "-")
				{
					if InStr(A_LoopField, "/")
					{
						ProblemsListIP .= "#" IndexAdap ' -> "' LineaError '" - ' LenguajeList.Mensajes["Msgbox13"] "`n"
						continue
					}
						
					VerifyIpArray := StrSplit(A_LoopField, "-", ,2)
					
					if !ValidIP(VerifyIpArray[1])
					{
						ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox9"] "`n"
						continue
					}
					if !ValidIP(VerifyIpArray[2])
					{
						ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox9"] "`n"
						continue
					}
					
					VerifyIp1Array := StrSplit(VerifyIpArray[1], ".", ,4)
					VerifyIp2Array := StrSplit(VerifyIpArray[2], ".", ,4)
				}
				else if InStr(A_LoopField, "/")
				{
					VerifyIpArray := StrSplit(A_LoopField, "/", ,2)
					
					if (VerifyIpArray[2] = "")
					{
						ProblemsListIP .= "#" IndexAdap " -> " LineaError " - " LenguajeList.Mensajes["Msgbox12"] "`n"
						continue
					}
			
					if !IsDigit(VerifyIpArray[2])
					{
						ProblemsListIP .= "#" IndexAdap " -> " LineaError " - " LenguajeList.Mensajes["Msgbox11"] "`n"
						continue
					}
					
					if (VerifyIpArray[2] > 32 or VerifyIpArray[2] < 0)
					{
						ProblemsListIP .= "#" IndexAdap " -> " LineaError " - " LenguajeList.Mensajes["Msgbox10"] "`n"
						continue
					}

					if !ValidIP(VerifyIpArray[1])
					{
						ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox9"] "`n"
						continue
					}
						
					VerifyIp1Array := StrSplit(VerifyIpArray[1], ".", ,4)
				}
				else
				{
					if !ValidIP(A_LoopField)
					{
						ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox9"] "`n"
						continue
					}
					
					VerifyIp1Array := StrSplit(A_LoopField, ".", ,4)
				}
				
				InRange := 0
				
				Loop ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IPCount"]
				{
					
					StartIP := ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IP" A_INDEX "Start"]
					LastIP := ADAPTER_INFO.%MyDropDownListTimeRedAdapters.Text%["IP" A_INDEX "Last"]
					
					Loop 4
					{
						If (StartIP[A_Index] = LastIP[A_Index])
						{
							if (StartIP[A_Index] != VerifyIp1Array[A_Index])
							{	
								ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
								break
							}
								
							if (VerifyIp2Array != 0)
							{
								if (VerifyIp1Array[A_Index] != VerifyIp2Array[A_Index])
								{
									ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
									break
								}	
							}
						}
						else
						{
							if (A_INDEX = 4)
							{
								if (VerifyIp1Array[A_Index] <= StartIP[A_Index] or VerifyIp1Array[A_Index] >= LastIP[A_Index])
								{
									ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
									break
								}
								
								if (VerifyIp2Array != 0)
								{
									if (VerifyIp2Array[A_Index] <= StartIP[A_Index] or VerifyIp2Array[A_Index] >= LastIP[A_Index])
									{
										ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
										break
									}
								}
									
								InRange := 1
							}
							else
							{
								if (VerifyIp1Array[A_Index] < StartIP[A_Index] or VerifyIp1Array[A_Index] > LastIP[A_Index])
								{
									ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
									break
								}
								
								if (VerifyIp2Array != 0)
								{
									if (VerifyIp2Array[A_Index] < StartIP[A_Index] or VerifyIp2Array[A_Index] > LastIP[A_Index])
									{	
										ProblemsListIP .= "#" IndexAdap ' -> Ip: "' LineaError '" - ' LenguajeList.Mensajes["Msgbox8"] "`n"
										break
									}
								}
							}	
						}
					}
					
					if InRange
						break
				}
				
				if InRange
				{
					SetLineOnSave .= A_LoopField ","
					SetLineOnSaveValue .= A_LoopField "`n"
				}
			}
			
			if ProblemsListIP != ""
			{
				ProblemsListIP := RTrim(ProblemsListIP, "`n")
				Notify.Show(LenguajeList.Mensajes["Msgbox6"], ProblemsListIP, 'Icons.dll|Icon2',,, 'dur=6 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=b10000 Style=EDGE')
			}
			
			
			FoundThisInText := InStr(IPAddOrRemove, MyDropDownListTimeRedAdapters.Text)
			if FoundThisInText
				IPAddOrRemove := RegExReplace(IPAddOrRemove, ".*;",,,,FoundThisInText)

			IPAddOrRemove .= MyDropDownListTimeRedAdapters.Text "," RTRIM(SetLineOnSave, ",")  ";"
			
			MyEditIPAddOrRemove.Value := RTRIM(SetLineOnSaveValue, "`n") 
			
			MyEditIPAddOrRemoveColumn.Value := "#1`n#2`n#3"
		}
	*/

	/*
		if (ValidIP(SaveData.ServerClientOnIp) and SaveData.ServerOnPort >= 1 and SaveData.ServerClientOnPort <= 65535)
		{
			if MyRadioGroupServerOn.value
			{
				global ServerOn := SaveData.ServerClientOn
				global ServerOnIp := SaveData.ServerClientOnIp
				global ServerOnPort := SaveData.ServerClientOnPort 
				
				global ServerOnVerify
				global sockserver
				
				if ServerOn
				{
					if !ServerOnVerify
					{
						sockserver := winsock("server",cb,"IPV4")
						sockserver.Bind(ServerOnIp,ServerOnPort) ; "0.0.0.0",27015
						sockserver.Listen()
						ServerOnVerify := 1
					}
				}
				else
				{
					if ServerOnVerify
					{
						sockserver.Close()
						ServerOnVerify := 0
					}
				}
			}
			else
			{
				global ClienteOn := SaveData.ServerClientOn
				global ClienteOnIp := SaveData.ServerClientOnIp
				global ClienteOnPort := SaveData.ServerClientOnPort 
			}
		}
*/
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
		
		if (DataSesion = "")
			DataSesion := IniRead("options.ini", "settings", "DataSesion")

		if WebOffAccount
		{
			if (A_IconNumber != 1 and A_IconNumber != 2 and A_IconNumber != 3)
				A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
			else
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
		}
		else
		{	
			if (DataSesion = "")
				A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
			else
				A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
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
		options .= "WebAlError=" SaveData.MyEditWebAlError "`n"
		options .= "WebOption=" SaveData.MyCheckWebOption "`n"
		options .= "VerificarConxCada=" SaveData.MyUpDown "`n"
		options .= "VerificarConx=" SaveData.MyUpDownConx "`n"
		options .= "NotiConectado=" SaveData.Conectado "`n"
		options .= "NotiNacional=" SaveData.Nacional "`n"
		options .= "NotiDesconectado=" SaveData.Desconectado "`n"
		options .= "NotiError=" SaveData.NotiError "`n"
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
		options .= "LenguajeText=" LenguajeText "`n"
		options .= "DataSesion=" DataSesion "`n"
		
		options .= "RetrasoConectado=" SaveData.RetrasoConectado "`n"
		options .= "RetrasoNacional=" SaveData.RetrasoNacional "`n"
		options .= "RetrasoDesconectado=" SaveData.RetrasoDesconectado "`n"
		options .= "RetrasoError=" SaveData.RetrasoError "`n"
		
		options .= "ServerOnPort=" ServerOnPort "`n"
		options .= "TimeRed=" SaveData.TimeRed "`n"
		options .= "VolMusic=" SaveData.MySlider
		;options .= "TimeRedAdapters=" SaveData.TimeRedAdapters "`n"
		;options .= "IPAddOrRemove=" IPAddOrRemove
		
		if FileExist("options.ini")
			FileDelete "options.ini"	

		FileAppend options, "options.ini"
		
		if RestMenu
		{
			Gui_BClose
			Settings
		}
		
		Notify.Show(LenguajeList.Mensajes["Msgbox4"], LenguajeList.Mensajes["Msgbox2"], 'Icons.dll|Icon5',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=2b5f00 Style=EDGE')
		
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

/*
A_HotkeyInterval := 0

global TitteGUI
global MyEditIPAddOrRemove 

#HotIf IsSet(TitteGUI) and WinExist(TitteGUI) and TitteGUI = LenguajeList.Configuracion["Titulo"] and ControlGetFocus(TitteGUI) != MyEditIPAddOrRemove.HWND and GetOutputVarControl(MyEditIPAddOrRemove.HWND, TitteGUI)
WheelDown::
WheelUp::
{
	ControlFocus MyEditIPAddOrRemove.HWND, TitteGUI 
	Send "{" A_ThisHotkey "}"
}
#HotIf


GetOutputVarControl(Cntrl, Wind)
{
	MouseGetPos ,,&OutputVarWin, &OutputVarControl
	WindID := WinGetID(Wind)
	if OutputVarWin = WindID
	{
		try
			if Cntrl = ControlGetHwnd(OutputVarControl, "ahk_id " WindID)
				return 1
	}

	return 0
}
*/


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

try 
{
	if (RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips") != "0")
		RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips"
}
catch
	RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "EnableBalloonTips"

OnExit ExitFunc

ExitFunc(ExitReason, ExitCode)
{
	if ProcessExist("PingHostName.exe")
		ProcessClose "PingHostName.exe"
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
		global DataSesion
			
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
								ConectStatus := 1
							else
								ConectStatus := 0
								
							if ((ConectStatus and A_IconNumber != 5 and A_IconNumber != 6 and A_IconNumber != 7 and A_IconNumber != 8 and A_IconNumber != 9 and A_IconNumber != 10) or (!ConectStatus and A_IconNumber != 4 and A_IconNumber != 11 and A_IconNumber != 12 and A_IconNumber != 13 and A_IconNumber != 14 and A_IconNumber != 15))
							{
								If ConectStatus
								{
									try
										TraySetIcon("Icons.dll", 5) ;8
										
									A_TrayMenu.Enable(LenguajeList.BarraMenu["BuscarActualizacion"])
										
									A_IconTip := LenguajeList.Mensajes["IconTip5"]
								}
								else
								{
									try
										TraySetIcon("Icons.dll", 4) ;9
										
									A_TrayMenu.Disable(LenguajeList.BarraMenu["BuscarActualizacion"])
									
									A_IconTip := LenguajeList.Mensajes["IconTip6"]
								}
								
								A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerCuenta"])
								
								if !IniFileReadTime
								{	
									if (DataSesion = "")
										DataSesion := IniRead("options.ini", "settings", "DataSesion")	
									
									if (DataSesion != "")
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
												try
												{
													requestdata := "op=getLeftTime&" DataSesion
													whr := ComObject("WinHttp.WinHttpRequest.5.1")
													whr.Open("POST", "https://secure.etecsa.net:8443/EtecsaQueryServlet")
													whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
													whr.Send(requestdata)
													
													if (whr.ResponseText = "errorop")
													{
														DataSesion := ""
														IniWrite DataSesion, "options.ini", "settings", "DataSesion"
														StartTime := 0
													}
													else
													{
														StartTime := A_TickCount
														global aTimeTimeAccount := A_Hour * 3600 + A_Min * 60 + A_Sec
														
														If ConectStatus
															A_IconTip := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount "`n" LenguajeList.Mensajes["IconTip3"] " " whr.ResponseText
														else
															A_IconTip := LenguajeList.Mensajes["IconTip6"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount "`n" LenguajeList.Mensajes["IconTip3"] " " whr.ResponseText
														
														aTime := StrSplit(whr.ResponseText, ":")
														TimeAccount := aTime[1] * 3600 + aTime[2] * 60 + aTime[3]
														
														if TimeRed
														{
															global OnAccountSendData := 1
															global sockserver
															global ServerOnPort
															msgtosend := UserNameAccount ";" TimeAccount ";" aTimeTimeAccount
															respbuf := Buffer(StrPut(msgtosend, Encoding:="UTF-8") - ((Encoding = 'utf-16' || Encoding = 'cp1200') ? 2 : 1))
															respsize := StrPut(msgtosend, respbuf, Encoding)
															sockserver.SendTo(respbuf, respsize, ["224.13.133.233", ServerOnPort])
														}
													}
												}
											}
										}
									}
									else
										StartTime := 0
								} 
								else
								{
									;ftp://invitado:invitado@192.168.20.1/InternetAccount.ini
									try
										Download EditIniFileReadTime, "InternetAccount.ini"
									
									try
									{
										if FileExist("InternetAccount.ini")
										{
											UserNameAccount := IniRead("InternetAccount.ini", "Info", "Cuenta")
											Saldo := IniRead("InternetAccount.ini", "Info", "Saldo")
											Factor := IniRead("InternetAccount.ini", "Info", "FactorHoras")
											TimeIs := IniRead("InternetAccount.ini", "Info", "Hora")
											Tiempo := Integer((Saldo/Factor)*3600)

											if (TimeIs != "0")
											{	
												aTime := StrSplit(TimeIs, ":")
												global aTimeTimeAccount := aTime[1] * 3600 + aTime[2] * 60 + aTime[3]
												aTimeTimeAccount1 := A_Hour * 3600 + A_Min * 60 + A_Sec
												StartTime := A_TickCount
												
												RestSec := aTimeTimeAccount1 - aTimeTimeAccount

												Tiempo := (Tiempo - RestSec)
												
												TimeAccount := Tiempo 

												if TimeRed
												{
													global OnAccountSendData := 1
													global sockserver
													global ServerOnPort
													msgtosend := UserNameAccount ";" TimeAccount ";" aTimeTimeAccount
													respbuf := Buffer(StrPut(msgtosend, Encoding:="UTF-8") - ((Encoding = 'utf-16' || Encoding = 'cp1200') ? 2 : 1))
													respsize := StrPut(msgtosend, respbuf, Encoding)
													sockserver.SendTo(respbuf, respsize, ["224.13.133.233", ServerOnPort])
												}
											}
											
											
											Horas := Tiempo//3600 ":" FormatTime(DateAdd(19990101, Tiempo, "Seconds"), "mm:ss")
											If ConectStatus
												A_IconTip := LenguajeList.Mensajes["IconTip2"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount "`n" LenguajeList.Mensajes["IconTip3"] " " Horas
											else
												A_IconTip := LenguajeList.Mensajes["IconTip6"] "`n" LenguajeList.Mensajes["IconTip21"] " " UserNameAccount "`n" LenguajeList.Mensajes["IconTip3"] " " Horas
														
											FileDelete "InternetAccount.ini"
										}
									}
								}
								

								if WebOffAccount
									A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
								else if (DataSesion = "")
									A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarCuenta"])
								else
									A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarCuenta"])
									
								
								if !Temporizador
								{
									if (TemporizadorH = 0 and TemporizadorM = 0 and TemporizadorS = 0)
										A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
									else
										A_TrayMenu.Enable(LenguajeList.BarraMenu["PonerTemporizador"])
									A_TrayMenu.Disable(LenguajeList.BarraMenu["QuitarTemporizador"])
								}
								else
								{
									A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
									A_TrayMenu.Enable(LenguajeList.BarraMenu["QuitarTemporizador"])
								}
										
									
								If ConectStatus
								{
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
								} 
								else
								{
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
								}

								if ((NotiConectado and ConectStatus) or (NotiNacional and !ConectStatus))
									TrayTip A_IconTip,, "Mute"
								
								if ConectStatus
								{
									if (SoundConectado != "none")
									{
										soundtoplayretraso := SoundToPlay.Bind(SoundConectado)
										global RetrasoConectado
										if (RetrasoConectado = 0)
											retraso := -1
										else
											retraso := (RetrasoConectado * -1)
									
										SetTimer soundtoplayretraso, retraso
									}
										
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
										global NumberToGif := 1
										
										PlayGiftAction(GifSelectedText1, EfectoEntradaGif1, PosVGif1, UpDownEfectoEntradaGif1, UpDownTiempoEntradaGif1, EfectoSalidaGif1, UpDownEfectoSalidaGif1, BarradeTareasGif1)
									}
								}
								else
								{
								if (SoundNacional != "none")
									{
										soundtoplayretraso := SoundToPlay.Bind(SoundNacional)
										global RetrasoNacional
										if (RetrasoNacional = 0)
											retraso := -1
										else
											retraso := (RetrasoNacional * -1)

										SetTimer soundtoplayretraso, retraso
									}
										
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
										global NumberToGif := 2
										
										PlayGiftAction(GifSelectedText2, EfectoEntradaGif2, PosVGif2, UpDownEfectoEntradaGif2, UpDownTiempoEntradaGif2, EfectoSalidaGif2, UpDownEfectoSalidaGif2, BarradeTareasGif2)
									}
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
											Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Opciones["TemporizadorTexto1"] ":`n" LenguajeList.Mensajes["TrayTip8"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')

										A_TrayMenu.Disable(LenguajeList.BarraMenu["PonerTemporizador"])
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
														TrayTip LenguajeList.Mensajes["TrayTip9"] "`n" FormatSeconds(SecondsTemp-ElapsedTimeTemp), LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
														NotificationTemp += 1
													}
												}
												else if (NotificationTemp = 5)
												{
													if (ElapsedTimeTemp >= SecondsTemp)
													{
														TrayTip LenguajeList.Mensajes["TrayTip10"] "`n" FormatSeconds(0), LenguajeList.Opciones["TemporizadorTexto1"] ":", "Mute"
														
														NotificationTemp := 0
													}
												}
											}
											else
											{	
												if NotiNormal
													Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Opciones["TemporizadorTexto1"] ":`n" LenguajeList.Mensajes["TrayTip11"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')
												
												TemporizadorNotiWindows := 0
												NotificationTemp :=0
											}
										}
									}
									
									if TemporizadorNotiIcon
									{
										if ConectStatus
											NumIcoInit := 5
										else
											NumIcoInit := 10
										
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
														TraySetIcon("Icons.dll", (NumIcoInit+NotificationTempIcon))
													
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
														TraySetIcon("Icons.dll", (NumIcoInit+NotificationTempIcon))
													
												}
											}
											else if (NotificationTempIcon = 5)
											{
												if (ElapsedTimeTemp >= SecondsTemp)
												{
													NotificationTempIcon :=0
													try
													{
														if ConectStatus
															TraySetIcon("Icons.dll", 5)
														else
															TraySetIcon("Icons.dll", 4)
													}
													
												}
											}
										}
										else
										{
											if NotiNormal
												Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Opciones["TemporizadorTexto1"] ":`n" LenguajeList.Mensajes["TrayTip12"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')
												
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
											{
												if ConectStatus
													TraySetIcon("Icons.dll", 5)
												else
													TraySetIcon("Icons.dll", 4)
											}
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
						else 
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
								
								if SetInternetAccountAuto 
									MenuHandler(LenguajeList.BarraMenu["PonerCuenta"], 3, A_TrayMenu)
									
								if Temporizador
								{
									Temporizador := 0
									SecondsTemp := 0
									if NotiNormal
										Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Opciones["TemporizadorTexto1"] ":`n" LenguajeList.Mensajes["TrayTip13"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')

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
								
								if NotiDesconectado
									TrayTip A_IconTip,, "Mute"

								if (SoundDesconectado != "none")
								{
									soundtoplayretraso := SoundToPlay.Bind(SoundDesconectado)
									global RetrasoDesconectado 
									if (RetrasoDesconectado = 0)
										retraso := -1
									else
										retraso := (RetrasoDesconectado * -1)

									SetTimer soundtoplayretraso, retraso
								}
									
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
									global NumberToGif := 3
									
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
						Notify.Show(LenguajeList.Mensajes["Msgbox5"], LenguajeList.Opciones["TemporizadorTexto1"] ":`n" LenguajeList.Mensajes["TrayTip13"], 'Icons.dll|Icon3',,, 'dur=3 SHOW=RollWest@300 HIDE=RollEast@300 TC=white MC=white BC=d89519 Style=EDGE')
					
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
				
				if NotiError
					TrayTip LenguajeList.Mensajes["IconTip10"],, "Mute"
			

				if (SoundError != "none")
				{
					soundtoplayretraso := SoundToPlay.Bind(SoundError)
					global RetrasoError 
					if (RetrasoError = 0)
						retraso := -1
					else
						retraso := (RetrasoError * -1)

					SetTimer soundtoplayretraso, retraso
				}
				
					
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
					global NumberToGif := 4
					
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
	MyGif.Opt("-Caption -Border +AlwaysOnTop +ToolWindow")
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
				try
					IpPromoted := RegRead(A_LoopRegKey, "IsPromoted")
				catch
					IpPromoted := 0
					
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
		{
			prevHW := A_DetectHiddenWindows
			DetectHiddenWindows true
			WinGetPos ,,, &H, "ahk_class Shell_TrayWnd"
			DetectHiddenWindows prevHW
		}
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
    ;TimeOutTime := 4000  ; Optional. Milliseconds to wait for response from receiver.ahk. Default is 5000
    ; Must use SendMessage not PostMessage.
	; RetValue := SendMessage(0x004A, 0, CopyDataStruct,, TargetScriptTitle,,,, TimeOutTime)
    RetValue := SendMessage(0x004A, 0, CopyDataStruct,, TargetScriptTitle,,,, 0) ; 0x004A is WM_COPYDATA.
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
		global NumberToGif

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
			
		if TamanodelGif%NumberToGif%
		{
		  H := LargoGif%NumberToGif%
		  W := AnchoGif%NumberToGif%

		  if RelacionGif%NumberToGif%
		  {
			if ((Ratio1 := this.width / W) > (Ratio2 := this.height / H))
				H := Round(this.height / Ratio1)
			else
				W := Round(this.width / Ratio2)
		  }
		}
		else if RelacionGif%NumberToGif%
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
			if EntradaGifNow and (VoltearEntradaGif%NumberToGif% or VoltearSalidaGif%NumberToGif%)
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

SoundToPlay(sound)
{
	try
		SoundPlay A_WorkingDir "\Sonidos\" sound
}

/*
ValidIP(Ip) {
	IpVerify := StrSplit(Ip, ".")

	if (IpVerify.Length != 4)
		Return 0
		
	For a in IpVerify
	{
		try
		{
			If !isdigit(a)
				Return 0

			If (a < 0 or a > 255)
				Return 0
		}
		Catch
			Return 0
			
	}
	Return 1
}


ConvertMask(Mask)
{
	MapMask := Map()
	Switch Mask
	{
		Case "255.255.255.255", "/32":
		{
			MapMask := Map("Total", 0, "Prefix", "/32", "Mask", "255.255.255.255")
			return MapMask
		}
		Case "255.255.255.254", "/31":
		{
			MapMask := Map("Total", 0, "Prefix", "/31", "Mask", "255.255.255.254")
			return MapMask
		}
		Case "255.255.255.252", "/30":
		{
			MapMask := Map("Total", 2, "Prefix", "/30", "Mask", "255.255.255.252")
			return MapMask
		}
		Case "255.255.255.248", "/29":
		{
			MapMask := Map("Total", 6, "Prefix", "/29", "Mask", "255.255.255.248")
			return MapMask
		}
		Case "255.255.255.240", "/28":
		{
			MapMask := Map("Total", 14, "Prefix", "/28", "Mask", "255.255.255.240")
			return MapMask
		}
		Case "255.255.255.224", "/27":
		{
			MapMask := Map("Total", 30, "Prefix", "/27", "Mask", "255.255.255.224")
			return MapMask
		}
		Case "255.255.255.192", "/26":
		{
			MapMask := Map("Total", 62, "Prefix", "/26", "Mask", "255.255.255.192")
			return MapMask
		}
		Case "255.255.255.128", "/25":
		{
			MapMask := Map("Total", 126, "Prefix", "/25", "Mask", "255.255.255.128")
			return MapMask
		}
		Case "255.255.255.0", "/24":
		{
			MapMask := Map("Total", 254, "Prefix", "/24", "Mask", "255.255.255.0")
			return MapMask
		}
		Case "255.255.254.0", "/23":
		{
			MapMask := Map("Total", 510, "Prefix", "/23", "Mask", "255.255.254.0")
			return MapMask
		}
		Case "255.255.252.0", "/22":
		{
			MapMask := Map("Total", 1022, "Prefix", "/22", "Mask", "255.255.252.0")
			return MapMask
		}
		Case "255.255.248.0", "/21":
		{
			MapMask := Map("Total", 2046, "Prefix", "/21", "Mask", "255.255.248.0")
			return MapMask
		}
		
		Case "255.255.240.0", "/20":
		{
			MapMask := Map("Total", 4094, "Prefix", "/20", "Mask", "255.255.240.0")
			return MapMask
		}
		Case "255.255.224.0", "/19":
		{
			MapMask := Map("Total", 8190, "Prefix", "/19", "Mask", "255.255.224.0")
			return MapMask
		}
		Case "255.255.195.0", "/18":
		{
			MapMask := Map("Total", 16382, "Prefix", "/18", "Mask", "255.255.195.0")
			return MapMask
		}
		Case "255.255.128.0", "/17":
		{
			MapMask := Map("Total", 32766, "Prefix", "/17", "Mask", "255.255.128.0")
			return MapMask
		}
		Case "255.255.0.0", "/16":
		{
			MapMask := Map("Total", 65534, "Prefix", "/16", "Mask", "255.255.0.0")
			return MapMask
		}
		Case "255.254.0.0", "/15":
		{
			MapMask := Map("Total", 131070 "Prefix", "/15", "Mask", "255.254.0.0")
			return MapMask
		}
		Case "255.252.0.0", "/14":
		{
			MapMask := Map("Total", 262142 "Prefix", "/14", "Mask", "255.252.0.0")
			return MapMask
		}
		Case "255.248.0.0", "/13":
		{
			MapMask := Map("Total", 524286 "Prefix", "/13", "Mask", "255.248.0.0")
			return MapMask
		}
		Case "255.240.0.0", "/12":
		{
			MapMask := Map("Total", 1048574 "Prefix", "/12", "Mask", "255.240.0.0")
			return MapMask
		}
		Case "255.224.0.0", "/11":
		{
			MapMask := Map("Total", 2097150 "Prefix", "/11", "Mask", "255.224.0.0")
			return MapMask
		}
		Case "255.192.0.0", "/10":
		{
			MapMask := Map("Total", 4194302 "Prefix", "/10", "Mask", "255.192.0.0")
			return MapMask
		}
		Case "255.128.0.0", "/9":
		{
			MapMask := Map("Total", 8388606 "Prefix", "/9", "Mask", "255.128.0.0")
			return MapMask
		}
		Case "255.0.0.0", "/8":
		{
			MapMask := Map("Total", 16777214 "Prefix", "/8", "Mask", "255.0.0.0")
			return MapMask
		}
		Case "254.0.0.0", "/7":
		{
			MapMask := Map("Total", 33554430 "Prefix", "/7", "Mask", "254.0.0.0")
			return MapMask
		}
		Case "252.0.0.0", "/6":
		{
			MapMask := Map("Total", 67108862, "Prefix", "/6", "Mask", "252.0.0.0")
			return MapMask
		}
		Case "248.0.0.0", "/5":
		{
			MapMask := Map("Total", 134217726 "Prefix", "/5", "Mask", "248.0.0.0")
			return MapMask
		}
		Case "240.0.0.0", "/4":
		{
			MapMask := Map("Total", 268435454 "Prefix", "/4", "Mask", "240.0.0.0")
			return MapMask
		}
		Case "224.0.0.0", "/3":
		{
			MapMask := Map("Total", 536870910 "Prefix", "/3", "Mask", "224.0.0.0")
			return MapMask
		}
		Case "192.0.0.0", "/2":
		{
			MapMask := Map("Total", 1073741822 "Prefix", "/2", "Mask", "192.0.0.0")
			return MapMask
		}
		Case "128.0.0.0", "/1":
		{
			MapMask := Map("Total", 2147483646 "Prefix", "/1", "Mask", "128.0.0.0")
			return MapMask
		}
		Case "0.0.0.0", "/0":
		{
			MapMask := Map("Total", 4294967294 "Prefix", "/0", "Mask", "0.0.0.0")
			return MapMask
		}
		Default:
			return 0
	}
}
*/

Bin(x){
	return (x>>1 ? Bin(x>>1):"") x &1 
}

Dec(x){
	return (StrLen(x) > 1 ? Dec(SubStr(x,1,-1)) << 1:0) | SubStr(x, -1) 
}	



/*
Notify.Show('Error', 'Something has gone wrong!', 'iconx',,, 'BC=C72424')
Notify.Show('Info', 'Some information to show.', 'iconi',,, 'TC=black MC=black BC=75AEDC')
*/
/********************************************************************************************
@description Notify - This class makes it easier to create and display notification GUIs.
@author XMCQCX
@date 2024/07/05
@version 1.6.0
@see {@link https://github.com/XMCQCX/Notify_Class Notify_Class - GitHub} | {@link https://www.autohotkey.com/boards/viewtopic.php?f=83&t=129635 Notify_Class - AHK Forum}
@credits
- Notify by gwarble. {@link https://www.autohotkey.com/board/topic/44870-notify-multiple-easy-tray-area-notifications-v04991/ source}
- Notify by the-Automator. {@link https://www.the-automator.com/downloads/maestrith-notify-class-v2/ source}
- FrameShadow by Klark92. {@link https://www.autohotkey.com/boards/viewtopic.php?f=6&t=29117&hilit=FrameShadow source}
- WiseGui by SKAN. {@link https://www.autohotkey.com/boards/viewtopic.php?t=94044 source}
@features
- Change text, font, color, image, animation.
- Rounded or edged corners.
- Position at different locations on the screen.
- Multi-Monitor support.
- Multi-Script support. Finds all GUIs from all scripts and positions them accordingly.
- Play a sound when it appears.
- Call a function when clicking on it.
@methods
- Show - Builds and shows a notification GUI.
- SoundsList() - Lists and plays all available sounds.
- MonitorGetInfo() - Displays information about the monitors connected to the system.
- Exist(tag) - Checks if a GUI with the specified tag exists and returns the unique ID (HWND) of the first matching GUI.
- Destroy(hwnd or tag) - Destroys GUIs. Specifying a tag destroys every GUI containing this tag across all scripts.
- DestroyAllOnMonitorAtPosition(monitorNumber, position) - Destroys all GUIs on a specific monitor at a specific position.
- DestroyAllOnAllMonitorAtPosition(position) - Destroys all GUIs on all monitors at a specific position.
- DestroyAllOnMonitor(monitorNumber) - Destroys all GUIs on a specific monitor.
- DestroyAll() - Destroys all GUIs.
@example
#include <v2\Notify\Notify>
Notify.MonitorGetInfo()
Notify.Show('The quick brown fox jumps over the lazy dog.',,,,, 'dur=4 pos=tc')
Notify.Show('Alert!', 'You are being warned.', 'icon!',,, 'TC=black MC=black BC=DCCC75')
Notify.Show('Error', 'Something has gone wrong!', 'iconx', 'soundx',, 'BC=C72424 style=edge show=expand hide=expand')
Notify.Show('Info', 'Some information to show.', 'iconi',,, 'TC=black MC=black BC=75AEDC style=edge show=slideWest@250 hide=slideEast@250')

; ===== Destroy a specific GUI. =====

mNotifyGUI := Notify.Show('The quick brown fox jumps over the lazy dog.',,,,, 'dur=0 pos=tc')
^F1::Notify.Destroy(mNotifyGUI['hwnd'])

; With the TAG option. It destroys every GUI containing this tag across all scripts.

Notify.Show('Notify Title',,,,, 'dur=0 pos=ct tag=myTAG')
^F2::Notify.Destroy('myTAG')

; ===== Modify the icon and text upon left-clicking the GUI using a callback. =====

mNotifyGUI_CB := Notify.Show('Title value 0', 'Message value 0', A_WinDir '\system32\user32.dll|Icon5',, NotifyGUICallback, 'dur=0 dgc=0')

NotifyGUICallback(*)
{
    mNotifyGUI_CB['pic'].Value := A_WinDir '\system32\user32.dll'

    Loop 3 {
        mNotifyGUI_CB['title'].Text := 'Title value ' A_Index
        mNotifyGUI_CB['msg'].Text := 'Message value ' A_Index      
        Sleep(2000)
    }

    Notify.Destroy(mNotifyGUI_CB['hwnd'])
}

; ===== Progress Bar Example. =====

mNotifyGUI_Prog := Notify.Show('Progress Bar Example',,,,, 'dur=0 prog=w325 dgc=0')

Loop 5 {
    mNotifyGUI_Prog['prog'].Value := A_Index * 20
    Sleep(1000)
}

Notify.Destroy(mNotifyGUI_Prog['hwnd'])

; ===== Lock keys indicators. =====

~*NumLock:: 
~*ScrollLock::
~*Insert::	
{
    Sleep(10)  
	thisHotkey := SubStr(A_ThisHotkey, 3)
	Notify.Destroy(thisHotkey)

	if (GetKeyState(thisHotkey, 'T'))
		Notify.Show(thisHotkey ' ON',,,,, 'pos=bl dur=3 ts=20 tfo=italic bc=00A22B style=edge show=0 dgc=0 tag=' thisHotkey)
	else
		Notify.Show(thisHotkey ' OFF',,,,, 'pos=bl dur=3 ts=20 tfo=italic bc=F09800 style=edge show=0 dgc=0 tag=' thisHotkey) 		
}

~*CapsLock:: 
{
	Sleep(10)
	thisHotkey := SubStr(A_ThisHotkey, 3)
	Notify.Destroy(thisHotkey)

	if (GetKeyState(thisHotkey, 'T'))
		Notify.Show(thisHotkey ' ON',,,,, 'pos=bl dur=0 ts=20 tfo=italic tc=red bc=white dgc=0 tag=' thisHotkey)  
}

********************************************************************************************/
Class Notify {

/********************************************************************************************
@method Show(title, msg, icon, sound, callback, options)
@description Builds and shows a notification GUI.    
@param title Title
@param msg Message
@param icon {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Picture Picture GuiControls}
- The path of an icon/picture. See the link above for supported file types.
- String: `'icon!'`, `'icon?'`, `'iconx'`, `'iconi'`
- Icon from dll: `A_WinDir '\system32\user32.dll|Icon4'`
@param sound {@link https://www.autohotkey.com/docs/v2/lib/SoundPlay.htm SoundPlay function}
- The path of the WAV file to be played.
- String: `'soundx'`, `'soundi'`
- Filename of WAV file located in "C:\Windows\Media" and "Music\Sounds". For example: `'Ding'`, `'tada'`, `'Windows Error'` etc.
- Call `Notify.SoundsList()` to list and hear all the available sounds.
@param callback Function object to call when left-clicking on the GUI. {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm Function Objects}
@param options For example: `'POS=TL DUR=6 IW=70 TF=Impact TS=42 TC=GREEN MC=blue BC=Silver STYLE=edge SHOW=Fade Hide=Fade@250'`
- The string is case-insensitive.
- The asterisk (*) indicates the default option.
- `POS` - Position
  - `BR` - Bottom right*
  - `BC` - Bottom center
  - `BL` - Bottom left
  - `TL` - Top left
  - `TC` - Top center
  - `TR` - Top right
  - `CT` - Center
- `DUR` - Display duration (in seconds). Set it to 0 to keep it on the screen until left-clicking on the GUI. `*8`
- `MON` - Monitor number to display the GUI. Call `Notify.MonitorGetInfo()` to show the monitor numbers. AutoHotkey displays different monitor numbers than Windows System Display and NVIDIA Control Panel.
- `IW` - Image width - `*32` If only one dimension (width or height) is specified, the other dimension will be automatically set preserving its aspect ratio.
- `IH` - Image height `*32`
- `TF` - Title font `*Segoe UI bold`
- `TFO` - Title font options. For example: `tfo=underline italic strike`
- `TS` - Title size `*15`
- `TC` - Title color `*White`
- `TALI` - Title alignment
  - `LEFT`*
  - `RIGHT`
  - `CENTER`
- `MF` - Message font `*Segoe UI`
- `MFO` - Message font options. For example: `mfo=underline italic strike`
- `MS` - Message size `*12`
- `MC` - Message color `*White`
- `MALI` - Message alignment
  - `LEFT`* 
  - `RIGHT`
  - `CENTER`
- `PROG` - Progress bar. For example: `prog=w325`, `prog=w200 h80 cGreen` {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Progress Progress Options}
- `BC` - Background color `*1F1F1F`
- `STYLE` - Notification style
  - `ROUND` - Rounded corners*
  - `EDGE` - Edged corners
- `TAG` - Marker to identify a GUI. The Destroy method accepts a handle or a tag, it destroys every GUI containing this tag across all scripts.
- `BDR` - Border. Not compatible with the round style.
  - `0` - No border
  - `1` - Border*
- `WSTC` - WinSetTransColor. Not compatible with the round style, fade animation. For example: `style=edge bdr=0 bc=black WSTC=black` {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransColor.htm WinSetTransColor}
- `WSTP` - WinSetTransparent. Not compatible with the round style, fade animation. For example: `style=edge wstp=120` {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransparent.htm WinSetTransparent} 
- `PADX` - The space between the left or right edge of the GUI and the edge of the screen. Can range from 0 to 25.
- `PADY` - The space between the top or bottom edge of the first GUI created at a position and the edge of the screen. Can range from 0 to 25.
- `SHOW` and `HIDE` - Animation when showing and hiding the GUI. The duration, which is optional, can range from 1 to 2500 milliseconds. For example: `STYLE=EDGE SHOW=SLIDEWEST HIDE=SLIDEEAST@250`
- THE ROUND STYLE IS NOT COMPATIBLE WITH MOST ANIMATIONS! The round style renders only the fade-in (SHOW=Fade@225) animation correctly. The corners become edged during the fade-out if (HIDE=Fade@225) is used.
  - `0` - No animation.
  - `Fade`
  - `Expand`
  - `SlideEast`
  - `SlideWest`
  - `SlideNorth`
  - `SlideSouth`
  - `SlideNorthEast`
  - `SlideNorthWest`
  - `SlideSouthEast`
  - `SlideSouthWest`
  - `RollEast`
  - `RollWest`
  - `RollNorth`
  - `RollSouth`
  - `RollNorthEast`
  - `RollNorthWest`
  - `RollSouthEast`
  - `RollSouthWest`
- `DGC` - Destroy GUI click. Allow or prevent the GUI from being destroyed when clicked.
  - `0` - Clicking on the GUI does not destroy it.   
  - `1` - Clicking on the GUI destroys it.*
- `DG` - Destroy GUIs before creating the new GUI.
  - `0` - Do not destroy GUIs.*
  - `1` - Destroy all GUIs on the monitor option at the position option.
  - `2` - Destroy all GUIs on all monitors at the position option.
  - `3` - Destroy all GUIs on the monitor option.
  - `4` - Destroy all GUIs.
  - `5` - Destroy all GUIs containing the tag. For example: `tag=myTAG dg=5`
- `OPT` - Sets various options and styles for the appearance and behavior of the window. `*+Owner -Caption +AlwaysOnTop` {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Opt GUI Opt}    
@returns Map object
********************************************************************************************/
    static Show(title:='', msg:='', icon:='', sound:='', callback:='', options:='') => this._Show(title, msg, icon, sound, callback, options)
    
    static __New()
    {
        this.mNotifyGUIs := Map(), this.mNotifyGUIs.CaseSense := 'off'
        this.mDefault := Map(), this.mDefault.CaseSense := 'off'
        this.mDefault['pos'] := 'br'           ; Position
        this.mDefault['dur'] := 8              ; Duration    
        this.mDefault['iw'] := 32              ; Image width
        this.mDefault['ih'] := 32              ; Image height
        this.mDefault['tf'] := 'Segoe UI bold' ; Title font
        this.mDefault['tfo'] := ''             ; Title font options.
        this.mDefault['ts'] := 15              ; Title size
        this.mDefault['tali'] := 'left'        ; Title alignment
        this.mDefault['tc'] := 'white'         ; Title color
        this.mDefault['mf'] := 'Segoe UI'      ; Message font
        this.mDefault['mfo'] := ''             ; Message font options.
        this.mDefault['ms'] := 12              ; Message size
        this.mDefault['mc'] := 'white'         ; Message color
        this.mDefault['mali'] := 'left'        ; Message alignment
        this.mDefault['prog'] := ''            ; Progress bar
        this.mDefault['bc'] := '1F1F1F'        ; Background color
        this.mDefault['style'] := 'round'      ; Style
        this.mDefault['tag'] := ''             ; GUI window title identifying marker.
        this.mDefault['dg'] := 0               ; Destroy GUIs.
        this.mDefault['dgc'] := 1              ; Destroy GUI click.
        this.mDefault['bdr'] := 1              ; Border   
        this.mDefault['wstc'] := ''            ; WinSetTransColor 
        this.mDefault['wstp'] := ''            ; WinSetTransparent    
        this.mDefault['mon'] := MonitorGetPrimary() ; Monitor number to display the GUI.
        this.mDefault['opt'] := '+Owner -Caption +AlwaysOnTop' ; GUI options        
        this.padH := 10 ; Space between GUIs

        this.mAW := Map(), this.mAW.CaseSense := 'off'  
        this.mAW['0']              := 0         ; No animation
        this.mAW['fade']           := '0x80000' ; AW_BLEND
        this.mAW['expand']         := '0x00010' ; AW_CENTER
        this.mAW['slideEast']      := '0x40001' ; AW_SLIDE | AW_HOR_POSITIVE
        this.mAW['slideWest']      := '0x40002' ; AW_SLIDE | AW_HOR_NEGATIVE
        this.mAW['slideNorth']     := '0x40008' ; AW_SLIDE | AW_VER_NEGATIVE
        this.mAW['slideSouth']     := '0x40004' ; AW_SLIDE | AW_VER_POSITIVE
        this.mAW['slideNorthEast'] := '0x40009' ; AW_SLIDE | AW_VER_NEGATIVE | AW_HOR_POSITIVE
        this.mAW['slideNorthWest'] := '0x4000A' ; AW_SLIDE | AW_VER_NEGATIVE | AW_HOR_NEGATIVE
        this.mAW['slideSouthEast'] := '0x40005' ; AW_SLIDE | AW_VER_POSITIVE | AW_HOR_POSITIVE
        this.mAW['slideSouthWest'] := '0x40006' ; AW_SLIDE | AW_VER_POSITIVE | AW_HOR_NEGATIVE
        this.mAW['rollEast']       := '0x00001' ; AW_HOR_POSITIVE
        this.mAW['rollWest']       := '0x00002' ; AW_HOR_NEGATIVE    
        this.mAW['rollNorth']      := '0x00008' ; AW_VER_NEGATIVE
        this.mAW['rollSouth']      := '0x00004' ; AW_VER_POSITIVE
        this.mAW['rollNorthEast']  := '0x00009' ; ROLL_DIAG_BL_TO_TR
        this.mAW['rollNorthWest']  := '0x0000a' ; ROLL_DIAG_BR_TO_TL 
        this.mAW['rollSouthEast']  := '0x00005' ; ROLL_DIAG_TL_TO_BR 
        this.mAW['rollSouthWest']  := '0x00006' ; ROLL_DIAG_TR_TO_BL 
        
        this.mIconsUser32 := Map(), this.mIconsUser32.CaseSense := 'off'
        this.mIconsUser32['icon!'] := 2
        this.mIconsUser32['icon?'] := 3
        this.mIconsUser32['iconx'] := 4
        this.mIconsUser32['iconi'] := 5             

        this.pathSoundsFolder := RegRead('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', 'My Music') '\Sounds'
        this.mSounds := Map(), this.mSounds.CaseSense := 'off'
        this.mSounds['soundx'] := '*16'
        this.mSounds['soundi'] := '*64'

        for _, path in [A_WinDir '\Media', this.pathSoundsFolder]
            Loop Files path '\*.wav'
                SplitPath(A_LoopFilePath,,,, &fileName), this.mSounds[fileName] := A_LoopFilePath

        this.aSounds := Array()

        for soundName in this.mSounds
            this.aSounds.Push(soundName)       
    }

    ;============================================================================================

    static _Show(title:='', msg:='', icon:='', sound:='', callback:='', options:='') 
    {           
        static gIndex := 0, padXpicTxt := 10

        if !title && !msg && !icon
            return   
        
        m := Map(), m.CaseSense := 'off'

        while RegExMatch(Trim(options), 'i)(\w+)=(.*?(?=\s+\w+=|$))', &match, IsSet(match) ? match.Pos + match.Len : 1)
            m[Trim(match[1])] := Trim(match[2])            

        switch {
            case (m.has('iw') && !m.has('ih')) : m['ih'] := -1
            case (m.has('ih') && !m.has('iw')) : m['iw'] := -1
        }

        for key, value in this.mDefault
            if !m.has(key)
                m[key] := value

        for value in ['show', 'hide'] {          
            if (m.has(value)) {
                p := StrSplit(m[value], '@')
                m[value 'Hex'] := this.mAW[p[1]]
                (p.Length > 1) ? m[value 'Dur'] := Min(2500, Max(1, Format("{:d}", p[2]))) : ''
            }
        }

        m['mon'] := Integer(m['mon'])
        monCount := MonitorGetCount()

        if !(m['mon'] >= 1 && m['mon'] <= monCount)
            m['mon'] := MonitorGetPrimary()

        ;==============================================

        if !RegExMatch(m['style'], 'i)(round|edge)$')
            m['style'] := this.mDefault['style']         
 
        switch m['style'], 'off' {
            case 'edge':
            {
                if !m.has('showHex') {
                    switch m['pos'], 'off' {
                        case 'br', 'tr': m['showHex'] := this.mAW['slideWest']
                        case 'bl', 'tl': m['showHex'] := this.mAW['slideEast']
                        case 'bc': m['showHex'] := this.mAW['slideNorth']
                        case 'tc': m['showHex'] := this.mAW['slideSouth']
                        case 'ct': m['showHex'] := this.mAW['expand']
                    }
                }

                if !m.has('hideHex') {
                    switch m['pos'], 'off' {
                        case 'br', 'tr': m['hideHex'] := this.mAW['slideEast']
                        case 'bl', 'tl': m['hideHex'] := this.mAW['slideWest']
                        case 'bc': m['hideHex'] := this.mAW['slideSouth']
                        case 'tc': m['hideHex'] := this.mAW['slideNorth']
                        case 'ct': m['hideHex'] := this.mAW['expand']
                    }
                }
              
                (!m.has('showDur')) ? m['showDur'] := 75 : '' 
                (!m.has('hideDur')) ? m['hideDur'] := 100 : '' 
                (!m.has('padX')) || !(m['padX'] >= 0 && m['padX'] <= 25) ? m['padX'] := 0 : ''  
                (!m.has('padY')) || !(m['padY'] >= 0 && m['padY'] <= 25) ? m['padY'] := 0 : ''                                   
            }

            case 'round': 
            {
                (!m.has('showHex')) ? m['showHex'] := this.mAW['fade'] : ''                              
                (!m.has('hideHex')) ? m['hideHex'] := this.mAW['0'] : ''
                (!m.has('showDur')) ? m['showDur'] := 1 : ''
                (!m.has('hideDur')) ? m['hideDur'] := 0 : ''                
                (!m.has('padX') || !(m['padX'] >= 0 && m['padX'] <= 25)) ? m['padX'] := 10 : '' 
                (!m.has('padY') || !(m['padY'] >= 0 && m['padY'] <= 25)) ? m['padY'] := 10 : ''                 
            }
        }

        ;==============================================  

        switch m['dg'] {
            case 1: this.DestroyAllOnMonitorAtPosition(m['mon'], m['pos'])
            case 2: this.DestroyAllOnAllMonitorAtPosition(m['pos'])
            case 3: this.DestroyAllOnMonitor(m['mon'])
            case 4: this.DestroyAll()
            case 5: m['tag'] ? this.Destroy(m['tag']) : ''
        }

        ;==============================================
       
        g := Gui(m['opt'], 'NotifyGUI_' m['mon'] '_' m['pos'] '_' m['padY'] (m['tag'] ? '_' m['tag'] : ''))
        g.BackColor := m['bc']
        g.MarginX := 15
        g.MarginY := 15
        g.gIndex := ++gIndex
        m['hwnd'] := g.handle := g.hwnd
     
        for value in ['pos', 'mon', 'hideHex', 'hideDur', 'tag']
            g.%value% := m[value]
            
        ;==============================================          

        switch {
            case FileExist(icon) || RegExMatch(icon, 'i)h(icon|bitmap).*\d+'):  
                try m['pic'] := g.Add('Picture', 'w' m['iw'] ' h' m['ih'], icon)
                    
            case RegExMatch(icon, 'i)^(icon!|icon\?|iconx|iconi)$'):           
                try m['pic'] := g.Add('Picture', 'w' m['iw'] ' h' m['ih'] ' Icon' this.mIconsUser32[icon], A_WinDir '\system32\user32.dll')

            case RegExMatch(icon, 'i)(.+?\.(?:dll|exe))\|icon(\d+)', &mth) && FileExist(mth[1]):
                try m['pic'] := g.Add('Picture', 'w' m['iw'] ' h' m['ih'] ' Icon' mth[2], mth[1])
        }

        ;============================================== 

        MonitorGetWorkArea(m['mon'], &monWALeft, &monWATop, &monWARight, &monWABottom)
        monWAwidth := Abs(monWARight - monWALeft)
        monWAheight := Abs(monWABottom - monWATop)
        visibleScreenWidth := monWAwidth / (A_ScreenDPI / 94) - m['padX']*2
       
        if m.Has('pic')
            picWidth := this.ControlGetPicWidth(m['pic'], monWALeft, monWATop) + padXpicTxt + g.MarginX*2   
     
        if title
            titleCtrlW := this.ControlGetTextWidth(title, m['tf'], m['ts'], monWALeft, monWATop)

        if msg
            msgCtrlW := this.ControlGetTextWidth(msg, m['mf'], m['ms'], monWALeft, monWATop)

        if title && (titleCtrlW + (IsSet(picWidth) ? picWidth : 0)) > (visibleScreenWidth)           
            titleWidth := visibleScreenWidth - (IsSet(picWidth) ? picWidth : 0)

        if m['prog'] && RegExMatch(m['prog'], 'i)\bw(\d+)\b', &match_width)
            progUserW := match_width[1]

        if (m['prog'] && IsSet(progUserW)) && ((progUserW + (IsSet(picWidth) ? picWidth : 0)) > (visibleScreenWidth))  
            progWidth := visibleScreenWidth - (IsSet(picWidth) ? picWidth : 0)
      
        if msg && (msgCtrlW + (IsSet(picWidth) ? picWidth : 0)) > (visibleScreenWidth) 
            msgWidth := visibleScreenWidth - (IsSet(picWidth) ? picWidth : 0)

        if (title && msg) || (title && m['prog']) || (msg && m['prog']) {
            titleWidth := msgWidth := progWidth := Max( 
                (title && IsSet(titleWidth) ? titleWidth : IsSet(titleCtrlW) ? titleCtrlW : 0),  
                (msg && IsSet(msgWidth) ? msgWidth : IsSet(msgCtrlW) ? msgCtrlW : 0),  
                (m['prog'] && IsSet(progWidth) ? progWidth : IsSet(progUserW) ? progUserW : 0)
            )           
        }

        ;==============================================        
        
        if (title) {
            g.SetFont('s' m['ts'] ' c' m['tc'] ' ' m['tfo'], m['tf'])
            m['title'] := g.Add('Text', m['tali'] (IsSet(picWidth) ? ' x+' padXpicTxt : '') (IsSet(titleWidth) ? ' w' titleWidth : ''), title)                                     
            m['tfo'] ? g.SetFont() : ''     
        }

        if (m['prog']) {
            m['prog'] = 1 ? m['prog'] := '' : ''                 
            m['prog'] := g.Add('Progress', (!title && IsSet(picWidth) ? ' x+' padXpicTxt : '') ' ' m['prog'] (!IsSet(progWidth) || (IsSet(progUserW) && (progUserW < progWidth)) ? '':  ' w' progWidth))
        }

        if (msg) {
            title ? g.MarginY := 6 : ''               
            g.SetFont('s' m['ms'] ' c' m['mc'] ' ' m['mfo'], m['mf'])
            m['msg'] := g.Add('Text', m['mali'] ((!title && !m['prog']) && IsSet(picWidth) ? ' x+' padXpicTxt : '') (IsSet(msgWidth) ? ' w' msgWidth : ''), msg)
        }

        g.MarginY := 15
        g.Show('Hide')
        WinGetPos(,, &gW, &gH, g)
        clickArea := g.Add('Text', 'x0 y0 w' gW ' h' gH ' BackgroundTrans')

        if callback
            clickArea.OnEvent('Click', callback)
        
        if (m['dgc'])
            clickArea.OnEvent('Click', this.gDestroy.Bind(this, g, 'clickArea'))

        g.OnEvent('Close', this.gDestroy.Bind(this, g, 'close'))
        g.boundFuncTimer := this.gDestroy.Bind(this, g, 'timer')
        
        if sound
            this.Sound(sound)
        
        ;==============================================
        
        switch m['pos'], 'off' {
            case 'br', 'bc', 'bl': minMaxPosY := monWABottom              
            case 'tr', 'tc', 'tl', 'ct': minMaxPosY := monWATop  
        }

        mDhwTmm := this.Set_DHWindows_TMMode(0, 'RegEx')  

        for id in WinGetList('i)^NotifyGUI_' m['mon'] '_' m['pos'] ' ahk_class AutoHotkeyGUI') {            
            WinGetPos(, &guiY,, &guiH, 'ahk_id ' id)
            switch m['pos'], 'off' {
                case 'br', 'bc', 'bl': minMaxPosY := Min(minMaxPosY, guiY)               
                case 'tr', 'tc', 'tl', 'ct': minMaxPosY := Max(minMaxPosY, guiY + guiH)
            }
        }

        this.Set_DHWindows_TMMode(mDhwTmm['dhwPrev'], mDhwTmm['tmmPrev'])

        switch m['pos'], 'off' {
            case 'br':
            {           
                if minMaxPosY = monWABottom
                    gPos := 'x' monWARight - gW - m['padX'] ' y' monWABottom - gH - m['padY']
                else 
                    gPos := 'x' monWARight - gW - m['padX'] ' y' minMaxPosY - gH - this.padH                                 
            }
            case 'bc':
            {
                if minMaxPosY = monWABottom
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y'  monWABottom - gH - m['padY']         
                else
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y' minMaxPosY - gH - this.padH
            }
            case 'bl': 
            {
                if minMaxPosY = monWABottom
                    gPos := 'x' monWALeft + m['padX'] ' y' monWABottom - gH - m['padY']
                else 
                    gPos := 'x' monWALeft + m['padX'] ' y' minMaxPosY - gH - this.padH                 
            }          
            case 'tl': 
            {
                if minMaxPosY = monWATop
                    gPos := 'x' monWALeft + m['padX'] ' y' monWATop + m['padY']
                else
                    gPos := 'x' monWALeft + m['padX'] ' y' minMaxPosY + this.padH 
            }              
            case 'tc': 
            {
                if minMaxPosY = monWATop
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y' monWATop + m['padY']
                else
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y' minMaxPosY + this.padH 
            }          
            case 'tr': 
            {
                if minMaxPosY = monWATop
                    gPos := 'x' monWARight - m['padX'] - gW ' y' monWATop + m['padY']
                else
                    gPos := 'x' monWARight - m['padX'] - gW ' y' minMaxPosY + this.padH
            }     
            case 'ct':
            {
                if minMaxPosY = monWATop
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y' monWATop + (monWAheight/2 - gH/2)
                else
                    gPos := 'x' (monWARight - monWAwidth/2 - gW/2) ' y' minMaxPosY + this.padH
            }
        }

        switch g.pos, 'off' {    
            case 'br', 'bc', 'bl': (minMaxPosY < (monWATop + gH + this.padH)) ? outOfWorkArea := true : ''       
            case 'tr', 'tc', 'tl', 'ct': (minMaxPosY > (monWABottom - gH - this.padH)) ? outOfWorkArea := true : ''           
        }

        if m['dur']
            SetTimer(g.boundFuncTimer, -((m['dur'] + (IsSet(outOfWorkArea) ? 8 : 0)) * 1000 + m['showDur']))

        ;==============================================    
        
        this.mNotifyGUIs[gIndex] := g
        
        switch m['style'], 'off' {
            case 'round': this.FrameShadow(g.hwnd)
            case 'edge': m['bdr'] ? g.Opt('+Border'): ''
        }
                                     
        if m['wstp']
            WinSetTransparent(m['wstp'], g)

        if m['wstc']
            WinSetTransColor(m['wstc'], g)

        if m['showHex']
            g.Show(gPos ' NoActivate Hide'), DllCall('AnimateWindow', 'Ptr', g.hwnd, 'Int', m['showDur'], 'Int', m['showHex'])  
        else
            g.Show(gPos ' NoActivate')
            
        return m
    }

    ;============================================================================================

    static gDestroy(g, fromMethod:='', *)
    {
        SetTimer(g.boundFuncTimer, 0)

        if g.hideHex && !RegExMatch(fromMethod, '^(Destroy|close)')
            DllCall('AnimateWindow', 'Ptr', g.hwnd, 'Int', g.hideDur, 'Int', Format("{:#X}", g.hideHex + 0x10000))
     
        g.Destroy()

        if this.mNotifyGUIs.Has(g.gIndex)
            this.mNotifyGUIs.Delete(g.gIndex) 

        ;==============================================
        
        Sleep(10)        
        aGUIs := Array()
        mDhwTmm := this.Set_DHWindows_TMMode(0, 'RegEx')

        for id in WinGetList('i)^NotifyGUI_' g.mon '_' g.pos ' ahk_class AutoHotkeyGUI') {            
            try {
                WinGetPos(, &gY,, &gH, 'ahk_id ' id)
                RegExMatch(WinGetTitle('ahk_id ' id), 'i)^NotifyGUI_\d+_[a-z]+_(\d+)', &match)           
                aGUIs.Push(Map('gY', gY, 'gH', gH, 'id', id, 'padY', match[1]))
            } catch {
                aGUIs := Array()
                break
            }
        }
        
        this.Set_DHWindows_TMMode(mDhwTmm['dhwPrev'], mDhwTmm['tmmPrev'])
        
        if (aGUIs.Length) {
            MonitorGetWorkArea(g.mon,, &monWATop,, &monWABottom)
            monWAheight := Abs(monWABottom - monWATop)
            SetWinDelay(0)
            
            switch g.pos, 'off' {
                case 'br', 'bc', 'bl': aGUIs := this.SortArrayGUIPosY(aGUIs, true),  posY := monWABottom - aGUIs[1]['padY']               
                case 'tr', 'tc', 'tl', 'ct': aGUIs := this.SortArrayGUIPosY(aGUIs),  posY := monWATop + aGUIs[1]['padY']
            }           
            
            for _, value in aGUIs {
                switch g.pos, 'off'{
                    case 'br', 'bc', 'bl': posY -= value['gH']        
                    case 'ct': (A_Index = 1 ? posY := monWATop + monWAheight/2 - value['gH']/2 : '') 
                }                    
                
                if (Abs(posY - value['gY']) > 10) {
                    try WinMove(, posY,,, 'ahk_id ' value['id'])
                    catch
                        break
                }

                switch g.pos, 'off' {    
                    case 'br', 'bc', 'bl': posY -= this.padH        
                    case 'tr', 'tc', 'tl', 'ct': posY += value['gH'] + this.padH 
                } 
            }
        }
    }

    ;============================================================================================

    static Exist(tag)
    {
        mDhwTmm := this.Set_DHWindows_TMMode(0, 'RegEx')

        for id in WinGetList('i)^NotifyGUI_\d+_[a-z]+_\d+_\Q' tag '\E$ ahk_class AutoHotkeyGUI') {
            idFound := id
            break
        }

        this.Set_DHWindows_TMMode(mDhwTmm['dhwPrev'], mDhwTmm['tmmPrev'])

        if IsSet(idFound)
            return idFound
        
        return 0
    }       

    ;============================================================================================

    static Destroy(str)
    {
        mDhwTmm := this.Set_DHWindows_TMMode(0, A_TitleMatchMode)        
        SetWinDelay(25)
     
        if (WinExist('ahk_id ' str)) {
            for gIndex, value in this.mNotifyGUIs.Clone() {
                if (str = value.handle && this.mNotifyGUIs.Has(gIndex)) {
                    this.gDestroy(this.mNotifyGUIs[gIndex], 'Destroy')   
                    break  
                }
            }                    

            SetTitleMatchMode(1)     
            for id in WinGetList('NotifyGUI_ ahk_class AutoHotkeyGUI') {
                if (str = id) { 
                    try WinClose('ahk_id ' id)
                    break
                }
            }              
        }         
        
        for gIndex, value in this.mNotifyGUIs.Clone()
            if str = value.tag && this.mNotifyGUIs.Has(gIndex)
                this.gDestroy(this.mNotifyGUIs[gIndex], 'Destroy')   

        SetTitleMatchMode('RegEx')                                   
        for id in WinGetList('i)^NotifyGUI_\d+_[a-z]+_\d+_\Q' str '\E$ ahk_class AutoHotkeyGUI')                                                              
            try WinClose('ahk_id ' id)  
        
        this.Set_DHWindows_TMMode(mDhwTmm['dhwPrev'], mDhwTmm['tmmPrev'])                             
    }

    ;============================================================================================

    static DestroyAllOnMonitorAtPosition(monNum, position)
    {                                    
        for gIndex, value in this.mNotifyGUIs.Clone()
            if value.mon = monNum && value.pos = position && this.mNotifyGUIs.Has(gIndex)
                this.gDestroy(this.mNotifyGUIs[gIndex], 'DestroyAllOnMonitorAtPosition')  
        
        this.WinGetList_WinClose('i)^NotifyGUI_' monNum '_' position ' ahk_class AutoHotkeyGUI', 0, 'RegEx')    
    }

    ;============================================================================================

    static DestroyAllOnAllMonitorAtPosition(position) 
    {
        for gIndex, value in this.mNotifyGUIs.Clone()
            if value.pos = position && this.mNotifyGUIs.Has(gIndex) 
                this.gDestroy(this.mNotifyGUIs[gIndex], 'DestroyAllOnAllMonitorAtPosition')

        this.WinGetList_WinClose('i)^NotifyGUI_\d+_' position ' ahk_class AutoHotkeyGUI', 0, 'RegEx')
    }    

    ;============================================================================================    

    static DestroyAllOnMonitor(monNum)
    {             
        for gIndex, value in this.mNotifyGUIs.Clone()
            if value.mon = monNum && this.mNotifyGUIs.Has(gIndex)
                this.gDestroy(this.mNotifyGUIs[gIndex], 'DestroyAllOnMonitor') 
        
        this.WinGetList_WinClose('NotifyGUI_' monNum ' ahk_class AutoHotkeyGUI', 0, 1)                      
    } 

    ;============================================================================================

    static DestroyAll()
    {           
        for gIndex, value in this.mNotifyGUIs.Clone()                              
            if this.mNotifyGUIs.Has(gIndex)
                this.gDestroy(this.mNotifyGUIs[gIndex], 'DestroyAll')
        
        this.WinGetList_WinClose('NotifyGUI_ ahk_class AutoHotkeyGUI', 0, 1)                           
    } 

    ;============================================================================================

    static WinGetList_WinClose(winTtile, dhWindows, tmMode)
    {
        mDhwTmm := this.Set_DHWindows_TMMode(dhWindows, tmMode)
        SetWinDelay(25)
        
        for id in WinGetList(winTtile)
            try WinClose('ahk_id ' id)

        this.Set_DHWindows_TMMode(mDhwTmm['dhwPrev'], mDhwTmm['tmmPrev'])        
    }    

    ;============================================================================================

    static Set_DHWindows_TMMode(dhw, tmm)
    {
        dhwPrev := A_DetectHiddenWindows
        tmmPrev := A_TitleMatchMode
        DetectHiddenWindows(dhw)
        SetTitleMatchMode(tmm) 
        return Map('dhwPrev', dhwPrev, 'tmmPrev', tmmPrev)
    }    

    ;============================================================================================

    static Sound(sound)
    {
        if RegExMatch(sound, 'i)^(soundx|soundi)$') || this.mSounds.Has(sound)
            sound := this.mSounds[sound]

        if FileExist(sound) || RegExMatch(sound,'^\*\-?\d+')
            Soundplay(sound)
    }

    ;============================================================================================

    static SoundsList()
    {
        static gHwnd := 0

        if WinExist('ahk_id ' gHwnd)
            return     

        this.gSnd := Gui(, 'Notify - Sounds list')
        gHwnd := this.gSnd.hwnd
        this.gSnd.MarginY := 15
        this.gSnd.OnEvent('Close', (*) => this.gSnd.Destroy())
        this.gSnd.ddl := this.gSnd.Add('DropDownList', 'w260 Choose1', this.aSounds)
        this.gSnd.ddl.OnEvent('Change', this.gSnd_ddl_CtrlChange.Bind(this))
        this.gSnd.btn := this.gSnd.Add('Button',, 'Save to Clipboard')
        this.gSnd.btn.OnEvent('Click', this.gSnd_SaveToClipboard.Bind(this))
        this.gSnd.Show()
    }   

    ;============================================================================================

    static gSnd_SaveToClipboard(*) 
    {
        this.Destroy('SaveToClipboard')
        A_Clipboard := ''
        A_Clipboard := this.gSnd.ddl.Text

        if ClipWait(1)
            this._Show('"' A_Clipboard '"', 'Saved to clipboard.', 'iconi',,, 'pos=bc dur=5 tag=SaveToClipboard')
        else
            this._Show('Error', 'Save to clipboard failed.', 'iconx', 'soundx',, 'pos=bc dur=5 tag=SaveToClipboard')
    }

    ;============================================================================================

    static gSnd_ddl_CtrlChange(*) => SetTimer( this.Sound.Bind(this, this.gSnd.ddl.Text) , -1)   

    ;============================================================================================ 
    ; DisplayCheck by the-Automator  https://www.the-automator.com/downloads/maestrith-notify-class-v2/
    static MonitorGetInfo()
    {
        static gHwnd := 0

        if WinExist('ahk_id ' gHwnd)
            return

        monCount := MonitorGetCount()
        monPrimary := MonitorGetPrimary()
        gHwnd := this._Show('Monitor Info', 'Monitor Count: ' monCount '`nPrimary Monitor: ' monPrimary '`nClick here to close all Monitor Info GUIs.',,,
        (*) => this.Destroy('MonitorInfo'), 
        'dur=0 pos=ct mali=center tali=center tfo=underline italic tc=00FF46 mc=00FF46 style=edge show=expand@125 tag=MonitorInfo')['hwnd']

        Loop monCount {
            MonitorGet(A_Index, &monLeft, &monTop, &monRight, &monBottom)
            MonitorGetWorkArea(A_Index, &monWALeft, &monWATop, &monWARight, &monWABottom)
            this._Show(
                'Monitor #' A_Index, 
                (
                'Left:`t' monLeft ' (WorkArea: ' monWALeft ')
                Top:`t' monTop ' (WorkArea: ' monWATop ')
                Right:`t' monRight ' (WorkArea: ' monWARight ')
                Bottom:`t' monBottom ' (WorkArea: ' monWABottom ')'
                ),,,, 'dur=0 mon=' A_Index ' pos=ct tali=center tag=MonitorInfo'   
            )                  
        }
    }

    ;============================================================================================

    static ControlGetTextWidth(str:='', font:='', fontSize:='', monWALeft:='', monWATop:='')
    {
        g := Gui()
        g.SetFont('s' fontSize, font)
        g.txt := g.Add('Text',, str)
        g.Show('x' monWALeft ' y' monWATop ' Hide')
        g.txt.GetPos(,, &ctrlWidth)
        g.Destroy()
        return ctrlWidth
    }      

    ;============================================================================================

    static ControlGetPicWidth(picCtrl, monWALeft:='', monWATop:='')
    {
        g := Gui()
        g.pic := picCtrl
        g.Show('x' monWALeft ' y' monWATop ' Hide')
        g.pic.GetPos(,, &ctrlWidth)
        g.Destroy()
        return ctrlWidth
    }   
    
    ;============================================================================================

    static SortArrayGUIPosY(arr, sortReverse := false)
    {
        for _, value in arr
            listValueY .= value['gY'] ','

        listSortValueY := Sort(RTrim(listValueY, ','), (sortReverse ? 'RN' : 'N') ' D,')
        sortArray := Array()

        for index, value in StrSplit(listSortValueY, ',')
            for _, v in arr
                if v['gY'] = value
                    sortArray.Push(v)
            
        return sortArray    
    }    
  
    ;============================================================================================
    ; FrameShadow by Klark92.  https://www.autohotkey.com/boards/viewtopic.php?f=6&t=29117&hilit=FrameShadow
    static FrameShadow(hwnd)
    {
        DllCall("dwmapi.dll\DwmIsCompositionEnabled", "int*", &dwmEnabled:=0)
        
        if !dwmEnabled {
            DllCall("user32.dll\SetClassLongPtr", "ptr", hwnd, "int", -26, "ptr", DllCall("user32.dll\GetClassLongPtr", "ptr", hwnd, "int", -26) | 0x20000)
        }
        else {
            margins := Buffer(16, 0)    
            NumPut("int", 1, "int", 1, "int", 1, "int", 1, margins)
            DllCall("dwmapi.dll\DwmSetWindowAttribute", "ptr", hwnd, "Int", 2, "Int*", 2, "Int", 4)
            DllCall("dwmapi.dll\DwmExtendFrameIntoClientArea", "ptr", hwnd, "ptr", margins)
        }
    }   
    ;============================================================================================              
}

onRecv(sock)
{
	size := sock.RecvFrom(&buf,,,,&addrFrom)
	msgrecive := StrGet(buf, size, Encoding:="UTF-8")
	if (msgrecive = "RequestData")
	{
		global OnAccountSendData
		if OnAccountSendData
		{
			global UserNameAccount
			global TimeAccount
			global sockserver
			global aTimeTimeAccount
	
			IPfrom := DllCall( "Ws2_32.dll\inet_ntoa","UInt",NumGet(addrFrom,4,"UInt"), "AStr" ) 
			Portfrom := DllCall("ws2_32\htons", "UShort", NumGet(addrFrom, 2, "UShort"), "UShort")
			
			msgtosend := UserNameAccount ";" TimeAccount ";" aTimeTimeAccount
			respbuf := Buffer(StrPut(msgtosend, Encoding:="UTF-8") - ((Encoding = 'utf-16' || Encoding = 'cp1200') ? 2 : 1))
			respsize := StrPut(msgtosend, respbuf, Encoding)
			sockserver.SendTo(respbuf, respsize, [IPfrom, Portfrom])
		}
	}
	else
	{
		try
		{
			msgrecivearray := StrSplit(msgrecive, ";")
			global UserNameAccount := msgrecivearray[1]
			global TimeAccount := msgrecivearray[2]
			global aTimeTimeAccount := msgrecivearray[3]
			global StartTime := A_TickCount - ((A_Hour * 3600 + A_Min * 60 + A_Sec) - aTimeTimeAccount)*1000
		}
	}

}


AppVol(Target, Level := 0) {
	ProcessId := ProcessExist(Target)
    GUID := Buffer(16)
    DllCall("ole32\CLSIDFromString", "Str", "{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}", "Ptr", GUID)
    IMMDeviceEnumerator := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")
    ComCall(4, IMMDeviceEnumerator, "UInt", 0, "UInt", 1, "Ptr*", &IMMDevice := 0)
    ObjRelease(IMMDeviceEnumerator.Ptr)
    ComCall(3, IMMDevice, "Ptr", GUID, "UInt", 23, "Ptr", 0, "Ptr*", &IAudioSessionManager2 := 0)
    ObjRelease(IMMDevice)
    ComCall(5, IAudioSessionManager2, "Ptr*", &IAudioSessionEnumerator := 0) || DllCall("SetLastError", "UInt", 0)
    ObjRelease(IAudioSessionManager2)
    ComCall(3, IAudioSessionEnumerator, "UInt*", &cSessions := 0)
    loop cSessions {
        ComCall(4, IAudioSessionEnumerator, "Int", A_Index - 1, "Ptr*", &IAudioSessionControl := 0)
        IAudioSessionControl2 := ComObjQuery(IAudioSessionControl, "{BFB7FF88-7239-4FC9-8FA2-07C950BE9C6D}")
        ObjRelease(IAudioSessionControl)
        ComCall(14, IAudioSessionControl2, "UInt*", &pid := 0)
        if (pid != ProcessId) {
            continue
        }
        ISimpleAudioVolume := ComObjQuery(IAudioSessionControl2, "{87CE5498-68D6-44E5-9215-6DA47EF883D8}")
        ComCall(6, ISimpleAudioVolume, "Int*", &isMuted := 0)
        if (isMuted || !Level) {
            ComCall(5, ISimpleAudioVolume, "Int", !isMuted, "Ptr", 0)
        }
        if (Level) {
            ComCall(4, ISimpleAudioVolume, "Float*", &levelOld := 0)
            if (Level ~= "^[-+]") {
                levelNew := Max(0.0, Min(1.0, levelOld + (Level / 100)))
            } else {
                levelNew := Level / 100
            }
            if (levelNew != levelOld) {
                ComCall(3, ISimpleAudioVolume, "Float", levelNew, "Ptr", 0)
            }
        }
        ObjRelease(ISimpleAudioVolume.Ptr)
    }
    return (IsSet(levelOld) ? Round(levelOld * 100) : -1)
}
