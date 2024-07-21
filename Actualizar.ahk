#SingleInstance Ignore
#NoTrayIcon
SetTitleMatchMode 2

; <for compiled scripts>
;@Ahk2Exe-SetFileVersion 1.0.0
;@Ahk2Exe-SetDescription Actualizar
; </for compiled scripts>

if (A_Args.Length != 0)
{
	if ProcessExist("Notificador de Conexión.exe")
		ProcessClose "Notificador de Conexión.exe"
	if ProcessExist("PingHostName.exe")
		ProcessClose "PingHostName.exe"

	try
		{
		if FileExist("Descarga.zip")
		{
			DirCopy "Descarga.zip", A_WorkingDir "\temp", 1
			FileDelete "Descarga.zip"
			
			if FileExist(A_WorkingDir "\temp\Actualizar.exe")
				FileMove A_WorkingDir "\temp\Actualizar.exe", A_WorkingDir "\Actualizar.exe.new", 1
			
			FileCopy A_WorkingDir "\temp\*.*", A_WorkingDir, 1
			DirDelete "temp", true
			Msgbox(A_Args[3], A_Args[2], "T5 32")
			Run "Notificador de Conexión.exe"
		}
		Else
		{
			Msgbox(A_Args[1], A_Args[2], "T5 16")
			Run "Notificador de Conexión.exe"
		}
	}
	catch
	{
		Msgbox(A_Args[1], A_Args[2], "T5 16")
		Run "Notificador de Conexión.exe"
	}
}