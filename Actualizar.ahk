#SingleInstance Ignore
#NoTrayIcon
SetTitleMatchMode 2

; <for compiled scripts>
;@Ahk2Exe-SetFileVersion 1.0.0
;@Ahk2Exe-SetDescription Actualizar
; </for compiled scripts>

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
		FileMove A_WorkingDir "\temp\Actualizar.exe", A_WorkingDir "\Actualizar.exe.new", 1
		FileCopy A_WorkingDir "\temp\*.*", A_WorkingDir, 1
		DirDelete "temp", true
		Run "Notificador de Conexión.exe"
		Msgbox("Notificador de Conexión: Se ha actualizado correctamente.", "Buscar Actualización", "32")
	}
	Else
	{
		Run "Notificador de Conexión.exe"
		Msgbox("La descarga de la actualización ha fallado intente de nuevo.", "Buscar Actualización", "16")
	}
}
catch
	Msgbox("La descarga de la actualización ha fallado intente de nuevo.", "Buscar Actualización", "16")
