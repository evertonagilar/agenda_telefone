unit frmAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBClient, Buttons, jpeg, ExtCtrls, JvExStdCtrls, JvExExtCtrls,
  JvExtComponent, uLkJSON, ComCtrls, JvExComCtrls, pngimage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdHTTP,
  IdTCPClient, JvHtControls, JvAnimatedImage, JvGIFCtrl, JvExControls, DB,
  StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, Dialogs, JvLookOut,
  JvAnimate, JvNetscapeSplitter, ImgList, JvImageList, JvTabBar,
  JvTabBarXPPainter, JvImageRotate, JvExForms, JvBaseThumbnail,
  JvThumbViews, Mask, DBCtrls;

type
  TFormAgenda = class(TForm)
    cds: TClientDataSet;
    cdsnome: TStringField;
    cdstelefone1: TStringField;
    cdsramal: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
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
    IdHTTP: TIdHTTP;
    JvExpress1: TJvExpress;
    btnMostraPainelAgendaRamais: TJvExpressButton;
    btnMostrarAniversariantes: TJvExpressButton;
    btnReservasSala: TJvExpressButton;
    Image2: TImage;
    JvHTLabel3: TJvHTLabel;
    ImageList1: TImageList;
    cdsfoto: TGraphicField;
    cdsaniversario: TDateField;
    cdsReservasEm: TClientDataSet;
    IntegerField1: TIntegerField;
    btnSair: TJvExpressButton;
    Panel7: TPanel;
    Panel8: TPanel;
    PainelAgendaRamais: TGroupBox;
    Label1: TLabel;
    JvHTLabel2: TJvHTLabel;
    grdItens: TJvDBGrid;
    edtNome: TEdit;
    PainelReservarSalas: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    JvHTLabel4: TJvHTLabel;
    grdReservas: TJvDBGrid;
    Edit1: TEdit;
    PainelAniversariantes: TGroupBox;
    Label3: TLabel;
    JvHTLabel1: TJvHTLabel;
    BitBtn2: TBitBtn;
    grdListaAniversariantes: TJvDBGrid;
    PainelBranco: TGroupBox;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    JvTabBar1: TJvTabBar;
    SpeedButton1: TSpeedButton;
    PainelEdicaoContato: TGroupBox;
    JvHTLabel5: TJvHTLabel;
    btnSalvar: TSpeedButton;
    TabBarContato: TJvTabBar;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBImage1: TDBImage;
    Label20: TLabel;
    DBEdit13: TDBEdit;
    procedure edtNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdssetor_localGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMostraPainelAgendaRamaisClick(Sender: TObject);
    procedure btnMostrarAniversariantesClick(Sender: TObject);
    procedure btnReservasSalaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure TabBarContatoClick(Sender: TObject);
  private
    Host: string;
    UrlServico: string;
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
  try
    AppDir:= ExtractFilePath(Application.ExeName);

    // Arquivo com o host
    HostFile:= AppDir + 'host';
    if FileExists(HostFile) then
       Host:= ReadLine(HostFile);

    // Se o host não foi informado, pergunta para o usuário
    if Trim(Host) = '' then
    begin
       Host:= 'http://servicosssi.unb.br:2301';
       UrlServico:= Host + '/agenda/telefone';
       if not InputQuery('Olá muito prazer', 'Informe a URL do Web Service da agenda de telefone do CPD:', UrlServico) then
       begin
          ShowMessage('A agenda de telefone será finalizada!');
          Application.Terminate;
          Exit;
       end;
    end
    else
      UrlServico:= Host + '/agenda/telefone';

    // Arquivo de cache da agenda
    DbFile:= AppDir + 'agenda.dat';
    DbSize:= FileSize(DbFile);

    // Se o arquivo de cache dos dados já existe, apenas o carrega-o
    if DbSize > 310 then
      cds.LoadFromFile(DbFile)
    else
    begin
        // Já está preparado para carregar muitos dados com várias requisições pequenas
        for i:= 0 to 40 do
        begin
          offset:= i * 5000;

          // Monta a requisição e envia ao barramento
          Url:= UrlServico + '?offset='+ IntToStr(offset);
          try
            Str := IdHTTP.get(Url);
          except
            ShowMessage('Não foi possível conectar no barramento de serviços. Verifique a conectividade!');
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
          // Não tem permissão para gravar no disco
        end;
    end;
    SetFileAttributes(PAnsiChar(HostFile), 2);
    SetFileAttributes(PAnsiChar(DbFile), 2);
    StringToFile(HostFile, Host, False);
    StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico;
    ActiveControl:= edtNome;
  finally
    cds.EnableControls;
    Screen.Cursor:= crDefault;
  end;
end;

procedure TFormAgenda.edtNomeChange(Sender: TObject);
var
  NomePesquisa: string;
begin
  NomePesquisa:= Trim(edtNome.Text);
  if NomePesquisa <> '' then
  begin
    cds.DisableControls;
    cds.Filtered:= False;
    cds.FilterOptions:= [foCaseInsensitive];
    cds.Filter := 'nome like ' + QuotedStr('%' + edtNome.Text + '%');
    cds.Filtered:= True;
    StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico + '?filter="{ "nome__contains" : "'+ edtNome.Text + '" }"';
    cds.EnableControls;
  end
  else
  begin
    StatusBar.Panels[1].Text:= 'Barramento: '+ UrlServico
  end;
end;

procedure TFormAgenda.FormShow(Sender: TObject);
begin
  PainelReservarSalas.Hide;
  PainelAniversariantes.Hide;
  PainelEdicaoContato.Hide;
  PainelEdicaoContato.Hide;
  PainelAgendaRamais.Show;
  PainelAgendaRamais.BringToFront;
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

procedure TFormAgenda.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =  VK_DOWN then
    grdItens.SetFocus;
end;

procedure TFormAgenda.btnMostraPainelAgendaRamaisClick(Sender: TObject);
begin
  TabBarContato.Show;
  TabBarContato.Tabs[0].Selected:= True;
  PainelAniversariantes.Hide;
  PainelReservarSalas.Hide;
  PainelAgendaRamais.Show;
  PainelAgendaRamais.BringToFront;
end;

procedure TFormAgenda.btnMostrarAniversariantesClick(Sender: TObject);
begin
  TabBarContato.Hide;
  PainelAniversariantes.Show;
  PainelReservarSalas.Hide;
  PainelAgendaRamais.Hide;
  PainelEdicaoContato.Hide;
  PainelAniversariantes.BringToFront;
end;

procedure TFormAgenda.btnReservasSalaClick(Sender: TObject);
begin
  TabBarContato.Hide;
  PainelAniversariantes.Hide;
  PainelReservarSalas.Show;
  PainelAgendaRamais.Hide;
  PainelEdicaoContato.Hide;
  PainelReservarSalas.BringToFront;
end;

procedure TFormAgenda.btnSairClick(Sender: TObject);
begin
   if Application.MessageBox('Você tem certeza que deseja sair?', PChar(Application.Title), MB_OKCANCEL) = mrOk then
    Application.Terminate;
end;

procedure TFormAgenda.TabBarContatoClick(Sender: TObject);
begin
  if TabBarContato.Tabs[0].Selected then
  begin
    PainelAgendaRamais.Show;
    PainelEdicaoContato.Hide;
    PainelAgendaRamais.BringToFront;
  end
  else
  begin
    PainelAgendaRamais.Hide;
    PainelEdicaoContato.Show;
    PainelEdicaoContato.BringToFront;
  end;
end;

end.
