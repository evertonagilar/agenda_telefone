unit frmAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Data.DB, System.ImageList, Vcl.ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Datasnap.DBClient, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, uLkJSON, Dialogs, Vcl.Imaging.pngimage, IdAuthentication, JPeg;

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
    Label15: TLabel;
    Label16: TLabel;
    edtMatricula: TDBEdit;
    edtNomeContato: TDBEdit;
    edtTelefone: TDBEdit;
    edtCelular: TDBEdit;
    edtRamal: TDBEdit;
    edtSetor: TDBEdit;
    edtCargo: TDBEdit;
    edtAdmissao: TDBEdit;
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
    GroupBox1: TGroupBox;
    imgFoto: TImage;
    btnCaptura: TButton;
    ClientDataSet1: TClientDataSet;
    TrayIcon: TTrayIcon;
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
    procedure btnCapturaClick(Sender: TObject);
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
  private
    HostFile: string;
    Host: string;
    UrlServico: string;
    AppDir: string;
    DbFile: string;
    AlertaFalhaComunicacao: Boolean;
    procedure loadDados();
    function RecordToJson(): string;
    procedure SendPostRequest(const Json: string);
    procedure SendPutRequest(const Json: string; id: Integer);
    function GetRequest(const Url: string): string;
    procedure ValidaContato();
    procedure importa();
    public
    { Public declarations }
  end;

var
  FormAgenda: TFormAgenda;

implementation

uses CapturaCam;

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
        cds.SaveToFile(DbFile);
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

procedure TFormAgenda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Minimize;
  Hide;
  CanClose:= False;
end;

procedure TFormAgenda.FormCreate(Sender: TObject);
begin
  // Arquivo com o host
  HostFile:= AppDir + 'host';
  if FileExists(HostFile) then
     Host:= ReadLine(HostFile);

  // Se o host não foi informado, pergunta para o usuário
  if Trim(Host) = '' then
  begin
     Host:= 'http://servicosssi.unb.br:2301';
     UrlServico:= Host + '/administrativo/informacoes';
     if not InputQuery('Olá muito prazer', 'Informe a URL do Web Service da agenda de telefone do CPD:', UrlServico) then
     begin
        ShowMessage('A agenda de telefone será finalizada!');
        Application.Terminate;
        Exit;
     end;
  end
  else
    UrlServico:= Host + '/administrativo/informacoes';

    //importa();
    //exit;


  DbFile:= AppDir + 'agenda.dat';
  SetFileAttributes(PWideChar(HostFile), 2);
  SetFileAttributes(PWideChar(DbFile), 2);
  StringToFile(HostFile, Host, False);
  StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico;
  AlertaFalhaComunicacao:= True;
end;

procedure TFormAgenda.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
  PageControl1.ActivePage:= tabAgenda;
  ActiveControl:= edtNome;
  loadDados();
  cds.First;
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

procedure TFormAgenda.btnCapturaClick(Sender: TObject);
var
  DirNomeFoto: string;
  NomeFoto: string;
  procedure ConverteParaJpeg(ACaminhoFoto: string);
  var
    cjBmp: TBitmap;
    cjJpg: TJpegImage;
    strNomeSemExtensao: string;
    AFoto: TImage;
  begin
    AFoto:= TImage.Create(Self);
    AFoto.Parent := Self;
    AFoto.Visible := False;
    AFoto.Picture.Bitmap.LoadFromFile(ACaminhoFoto + '.bmp');

    cjJpg := TJPegImage.Create;
    cjBmp := TBitmap.Create;

    cjBmp.Assign(AFoto.Picture.Bitmap);
    cjJpg.Assign(cjBMP);

    cjJpg.SaveToFile(ACaminhoFoto + '.jpg');
    DeleteFile(ACaminhoFoto + '.bmp');
    cjJpg.Free;
    cjBmp.Free;
    AFoto.Free;
  end;
begin
  fCaptura := TfCaptura.Create(Self);
  try
    with fCaptura, camCamera do
    begin
      DirNomeFoto := ExtractFilePath(Application.ExeName) + cdsmatricula.AsString + '.bmp';
      NomeFoto := ExtractFilePath(DirNomeFoto) +
        Copy(ExtractFileName(DirNomeFoto),1, Length(ExtractFileName(DirNomeFoto))-4);
      FichierImage := ExtractFileName(DirNomeFoto);
      if fCaptura.ShowModal = mrOk then
      begin
        CaptureImageDisque;
        ConverteParaJpeg(NomeFoto);
        //cdsfoto('FOTO').AsString := NomeFoto + '.jpg';
      end;
    end;
  finally
    FreeAndNil(fCaptura);
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

procedure TFormAgenda.SendPostRequest(const Json: string);
var
  Dados: TStringStream;
  Response: string;
  obj: TlkJSONobject;
begin
  Dados:= TStringStream.Create(UTF8Encode(Json));
  IdHTTP.Request.Method:= 'POST';
  try
    Response:= IdHTTP.Post(UrlServico, Dados);
    obj := TlkJSON.ParseText(Response) as TlkJSONobject;
    cds.Edit;
    cdsid.AsInteger := obj.Field['id'].Value;
    cds.Post;
    PageControl1.ActivePage:= tabAgenda;
    grditens.SetFocus;
  except
    on E: EIdHTTPProtocolException do
    begin
      obj := TlkJSON.ParseText(E.ErrorMessage) as TlkJSONobject;
      raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ obj.Field['message'].Value);
    end;
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
  Url:= UrlServico + '/' + cdsid.AsString;
  IdHTTP.Request.Method:= 'PUT';
  try
    Response:= IdHTTP.Put(Url, Dados);
    PageControl1.ActivePage:= tabAgenda;
    grditens.SetFocus;
  except
    on E: EIdHTTPProtocolException do
    begin
      obj := TlkJSON.ParseText(E.ErrorMessage) as TlkJSONobject;
      raise Exception.Create('Não foi possível salvar os dados do contato. '#13#10#13#10 + 'Motivo: '+ obj.Field['message'].Value);
    end;
  end;
end;

procedure TFormAgenda.TrayIconClick(Sender: TObject);
begin
  AlertaFalhaComunicacao:= False;
  try
    Application.Restore;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;
    Show;
    BringToFront;
  finally
    AlertaFalhaComunicacao:= True;
  end;
end;

function TFormAgenda.GetRequest(const Url: string): string;
var
  DbSize: Integer;
begin
    try
      Result:= IdHTTP.get(Url);
    except
      DbSize:= FileSize(DbFile);
      // Se o arquivo de cache dos dados já existe, apenas o carrega-o
      if cds.IsEmpty and (DbSize > 310) then
      begin
        Result:= '';
        cds.LoadFromFile(DbFile);
        if AlertaFalhaComunicacao then
          ShowMessage('Não foi possível conectar no barramento de serviços, disponibilizando os dados da última consulta!');
      end
      else
      begin
        Result:= '';
        if AlertaFalhaComunicacao then
          ShowMessage('Não foi possível conectar no barramento de serviços. Verifique a conectividade!');
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
  if (cdslocal.IsNull or (Trim(cdslocal.AsString) = '')) then
  begin
    edtLocal.SetFocus;
    raise Exception.Create('O local do contato é obrigatório!');
  end;
  if (cdsemail.IsNull or (Trim(cdsemail.AsString) = '')) then
  begin
    edtEmail.SetFocus;
    raise Exception.Create('O e-mail do contato é obrigatório!');
  end;
  if (cdsadmissao.IsNull or not IsDateValid(cdsadmissao.AsString)) then
  begin
    edtAdmissao.SetFocus;
    raise Exception.Create('A data de admissão do contato é obrigatório!');
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
      cdsid.AsInteger:= ClientDataSet1.FieldByName('id').AsInteger;
      cdsmatricula.AsString:= ClientDataSet1.FieldByName('matricula').AsString;
      cdsnome.AsString:= ClientDataSet1.FieldByName('nome').AsString;
      cdstelefone.AsString:= ClientDataSet1.FieldByName('telefone1').AsString;
      if Length(cdstelefone.AsString) = 10 then
        cdstelefone.AsString:= '(061) ' + cdstelefone.AsString
      else if Length(cdstelefone.AsString) = 9 then
        cdstelefone.AsString:= '(061) ' + Copy(cdstelefone.AsString, 1, 5) + '-' + Copy(cdstelefone.AsString, 5);
      cdscelular.AsString:= cdstelefone.AsString;
      cdsramal.AsString:= ClientDataSet1.FieldByName('ramal').AsString;
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

      end;
      ClientDataSet1.Next;
    end;
end;


end.

