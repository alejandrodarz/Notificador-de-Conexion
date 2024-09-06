#NoTrayIcon
#SingleInstance Ignore
Persistent

SetTitleMatchMode 2
; <for compiled scripts>
;@Ahk2Exe-SetFileVersion 1.00
;@Ahk2Exe-SetDescription PingHostName.exe
; </for compiled scripts>

OnMessage 0x004A, Receive_WM_COPYDATA  ; 0x004A is WM_COPYDATA

Receive_WM_COPYDATA(wParam, lParam, msg, hwnd)
{
	 
	StringAddress := NumGet(lParam, 2*A_PtrSize, "Ptr")  ; Retrieves the CopyDataStruct's lpData member.
    CopyOfData := StrGet(StringAddress)  ; Copy the string out of the structure.
    ; Show it with ToolTip vs. MsgBox so we can return in a timely fashion:
	ArrayValueEnv := StrSplit(CopyOfData, " ")
	
	IpResolve := "Failed"
	IpResolve := ResolveHostname(ArrayValueEnv[1])
	
	if(IpResolve = "Failed")
	{
		Ping := 0
		return Ping
	}
	
	Loop(ArrayValueEnv[3])
	{
		If DllCall("LoadLibrary","Str","ws2_32","UPtr") = 0 ;NULL
		{
			Ping := 0
			Continue
		}
		If DllCall("LoadLibrary","Str","icmp","UPtr") = 0 ;NULL
		{
			Ping := 0
			Continue
		}
		NumericAddress := DllCall("ws2_32\inet_addr","AStr",IpResolve,"UInt")
		If NumericAddress = 0xFFFFFFFF ;INADDR_NONE
		{
			Ping := 0
			Continue
		}

		hPort := DllCall("icmp\IcmpCreateFile","UPtr") ;open port
		If hPort = -1 ;INVALID_HANDLE_VALUE
		{
			Ping := 0
			Continue
		}

		StructLength := 270 + (A_PtrSize * 2) ;ICMP_ECHO_REPLY structure
		Reply := Buffer(StructLength)
		ReplyPtr := Reply.Ptr

		Count := DllCall("icmp\IcmpSendEcho"
			,"UPtr",hPort ;ICMP handle
			,"UInt",NumericAddress ;IP address
			,"Str","" ;request data
			,"UShort",0 ;length of request data
			,"UPtr",0 ;pointer to IP options structure
			,"UPtr",ReplyPtr ;reply buffer
			,"UInt",StructLength ;length of reply buffer
			,"UInt",(ArrayValueEnv[2]*1000)) ;ping timeout

		If !DllCall("icmp\IcmpCloseHandle","UInt",hPort) ;close port
		{
			Ping := 0
			Continue
		}

		Status := NumGet(Reply,4,"UInt")

		If (Status = 11002 or Status = 11003 or Status = 11004 or Status = 11005 or Status = 11010) ;IP_DEST_NET_UNREACHABLE, IP_DEST_HOST_UNREACHABLE, IP_DEST_PROT_UNREACHABLE, IP_DEST_PORT_UNREACHABLE, IP_REQ_TIMED_OUT
		{
			Ping := 0
			Continue
		}
		If Status != 0 ;IP_SUCCESS
		{
			Ping := 0
			Continue
		}
		
		Ping := 1
		break
	}
    return Ping  ; Returning 1 (true) is the traditional way to acknowledge this message.
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
