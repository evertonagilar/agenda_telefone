unit frmAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBClient, Buttons, jpeg, ExtCtrls, JvExStdCtrls, JvExExtCtrls,
  JvExtComponent, uLkJSON, ComCtrls, JvExComCtrls, pngimage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdHTTP,
  IdTCPClient, JvHtControls, JvAnimatedImage, JvGIFCtrl, JvExControls, DB,
  StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, Dialogs;

type
  TFormAgenda = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    cds: TClientDataSet;
    grdItens: TJvDBGrid;
    Label1: TLabel;
    edtNome: TEdit;
    cdsnome: TStringField;
    cdstelefone1: TStringField;
    cdsramal: TStringField;
    DataSource1: TDataSource;
    PainalLadoEsquerdo: TJvGIFAnimator;
    JvHTLabel1: TJvHTLabel;
    JvHTLabel2: TJvHTLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image2: TImage;
    StatusBar: TStatusBar;
    cdstelefone2: TStringField;
    cdssetor: TStringField;
    cdscargo: TStringField;
    cdsmatricula: TIntegerField;
    cdsid: TIntegerField;
    cdsadmissao: TDateTimeField;
    cdsemail: TStringField;
    cdslocal: TStringField;
    cdssetor_local: TStringField;
    JvGIFAnimator1: TJvGIFAnimator;
    JvGIFAnimator2: TJvGIFAnimator;
    JvHTLabel3: TJvHTLabel;
    IdHTTP: TIdHTTP;
    lblUrl: TLabel;
    procedure edtNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdssetor_localGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Host: string;
    procedure loadDados();
  public
    { Public declarations }
  end;

var
  FormAgenda: TFormAgenda;

implementation

{$R *.dfm}

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
  HostFile: string;
  UrlServico: string;
  js: TlkJSONobject;
  json: TlkJSONlist;
  Url: string;
  Str : string;
  DbFile: string;
  AppDir: string;
  DbSize: Integer;
  offset: Integer;
  i, j: Integer;
begin
  Screen.Cursor:= crHourGlass;
  cds.DisableControls;

  AppDir:= ExtractFilePath(Application.ExeName);

  // Arquivo com o host
  HostFile:= AppDir + 'host';
  if FileExists(HostFile) then
     Host:= ReadLine(HostFile);

  // Se o host n�o foi informado, pergunta para o usu�rio
  if Trim(Host) = '' then
  begin
     Host:= 'http://servicosssi.unb.br:2301';
     UrlServico:= Host + '/agenda/telefone';
     if not InputQuery('Ol� muito prazer', 'Informe a URL do Web Service da agenda de telefone do CPD:', UrlServico) then
     begin
        ShowMessage('A agenda de telefone ser� finalizada!');
        Application.Terminate;
        Exit;
     end;
  end
  else
    UrlServico:= Host + '/agenda/telefone';

  // Arquivo de cache da agenda
  DbFile:= AppDir + 'agenda.dat';
  DbSize:= FileSize(DbFile);

  // Se o arquivo de cache dos dados j� existe, apenas o carrega-o
  if DbSize > 310 then
    cds.LoadFromFile(DbFile)
  else
  begin
      // J� est� preparado para carregar muitos dados com v�rias requisi��es pequenas
      for i:= 0 to 40 do
      begin
        offset:= i * 5000;

        // Monta a requisi��o e envia ao barramento
        Url:= UrlServico + '?offset='+ IntToStr(offset);
        try
          Str := IdHTTP.get(Url);
        except
          ShowMessage('N�o foi poss�vel conectar no barramento de servi�os. Verifique a conectividade!');
          Application.Terminate;
          Exit;
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
            if not VarIsNull(js.Field['matricula'].Value) then
              cdsmatricula.AsInteger := js.Field['matricula'].Value;
            cdsnome.AsString := VarToStr(js.Field['nome'].Value);
            cdstelefone1.AsString := VarToStr(js.Field['telefone'].Value);
            cdstelefone2.AsString := VarToStr(js.Field['telefone2'].Value);
            cdsemail.AsString := VarToStr(js.Field['email'].Value);
            cdssetor.AsString := VarToStr(js.Field['setor'].Value);
            cdslocal.AsString := VarToStr(js.Field['local'].Value);
            cdscargo.AsString := VarToStr(js.Field['cargo'].Value);
            cdsramal.AsString := VarToStr(js.Field['ramal'].Value);
            cds.Post;
          except
            // Algum dado pode ter causado a exception
            cds.Cancel;
          end;
        end;

        // chegou ao fim ou tem mais contatos
        if ((json.Count = 0) or (json.Count < 999)) then
          Break;
      end;

      // Salva a agenda para trabalhar offline
      try
        cds.SaveToFile(DbFile);
      except
        // N�o tem permiss�o para gravar no disco
      end;
  end;
  cds.EnableControls;
  SetFileAttributes(PAnsiChar(HostFile), 2);
  SetFileAttributes(PAnsiChar(DbFile), 2);
  StringToFile(HostFile, Host, False);
  StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico;
  ActiveControl:= edtNome;
  Screen.Cursor:= crDefault;
end;

procedure TFormAgenda.edtNomeChange(Sender: TObject);
var
  NomePesquisa: string;
begin
  NomePesquisa:= Trim(edtNome.Text);
  if NomePesquisa <> '' then
  begin
    PainalLadoEsquerdo.Enabled:= True;
    PainalLadoEsquerdo.Animate:= True;
    cds.DisableControls;
    cds.Filtered:= False;
    cds.FilterOptions:= [foCaseInsensitive];
    cds.Filter := 'nome like ' + QuotedStr('%' + edtNome.Text + '%');
    cds.Filtered:= True;
    lblUrl.Caption:= Host + '/agenda/telefone?filter="{ "nome__contains" : "'+ edtNome.Text + '" }"';
    lblUrl.Show;
    cds.EnableControls;
  end
  else
  begin
    PainalLadoEsquerdo.Enabled:= False;
    lblUrl.Hide;
  end;
end;

procedure TFormAgenda.FormShow(Sender: TObject);
begin
  loadDados();
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
      if not (gdSelected in State) then // se a c�lula n�o est� selecionada
      begin
        if not odd(dat.RecNo) then // se for �mpar
        begin
           grdItens.Canvas.Brush.Color:=$00FFEFDF; // define uma cor de fundo
        end;
      end;
    end;
    grdItens.Canvas.FillRect(Rect); // pinta a c�lula
    grdItens.DefaultDrawColumnCell(Rect,DataCol, Column,State); // pinta o texto padr�o
    inherited;
  end;
end;

procedure TFormAgenda.cdssetor_localGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text:= cdssetor.AsString + '  ' + cdslocal.AsString; 
end;

procedure TFormAgenda.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormAgenda.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =  VK_DOWN then
    grdItens.SetFocus;
end;

end.
