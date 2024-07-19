if ProcessExist("Notificador de Conexión.exe")
	ProcessClose "Notificador de Conexión.exe"

try
	{
	if FileExist(A_ScriptDir "\Descarga.zip")
	{
		DirCopy A_ScriptDir "\Descarga.zip", A_ScriptDir, 1
		FileDelete A_ScriptDir "\Descarga.zip"
		
		Run "Notificador de Conexión.exe"
	}
	Else
	{
		Run "Notificador de Conexión.exe"
		Msgbox("La descarga de la actualización ha fallado intente de nuevo.", "Buscar Actualización", "16")
	}
}
catch
	Msgbox("La descarga de la actualización ha fallado intente de nuevo.", "Buscar Actualización", "16")