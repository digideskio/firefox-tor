Set oShell = CreateObject ("Wscript.Shell") 
createobject("wscript.shell").run "tor -f torrc",0

strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(objFile) 

Dim NRun
NRun = True
For Each ps In Getobject("winmgmts:\\.\root\cimv2:win32_process").instances_
If UCase(ps.name) = UCase("Lantern.exe") Then ps.terminate : NRun = False
Next

Dim strArgs
quo = """"
strArgs = quo & strFolder & "\Firefox.exe" & quo
oShell.Run strArgs, 0, false
strArgs = quo & strFolder & "\Lantern.exe" & quo
oShell.Run strArgs, 0, false
