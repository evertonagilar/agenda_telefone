unit frmAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, JvMenus, JvComponentBase, ImgList,
  JvImageList, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, DB,
  DBClient, Buttons, jpeg, ExtCtrls, JvExStdCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvHtControls, WinSkinData, uLkJSON,
  WinSkinStore, ComCtrls, JvExComCtrls, JvStatusBar, pngimage, 
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  JvExControls, JvAnimatedImage, JvGIFCtrl;

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
    skin: TSkinData;
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
    procedure edtNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdssetor_localGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
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
     result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     result := -1;
  FindClose(sr) ;
end;

procedure TFormAgenda.loadDados();
var
  UrlServico: string;
  js: TlkJSONobject;
  json: TlkJSONlist;
  lhttp :TIdHTTP;
  Url: string;
  Str :String;
  DbFile: string;
  DbSize: Integer;
  offset: Integer;
  i, j: Integer;
begin
  Screen.Cursor:= crHourGlass;
  cds.DisableControls;
  DbFile:= SysUtils.GetCurrentDir + SysUtils.PathDelim + '.agenda.bin';
  DbSize:= FileSize(DbFile);
  if DbSize > 310 then
    cds.LoadFromFile(DbFile)
  else
  begin
    UrlServico:= 'http://servicosssi.unb.br:2301/agenda/telefone';
    if InputQuery('Olá muito prazer', 'Informe a URL do Web Service da agenda de telefone do CPD:', UrlServico) then
    begin
      Screen.Cursor:= crHourGlass;
      lhttp := TIdHTTP.Create(nil);
      for i:= 0 to 40 do
      begin
        Application.ProcessMessages;
        offset:= i * 5000;
        Url:= UrlServico + '?limit=5000&offset='+ IntToStr(offset);
        try
          Str := lhttp.get(Url);
        except
          ShowMessage('Não foi possível conectar no barramento de serviços. Verifique a conectividade!');
          Application.Terminate;
        end;
        json := TlkJSON.ParseText(Str) as TlkJSONlist;
        try
          if json = nil then
            Continue; // algum caracter estranho estragou
          for j:= 0 to json.Count-1 do
          begin
            js := json.Child[j] as TlkJSONobject;
            cds.Append;
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
          end;
        finally
          json.Free;
        end;
        if ((json.Count = 0) or (json.Count < 999)) then
          break;
      end;
      cds.SaveToFile(DbFile);
      StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico;
      lhttp.Free;
    end
    else
    begin
      ShowMessage('A agenda de telefone será finalizada!');
      Application.Terminate;
    end;
  end;
  cds.EnableControls;
  SetFileAttributes(PAnsiChar(DbFile), 2);
  Screen.Cursor:= crDefault;
end;

procedure TFormAgenda.edtNomeChange(Sender: TObject);
begin
  PainalLadoEsquerdo.Animate:= True;
  cds.DisableControls;
  cds.Filtered:= False;
  cds.FilterOptions:= [foCaseInsensitive];
  cds.Filter := 'nome like ' + QuotedStr('%' + edtNome.Text + '%');
  cds.Filtered:= True;
  cds.EnableControls;
end;

procedure TFormAgenda.FormShow(Sender: TObject);
begin
  if FileExists(SysUtils.GetCurrentDir + SysUtils.PathDelim + 'no_skin') then
    skin.Active:= False;
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

procedure TFormAgenda.cdssetor_localGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text:= cdssetor.AsString + '  ' + cdslocal.AsString; 
end;

procedure TFormAgenda.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
