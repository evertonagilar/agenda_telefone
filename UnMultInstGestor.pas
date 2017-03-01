
//********************************************************
// MultInst.pas
// Unidade que controla a execu��o de m�ltiplas inst�ncias
// da aplica��o.
// Criado: 24/10/03
// Autor: Everton Agilar
//********************************************************

unit UnMultInstGestor;

interface

function AppExecutando: Boolean;

implementation

uses Forms, Windows, SysUtils;

const
  MI_QUERYWINDOWHANDLE   = 1;
  MI_RESPONDWINDOWHANDLE = 2;

  MI_ERROR_NONE          = 0;
  MI_ERROR_FAILSUBCLASS  = 1;
  MI_ERROR_CREATINGMUTEX = 2;


var
  MessageId: Integer;
  WProc: TFNWndProc = nil;
  MutHandle: THandle = 0;
  MIError: Integer;
  UniqueAppStr: string = 'AgendaTelefoneCPD';

function GetMIError: Integer;
begin
  Result := MIError;
end;

function NewWndProc(Handle: HWND; Msg: Integer; wParam, lParam: Longint):
  Longint; stdcall;
begin
  Result := 0;
  // If this is the registered message...
  if Msg = MessageID then
  begin
    case wParam of
      MI_QUERYWINDOWHANDLE:
        // A new instance is asking for main window handle in order
        // to focus the main window, so normalize app and send back
        // message with main window handle.
        begin
          if IsIconic(Application.Handle) then
          begin
            Application.MainForm.WindowState:= wsNormal;
          end;
          PostMessage(HWND(lParam), MessageID, MI_RESPONDWINDOWHANDLE,
            Application.MainForm.Handle);
          Application.BringToFront;
          Application.Restore;
          Application.MainForm.Show;
          Application.MainForm.BringToFront;
        end;
      MI_RESPONDWINDOWHANDLE:
        // The running instance has returned its main window handle,
        // so we need to focus it and go away.
        begin
          SetForegroundWindow(HWND(lParam));
          Application.Terminate;
        end;
    end;
  end
  // Otherwise, pass message on to old window proc
  else
    Result := CallWindowProc(WProc, Handle, Msg, wParam, lParam);
end;

procedure SubClassApplication;
begin
  // We subclass Application window procedure so that
  // Application.OnMessage remains available for user.
  WProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
    Longint(@NewWndProc)));
  // Set appropriate error flag if error condition occurred
  if WProc = nil then
    MIError := MIError or MI_ERROR_FAILSUBCLASS;
end;

procedure DoFirstInstance;
// This is called only for the first instance of the application
begin
  // Create the mutex with the (hopefully) unique string
  MutHandle := CreateMutex(nil, False, PWideChar(UniqueAppStr));
  if MutHandle = 0 then
    MIError := MIError or MI_ERROR_CREATINGMUTEX;
end;

procedure BroadcastFocusMessage;
// This is called when there is already an instance running.
var
  BSMRecipients: DWORD;
begin
  // Prevent main form from flashing
  Application.ShowMainForm := False;
  // Post message to try to establish a dialogue with previous instance
  BSMRecipients := BSM_APPLICATIONS;
  BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE,
    @BSMRecipients, MessageID, MI_QUERYWINDOWHANDLE,
    Application.Handle);
end;

function InitInstance: Boolean;
begin
  SubClassApplication;   // hook application message loop
  MutHandle := OpenMutex(MUTEX_ALL_ACCESS, False, PWideChar(UniqueAppStr));
  if MutHandle = 0 then
  begin
    // Mutex object has not yet been created, meaning that no previous
    // instance has been created.
    DoFirstInstance;
    Result:= False;
  end
  else
  begin
    BroadcastFocusMessage;
    Result:= True;
  end;
end;

function AppExecutando: Boolean;
begin
  Result:= InitInstance;
end;

initialization
    MessageID := RegisterWindowMessage(PWideChar(UniqueAppStr));

finalization
  // Restore old application window procedure
  if WProc <> Nil then
    SetWindowLong(Application.Handle, GWL_WNDPROC, LongInt(WProc));
  if MutHandle <> 0 then CloseHandle(MutHandle);  // Free mutex

end.


