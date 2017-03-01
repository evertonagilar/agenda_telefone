unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Camera, Buttons, Grids, DBGrids, Menus, DB, Mask,
  DBCtrls, MaskUtils, DBXpress, Jpeg;

type
  TfPrincipal = class(TForm)
    btnCaptura: TButton;
    Panel1: TPanel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    mnuSair1: TMenuItem;
    Editar1: TMenuItem;
    mnuInserir1: TMenuItem;
    mnuAlterar1: TMenuItem;
    N1: TMenuItem;
    mnuGravar1: TMenuItem;
    mnuCancelar1: TMenuItem;
    N2: TMenuItem;
    mnuExcluir1: TMenuItem;
    dbgVisitas: TDBGrid;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel3: TPanel;
    imgFoto: TImage;
    dbeNome: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeCidade: TDBEdit;
    dbeRG: TDBEdit;
    dbeCPF: TDBEdit;
    dbeNasc: TDBEdit;
    dbeEmpresa: TDBEdit;
    dbeContato: TDBEdit;
    dbeTelefone: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeEstado: TDBComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBNavigator2: TDBNavigator;
    Label11: TLabel;
    Label12: TLabel;
    DBNavigator1: TDBNavigator;
    procedure btnCapturaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
  private
    procedure AtivaDesativaBotoes(AAcao: Char);
    function LimpaString(ATexto: String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses DataModule, SqlExpr, CapturaCam;

{$R *.dfm}

procedure TfPrincipal.btnAlterarClick(Sender: TObject);
begin
  with dmPrincipal do
  begin
    if not cdsVisitantes.IsEmpty then
    begin
      cdsVisitantes.Edit;
      dbeNome.SetFocus;
      AtivaDesativaBotoes('A');
    end;
  end;
end;

procedure TfPrincipal.btnCancelarClick(Sender: TObject);
begin
  with dmPrincipal do
  begin
    cdsVisitantes.Cancel;
    AtivaDesativaBotoes('C');
  end;
end;

procedure TfPrincipal.btnExcluirClick(Sender: TObject);
var
  ID : Integer;
  Transacao : TTransactionDesc;
  DirNomeFoto: string;
begin
  with dmPrincipal do
    if MessageDlg('Confirma exclusão de visitante e suas visitas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with sqlConexao do
      begin
        Transacao.TransactionID:= 1;
        Transacao.IsolationLevel:=  xilReadCommitted;
        try
          StartTransaction(Transacao);
          {Pega o diretório e nome da foto para excluir}
          DirNomeFoto := cdsVisitantes.FieldByName('FOTO').AsString;
          {Deleta os filhos}
          ID := cdsVisitantes.FieldByName('ID').AsInteger;
          ExecuteDirect('DELETE FROM VISITAS WHERE ID_VISITANTE = ' + IntToStr(ID));

          {Deleta o Pai}
          ID := cdsVisitantes.FieldByName('ID').AsInteger;
          ExecuteDirect('DELETE FROM VISITANTES WHERE ID = ' + IntToStr(ID));
          Commit(Transacao);
          Refresh;
          CloseDataSets;
          DeleteFile(DirNomeFoto);
        except on E:Exception do
          begin
            Rollback(Transacao);
            MessageDlg('Houve um erro ao tentar excluir os regitros.', mtError, [mbOK], 0);
          end;
        end;

      end;
    end;
end;

procedure TfPrincipal.btnGravarClick(Sender: TObject);
begin
  with dmPrincipal, cdsVisitantes do
  begin
    if Trim(FormatMaskText('999999999', FieldByName('RG').AsString)) <> '' then
    begin
      cdsVisitantes.Post;
      cdsVisitantes.ApplyUpdates(0);
      sqlConexao.CloseDataSets;
      AtivaDesativaBotoes('G');
    end
    else
    begin
      MessageDlg('O campo R.G. é de preenchimento obrigatório.', mtWarning, [mbOk], 0);
      dbeRG.SetFocus;
    end;
  end;
end;

procedure TfPrincipal.btnIncluirClick(Sender: TObject);
begin
  with dmPrincipal do
  begin
    cdsVisitantes.Append;
    cdsVisitantes.FieldByName('ID').AsInteger := 1;
    cdsVisitantes.FieldByName('DATA_CAD').AsDateTime := Now;
    dbeNome.SetFocus;
    AtivaDesativaBotoes('I');
  end;
end;

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPrincipal.DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
begin
  with dmPrincipal, cdsVisitas do
  begin
    if State in [dsInsert] then
    begin
      FieldbyName('ID').AsInteger := 1;
      FieldbyName('ID_VISITANTE').AsInteger := cdsVisitantes.FieldByName('ID').AsInteger;
      FieldbyName('DATA_VISITA').AsDateTime := Now;
    end;
  end;
end;

procedure TfPrincipal.btnCapturaClick(Sender: TObject);
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
    AFoto:= TImage.Create(fPrincipal);
    AFoto.Parent := fPrincipal;
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
    with fCaptura, camCamera, dmPrincipal, cdsVisitantes do
    begin
      DirNomeFoto := ExtractFilePath(Application.ExeName) +
        LimpaString(FieldByName('RG').AsString) + '.bmp';

      NomeFoto := ExtractFilePath(DirNomeFoto) +
        Copy(ExtractFileName(DirNomeFoto),1, Length(ExtractFileName(DirNomeFoto))-4);

      FichierImage := ExtractFileName(DirNomeFoto);
      if fCaptura.ShowModal = mrOk then
      begin
        CaptureImageDisque;
        ConverteParaJpeg(NomeFoto);
        FieldByName('FOTO').AsString := NomeFoto + '.jpg';
      end;
    end;
  finally
    FreeAndNil(fCaptura);
  end;
end;

procedure TfPrincipal.FormDestroy(Sender: TObject);
begin
  with dmPrincipal do
  begin
    cdsVisitantes.Active := False;
    cdsVisitas.Active := False;
    sqlConexao.Connected := False;
  end;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  with dmPrincipal do
  begin
    sqlConexao.Connected := True;
    cdsVisitantes.Open;
    cdsVisitantes.First;
  end;
end;

procedure TfPrincipal.AtivaDesativaBotoes(AAcao: Char);
begin
  case AAcao of
    'I','A' :
      begin
        btnIncluir.Enabled   := False;
        btnAlterar.Enabled   := False;
        btnGravar.Enabled    := True;
        btnCancelar.Enabled  := True;
        btnExcluir.Enabled   := False;
        btnSair.Enabled      := False;
        btnCaptura.Enabled   := True;
        {Menus}
        mnuSair1.Enabled     := False;
        mnuInserir1.Enabled  := False;
        mnuAlterar1.Enabled  := False;
        mnuGravar1.Enabled   := True;
        mnuCancelar1.Enabled := True;
        {Se já tiver foto (momento de alteração) então não apaga}
        if (imgFoto.Picture <> nil) and (AAcao = 'I') then
          imgFoto.Picture      := Nil;
      end;
    'G','C' :
      begin
        btnIncluir.Enabled  := True;
        btnAlterar.Enabled  := True;
        btnGravar.Enabled   := False;
        btnCancelar.Enabled := False;
        btnExcluir.Enabled  := True;
        btnSair.Enabled     := True;
        btnCaptura.Enabled  := False;
        {Menus}
        mnuSair1.Enabled     := True;
        mnuInserir1.Enabled  := True;
        mnuAlterar1.Enabled  := True;
        mnuGravar1.Enabled   := False;
        mnuCancelar1.Enabled := False;
      end;
  end;
end;

function TfPrincipal.LimpaString(ATexto: String):String;
var
  I: Integer;
  s: string;
begin
  S := '';
  for I := 1 To Length(ATexto) Do
    if (ATexto[I] in ['0'..'9']) then
      S := S + Copy(ATexto, I, 1);
  Result := S;
end;

end.
