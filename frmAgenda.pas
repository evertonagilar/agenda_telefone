unit frmAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Data.DB, System.ImageList, Vcl.ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Datasnap.DBClient, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, uLkJSON, Dialogs, Vcl.Imaging.pngimage, IdAuthentication, JPeg,
  Vcl.Menus, Registry, IdRawBase, IdRawClient, IdIcmpClient;

type
  TFormAgenda = class(TForm)
    cds: TClientDataSet;
    ds: TDataSource;
    StatusBar: TStatusBar;
    IdHTTP: TIdHTTP;
    ImageList1: TImageList;
    cdsReservasEm: TClientDataSet;
    IntegerField1: TIntegerField;
    PageControl1: TPageControl;
    tabAgenda: TTabSheet;
    tabContato: TTabSheet;
    JvHTLabel2: TLabel;
    Label1: TLabel;
    edtNome: TEdit;
    btnNovoContato: TSpeedButton;
    grdItens: TDBGrid;
    lblState: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtMatricula: TDBEdit;
    edtNomeContato: TDBEdit;
    edtTelefone: TDBEdit;
    edtCelular: TDBEdit;
    edtRamal: TDBEdit;
    edtSetor: TDBEdit;
    edtCargo: TDBEdit;
    edtEmail: TDBEdit;
    Image1: TImage;
    btnSalvarContato: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    edtLocal: TDBEdit;
    cdsid: TIntegerField;
    cdsmatricula: TStringField;
    cdsnome: TStringField;
    cdstelefone: TStringField;
    cdscelular: TStringField;
    cdsramal: TStringField;
    cdssetor: TStringField;
    cdscargo: TStringField;
    cdsadmissao: TDateTimeField;
    cdsemail: TStringField;
    cdslocal: TStringField;
    cdsfoto: TGraphicField;
    cdsaniversario: TDateField;
    cdsvisitante: TBooleanField;
    cdscoordenador: TBooleanField;
    cdssetor_local: TStringField;
    ClientDataSet1: TClientDataSet;
    TrayIcon: TTrayIcon;
    PopupMenuTrayIcon: TPopupMenu;
    Finalizar1: TMenuItem;
    ExibirAgenda1: TMenuItem;
    N1: TMenuItem;
    btnExcluirContato: TSpeedButton;
    procedure edtNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdssetor_localGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoContatoClick(Sender: TObject);
    procedure btnSalvarContatoClick(Sender: TObject);
    procedure grdItensDblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cdsramalChange(Sender: TField);
    procedure edtRamalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeContatoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCargoKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edtRamalKeyPress(Sender: TObject; var Key: Char);
    procedure edtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure TrayIconClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Finalizar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirContatoClick(Sender: TObject);
  private
    HostFile: string;
    Host: string;
    HostName: string;
    UrlServico: string;
    AppDir: string;
    DbFile: string;
    Atalho: Word;
    AlertaFalhaComunicacao: Boolean;
    procedure loadDados();
    function RecordToJson(): string;
    procedure SendPostRequest(const Json: string);
    procedure SendPutRequest(const Json: string; id: Integer);
    function GetRequest(const Url: string): string;
    procedure ExcluirContatoRequest();
    procedure ValidaContato();
    procedure importa();
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure CheckAutoIniciarWindows;
  public
    { Public declarations }
  end;

var
  FormAgenda: TFormAgenda;

implementation


{$R *.dfm}


function IsDateValid(const Value: string): Boolean;
begin
  try
      StrToDate(Value);
      Result:= True;
  except
    Result:= False;
  end;
end;

function isInvalidKey(const Key: Char): Boolean;
begin
  Result:= (Key = '"') or (Key = '\,') or (Key = '!') or (Key = '&') or (Key = '?') or (Key = '%') or (Key = '*') or (Key = '¨') or (Key = '#') or (Key = '$');
end;

function FileSize(const fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
     Result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     Result := -1;
  FindClose(sr);
end;

function ReadLine(const AFileName: string): string;
var
  Arq: TStringList;
begin
  Arq:= TStringList.Create;
  try
    Arq.LoadFromFile(AFileName);
    Result:= Arq.Strings[0];
  finally
    Arq.Free;
  end;
end;

procedure StringToFile(const AFileName: string; const S: string; AAppend: Boolean = False);
var
  Arq: TextFile;
begin
  AssignFile(Arq, AFileName);
  try
    if FileExists(AFileName) then
    begin
      if AAppend then
        Append(Arq)
      else
        Reset(Arq);
    end
    else
      Rewrite(Arq);
    Writeln(Arq, S);
  finally
    CloseFile(Arq);
  end;
end;

procedure TFormAgenda.loadDados();
var
  js: TlkJSONobject;
  json: TlkJSONlist;
  Url: string;
  Str : string;
  offset: Integer;
  i, j: Integer;
  EmptyCdsBeforeLoad: Boolean;
begin
  Screen.Cursor:= crHourGlass;
  cds.DisableControls;
  try
    EmptyCdsBeforeLoad:= True;
      // Já está preparado para carregar muitos dados com várias requisições pequenas
      for i:= 0 to 100 do
      begin
        offset:= i * 1000;

        // Monta a requisição e envia ao barramento
        Url:= UrlServico + '?offset='+ IntToStr(offset)+'&limit=1000';
        Str := GetRequest(Url);
        if (Str <> '') and (Str <> '[]') then
        begin
          if EmptyCdsBeforeLoad then
          begin
            cds.EmptyDataSet;
            EmptyCdsBeforeLoad:= False;
          end;

          // parser do json
          json := TlkJSON.ParseText(Str) as TlkJSONlist;
          if json = nil then
            Continue; // algum caracter estranho estragou

          for j:= 0 to json.Count-1 do
          begin
            js := json.Child[j] as TlkJSONobject;
            cds.Append;
            try
              cdsid.AsInteger := js.Field['id'].Value;
              cdsmatricula.AsString := VarToStr(js.Field['matricula'].Value);
              cdsnome.AsString := VarToStr(js.Field['nome'].Value);
              cdstelefone.AsString := VarToStr(js.Field['telefone'].Value);
              cdscelular.AsString := VarToStr(js.Field['celular'].Value);
              cdsemail.AsString := VarToStr(js.Field['email'].Value);
              cdssetor.AsString := VarToStr(js.Field['setor'].Value);
              cdslocal.AsString := VarToStr(js.Field['local'].Value);
              cdscargo.AsString := VarToStr(js.Field['cargo'].Value);
              cdsramal.AsString := VarToStr(js.Field['ramal'].Value);
              cdsadmissao.AsDateTime:= StrToDate(VarToStr(js.Field['admissao'].Value));
              cdsvisitante.AsBoolean := js.Field['visitante'].Value;
              cdscoordenador.AsBoolean:= False;
              cds.Post;
            except
              // Algum dado pode ter causado a exception
              cds.Cancel;
            end;
          end;

          // chegou ao fim ou tem mais contatos
          if ((json.Count = 0) or (json.Count < 999)) then
            Break;
        end
        else
          Break;
      end;

    // Salva a agenda para trabalhar offline
    try
      if not cds.IsEmpty then
      begin
        DeleteFile(DbFile);
        cds.SaveToFile(DbFile);
        SetFileAttributes(PWideChar(DbFile), 2);
      end;
    except
      // Não tem permissão para gravar no disco
    end;
  finally
    cds.EnableControls;
    Screen.Cursor:= crDefault;
  end;
end;

procedure TFormAgenda.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tabAgenda then
  begin
    if ds.State in [dsEdit, dsInsert] then
      cds.Cancel;
    ActiveControl:= edtNome;
  end
  else
  begin
    ActiveControl:= edtMatricula;
    if ds.State = dsInsert then
      lblState.Caption:= 'Novo Contato'
    else
      lblState.Caption:= 'Dados do Contato';
  end;
end;

procedure TFormAgenda.edtCargoKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.edtLocalKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.edtMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key:= #0;
end;

procedure TFormAgenda.edtNomeChange(Sender: TObject);
var
  NomePesquisa: string;
  Value: string;
begin
  NomePesquisa:= Trim(edtNome.Text);
  if NomePesquisa <> '' then
  begin
    cds.DisableControls;
    cds.Filtered:= False;
    cds.FilterOptions:= [foCaseInsensitive];
    Value:= QuotedStr('%' + edtNome.Text + '%');
    cds.Filter := 'nome like ' + Value + ' or matricula like '+ Value + ' or ramal like '+ Value + ' or setor like '+ Value + ' or local like '+ Value + ' or telefone like '+ Value + ' or celular like '+ Value + ' or email like '+ Value;
    cds.Filtered:= True;
    cds.EnableControls;
  end
  else
  begin
    cds.Filtered:= False;
  end;
end;

procedure TFormAgenda.edtNomeContatoKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.Finalizar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormAgenda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Minimize;
  Hide;
  ShowWindow(Application.Handle, SW_HIDE);
  CanClose:= False;
end;

procedure TFormAgenda.FormCreate(Sender: TObject);
begin
  AppDir:= ExtractFilePath(Application.ExeName);
  HostFile:= AppDir + 'host';
  if FileExists(HostFile) then
      Host:= ReadLine(HostFile)
  else
      Host:= '';

  // Se o host não foi informado, pergunta para o usuário
  if Trim(Host) = '' then
  begin
     Host:= 'http://servicosssi.unb.br:2301';
     UrlServico:= Host + '/administrativo/cpd/contato';
     if not InputQuery('Olá muito prazer', 'Informe a URL do Web Service da agenda de telefone do CPD:', UrlServico) then
     begin
        ShowMessage('A agenda de telefone será finalizada!');
        Application.Terminate;
        Exit;
     end;
  end
  else
    UrlServico:= Host + '/administrativo/cpd/contato';
  HostName:= Copy(Copy(Host, Pos('//', Host)+2), 1, Pos(':', Copy(Host, 8))-1);

    //importa();
    //exit;


  DbFile:= AppDir + 'agenda.dat';
  SetFileAttributes(PWideChar(HostFile), 2);
  StringToFile(HostFile, Host, False);
  StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico;

// Register Hotkey Win + A
  Atalho := GlobalAddAtom('Hotkey1');
  RegisterHotKey(Handle, Atalho, MOD_WIN, VK_F10);

  if (ParamStr(1) = '-silent') then
  begin
    AlertaFalhaComunicacao:= False;
    Application.ShowMainForm := False;
    Hide;
    ShowWindow(Application.Handle, SW_HIDE);
  end
  else
    AlertaFalhaComunicacao:= True;

end;

procedure TFormAgenda.FormDestroy(Sender: TObject);
begin
  UnRegisterHotKey(Handle, Atalho);
  GlobalDeleteAtom(Atalho);
end;

procedure TFormAgenda.FormShow(Sender: TObject);
begin
  cds.DisableControls;
  try
    Left:=(Screen.Width-Width)  div 2;
    Top:=(Screen.Height-Height) div 2;
    PageControl1.ActivePage:= tabAgenda;
    ActiveControl:= edtNome;
    cds.Filtered:= False;
    edtNome.Clear;
    cds.First;
    loadDados;
    CheckAutoIniciarWindows;
    cds.First;
  finally
    cds.EnableControls;
  end;
end;

procedure TFormAgenda.grdItensDblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= tabContato;
end;

procedure TFormAgenda.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  dat: TDataSet;
begin
  if not (csDesigning in ComponentState) then
  begin
    dat:= cds;
    if dat <> nil then
    begin
      if not (gdSelected in State) then // se a célula não está selecionada
      begin
        if not odd(dat.RecNo) then // se for ímpar
        begin
           grdItens.Canvas.Brush.Color:=$00FFEFDF; // define uma cor de fundo
        end;
      end;
    end;
    grdItens.Canvas.FillRect(Rect); // pinta a célula
    grdItens.DefaultDrawColumnCell(Rect,DataCol, Column,State); // pinta o texto padrão
    inherited;
  end;
end;

procedure TFormAgenda.grdItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    PageControl1.ActivePage:= tabContato
  else if Key = VK_DELETE then
    btnExcluirContato.Click;
end;

procedure TFormAgenda.cdsramalChange(Sender: TField);
var
  ramal: string;
begin
  ramal:= cdsramal.AsString;
  if Length(ramal) = 1 then
    ramal:= '7000'+ ramal
  else if Length(ramal) = 2 then
    ramal:= '700'+ ramal
  else if Length(ramal) = 3 then
    ramal:= '70'+ ramal
  else if Length(ramal) = 4 then
    ramal:= '7'+ ramal;
  if cdsramal.AsString <> ramal then
  begin
    cdsramal.OnChange:= nil;
    cdsramal.AsString:= ramal;
    cdsramal.OnChange:= cdsramalChange;
  end;
end;

procedure TFormAgenda.cdssetor_localGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cdssetor.AsString = cdslocal.AsString then
    Text:= cdssetor.AsString
  else
    Text:= cdssetor.AsString + ' - ' + cdslocal.AsString;
end;

procedure TFormAgenda.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =  VK_DOWN then
    grdItens.SetFocus
  else if Key < 31 then
    Key:= 0;
end;

procedure TFormAgenda.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.edtRamalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [0..9] then
    Key:= 0;
end;

procedure TFormAgenda.edtRamalKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.edtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  if isInvalidKey(Key) then
    Key:= #0;
end;

procedure TFormAgenda.btnExcluirContatoClick(Sender: TObject);
begin
  if cdsid.IsNull then
  begin
    ShowMessage('Esta operação não pode ser executada agora.');
    Exit;
  end;
  if Application.MessageBox(PWideChar('Você tem certeza que deseja excluir o contato '+ QuotedStr(cdsnome.AsString) + ' ?'), PChar(Application.Title), MB_OKCANCEL) = mrOk then
  begin
    Screen.Cursor:= crHourGlass;
    try
      ExcluirContatoRequest;
      cds.Delete;
      PageControl1.ActivePage:= tabAgenda;
      ShowMessage('Contato excluído com sucesso!');
    finally
      Screen.Cursor:= crDefault;
    end;
  end;
end;

procedure TFormAgenda.btnNovoContatoClick(Sender: TObject);
begin
  tabContato.Show;
  if ds.State in [dsEdit, dsInsert] then
    cds.Cancel;
  cds.Append;
  cdsadmissao.AsDateTime:= Date;
  cdsvisitante.AsBoolean:= False;
  cdscoordenador.AsBoolean:= False;
  cdslocal.AsString:= 'CPD';
  lblState.Caption:= 'Novo Contato';
  ActiveControl:= edtMatricula;
end;

procedure TFormAgenda.btnSairClick(Sender: TObject);
begin
   if Application.MessageBox('Você tem certeza que deseja sair?', PChar(Application.Title), MB_OKCANCEL) = mrOk then
    Application.Terminate;
end;

procedure TFormAgenda.btnSalvarContatoClick(Sender: TObject);
var
  JsonRecord: string;
begin
  Screen.Cursor:= crHourGlass;
  try
    SelectNext(ActiveControl, True, True);
    ValidaContato;
    JsonRecord:= RecordToJson();
    if ds.State in [dsEdit, dsInsert] then
      cds.Post;
    if (JsonRecord <> '') and (JsonRecord <> '{}') then
    begin
      if cdsid.IsNull then
        SendPostRequest(JsonRecord)
      else
        SendPutRequest(JsonRecord, cdsid.AsInteger);
      ShowMessage('Contato salvo com sucesso!');
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

function TFormAgenda.RecordToJson(): string;
var
  Field: TField;
  FieldCount: Integer;
  i: Integer;
begin
  Result:= '{';
  FieldCount:= cds.FieldCount;
  for i:= 0 to FieldCount-1 do
  begin
    Field:= cds.Fields[i];
    if Field.IsBlob or Field.IsNull or (Field = cdsid) then
      Continue;
    if Result <> '{' then
      Result:= Result + ', ';
    Result:= Result + '"' + Field.FieldName + '" : "' + Field.AsString + '"';
  end;
  Result:= Result + '}';
end;

procedure TFormAgenda.ExcluirContatoRequest();
var
  UrlDelete: string;
begin
  UrlDelete:= UrlServico + '/' + cdsid.AsString;
  try
    IdHTTP.Delete(UrlDelete, nil);
  except
      on E: Exception do
      begin
        raise Exception.Create('Não foi possível excluir o contato. '#13#10#13#10 + 'Motivo: '+ E.Message);
      end;
  end;
end;

procedure TFormAgenda.SendPostRequest(const Json: string);
var
  Dados: TStringStream;
  Response: string;
  obj: TlkJSONobject;
begin
  Dados:= TStringStream.Create(UTF8Encode(Json));
  try
    IdHTTP.Request.Method:= 'POST';
    try
      Response:= IdHTTP.Post(UrlServico, Dados);
      obj := TlkJSON.ParseText(Response) as TlkJSONobject;
      cds.Edit;
      cdsid.AsInteger := obj.Field['id'].Value;
      cds.Post;
    except
      on E: EIdHTTPProtocolException do
      begin
        obj := TlkJSON.ParseText(E.ErrorMessage) as TlkJSONobject;
        raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ obj.Field['message'].Value);
      end;
      on E: Exception do
      begin
        raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ E.Message);
      end;
    end;
  finally
    Dados.Free;
  end;
end;


procedure TFormAgenda.SendPutRequest(const Json: string; id: Integer);
var
  Url: string;
  Dados: TStringStream;
  Response: string;
  obj: TlkJSONobject;
begin
  Dados:= TStringStream.Create(UTF8Encode(Json));
  try
    Url:= UrlServico + '/' + cdsid.AsString;
    IdHTTP.Request.Method:= 'PUT';
    try
      Response:= IdHTTP.Put(Url, Dados);
    except
      on E: EIdHTTPProtocolException do
      begin
        obj := TlkJSON.ParseText(E.ErrorMessage) as TlkJSONobject;
        raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ obj.Field['message'].Value);
      end;
      on E: Exception do
      begin
        raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ E.Message);
      end;
    end;
  finally
    Dados.Free;
  end;
end;

procedure TFormAgenda.TrayIconClick(Sender: TObject);
begin
  Screen.Cursor:= crHourGlass;
  AlertaFalhaComunicacao:= False;
  try
    ShowWindow(Application.Handle, SW_SHOW);
    Application.Restore;
    Application.ProcessMessages;
    Show;
    Application.ProcessMessages;
    Application.ProcessMessages;
    BringToFront;
  finally
    AlertaFalhaComunicacao:= True;
    Screen.Cursor:= crDefault;
  end;
end;

function TFormAgenda.GetRequest(const Url: string): string;
var
  DbSize: Integer;
begin
    try
        Result:= IdHTTP.get(Url)
    except
      DbSize:= FileSize(DbFile);
      // Se o arquivo de cache dos dados já existe, apenas o carrega-o
      if cds.IsEmpty and (DbSize > 310) then
      begin
        Result:= '';
        cds.LoadFromFile(DbFile);
        if AlertaFalhaComunicacao then
        begin
          if cds.IsEmpty then
              ShowMessage('Não foi possível conectar no barramento de serviços.'#13#10#13#10'Verifique a conectividade!')
           else
              ShowMessage('Não foi possível conectar no barramento de serviços.'#13#10#13#10'Disponibilizando os dados da última consulta!');
        end;
      end
      else
      begin
        Result:= '';
        if AlertaFalhaComunicacao then
          ShowMessage('Não foi possível conectar no barramento de serviços'#13#10#13#10'Verifique a conectividade!');
      end;
    end;
end;

procedure TFormAgenda.ValidaContato();
begin
  if (cdsmatricula.IsNull or (Trim(cdsmatricula.AsString) = '')) then
  begin
    edtMatricula.SetFocus;
    raise Exception.Create('A matrícula do contato é obrigatório!');
  end;
  if (cdsnome.IsNull or (Trim(cdsnome.AsString) = '')) then
  begin
    edtNomeContato.SetFocus;
    raise Exception.Create('O nome do contato é obrigatório!');
  end;
  if (cdstelefone.IsNull or (Trim(cdstelefone.AsString) = '')) then
  begin
    edtTelefone.SetFocus;
    raise Exception.Create('O telefone do contato é obrigatório!');
  end;
  if (cdscelular.IsNull or (Trim(cdscelular.AsString) = '')) then
  begin
    edtCelular.SetFocus;
    raise Exception.Create('O celular do contato é obrigatório!');
  end;
  if (cdsramal.IsNull or (Trim(cdsramal.AsString) = '')) then
  begin
    edtRamal.SetFocus;
    raise Exception.Create('O ramal do contato é obrigatório!');
  end;
  if (cdssetor.IsNull or (Trim(cdssetor.AsString) = '')) then
  begin
    cdssetor.AsString:= 'CPD';
  end;
  if (cdslocal.IsNull or (Trim(cdslocal.AsString) = '')) then
  begin
    cdslocal.AsString:= 'CPD';
  end;
  if (cdscargo.IsNull or (Trim(cdscargo.AsString) = '')) then
  begin
    cdscargo.AsString:= 'Não informado';
  end;
  if (cdsemail.IsNull or (Trim(cdsemail.AsString) = '')) then
  begin
    edtEmail.SetFocus;
    raise Exception.Create('O e-mail do contato é obrigatório!');
  end;
end;

procedure TFormAgenda.importa();
var
  JsonRecord: string;
begin
    ClientDataSet1.LoadFromFile('agenda.dat_');
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      cds.Append;
      //cdsid.AsInteger:= ClientDataSet1.FieldByName('id').AsInteger;
      cdsmatricula.AsString:= ClientDataSet1.FieldByName('matricula').AsString;
      cdsnome.AsString:= ClientDataSet1.FieldByName('nome').AsString;
      cdstelefone.AsString:= ClientDataSet1.FieldByName('telefone1').AsString;
      if Length(cdstelefone.AsString) = 10 then
        cdstelefone.AsString:= '(061) ' + cdstelefone.AsString
      else if Length(cdstelefone.AsString) = 9 then
        cdstelefone.AsString:= '(061) ' + Copy(cdstelefone.AsString, 1, 5) + '-' + Copy(cdstelefone.AsString, 5);
      if cdstelefone.IsNull or (cdstelefone.AsString = '') then
        cdstelefone.AsString:= '(00) 00000-0000';
      cdscelular.AsString:= '(00) 00000-0000';
      cdsramal.AsString:= ClientDataSet1.FieldByName('ramal').AsString;
      if cdsramal.IsNull or (cdsramal.AsString = '') then
        cdsramal.AsString:= '70000';
      cdssetor.AsString:= ClientDataSet1.FieldByName('setor').AsString;
      cdscargo.AsString:= ClientDataSet1.FieldByName('cargo').AsString;
      cdsemail.AsString:= ClientDataSet1.FieldByName('email').AsString;
      if cdsemail.IsNull or (cdsemail.AsString = '') then
        cdsemail.AsString:= 'Não informado';
      cdslocal.AsString:= ClientDataSet1.FieldByName('local').AsString;
      cdsvisitante.AsBoolean:= False;
      cdscoordenador.AsBoolean:= False;
      cdsadmissao.AsDateTime:= Date;
      JsonRecord:= RecordToJson();
      cds.Post;
      try
        SendPostRequest(JsonRecord);
      except
        // não reportar erro ao falhar a importação
      end;
      ClientDataSet1.Next;
    end;
end;

procedure TFormAgenda.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = Atalho then
    TrayIconClick(Self);
end;

procedure TFormAgenda.CheckAutoIniciarWindows();
var
  Reg: TRegistry;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run\',false);
      Reg.WriteString('AgendaTelefoneCPD', ParamStr(0) + ' -silent');
      Reg.CloseKey;
    finally
      Reg.Free;
    end;
  except
    // Não retornar nenhum erro
  end;
end;


end.

