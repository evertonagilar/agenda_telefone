unit FImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, CodeDetector, VideoCap, DB, ExtDlgs,
  UnGestorUtils, UnRaiseMsg, JvDBImage;

type
  TTipoImagem = (tiProdutos, tiPessoas, tiOutros, tiVeiculos, tiFuncionarios, tiTransportadora);

  TGetFileNameImagemEvent = procedure(Sender: TObject; var AFileName: string) of object;

  TfrmeImagem = class(TFrame)
    GroupBox: TGroupBox;
    foto: TJvDBImage;
    btnIncluir: TBitBtn;
    btnLimpar: TBitBtn;
    Imagem: TOpenPictureDialog;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure ImagemShow(Sender: TObject);
  private
    FTipoImagem: TTipoImagem;
    FPastaImagem: string;
    FOnGetFileName: TGetFileNameImagemEvent;
    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetCaption: string;
    procedure SetCaption(const Value: string);
    procedure SetupPastaImagem;
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;

  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property Caption: string read GetCaption write SetCaption;
    property TipoImagem: TTipoImagem read FTipoImagem write FTipoImagem default tiOutros;

    property OnGetFileName: TGetFileNameImagemEvent read FOnGetFileName write FOnGetFileName;
  end;

implementation

uses
  FFotoPreview, FOrigemImagem;

{$R *.dfm}

procedure TfrmeImagem.btnIncluirClick(Sender: TObject);
var
  PathImagem: string;
  ArqFoto: string;
  NomeArq, NomeArqDest: string;
  ExtArq: string;
begin
  if foto.DataSource.DataSet.State = dsBrowse then
    foto.DataSource.DataSet.Edit;

  case SelecionaOrigemImagem of
    0:
    begin
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      if Imagem.Execute then
      begin
        Application.ProcessMessages;
        NomeArq:= UpperCase(Imagem.FileName);
        ExtArq:= ExtractFileExt(NomeArq);
        if (ExtArq <> '.BMP') and (ExtArq <> '.JPG') then
        begin
          RaiseMsg.ShowExclamation(
            'Arquivo de imagem "'+ NomeArq + '" não suportado!'#13#13+
            'Somente imagens do tipo Bitmap e Jpeg são suportados e com tamanho inferior a 25 megabytes.');
        end;

        try
          if (ExtArq = '.BMP') then
          begin
            NomeArq:= ConverterBmpParaJPeg(NomeArq);
          end
          else if (ExtArq = '.JPG') then
          begin
            if (GetTamArqEmKBytes(NomeArq) > 1024) then
              NomeArq:= ConverterJPegQuality(NomeArq, 60, NomeArq);
          end;
          if GetTamArqEmKBytes(NomeArq) > 25000 then
            RaiseMsg.ShowExclamation('Arquivos maiores que 25 megabytes não são suportados!');
          TBlobField(foto.Field).LoadFromFile(NomeArq);
        except
          on E: Exception do
          begin
            RaiseMsg.ShowExclamation(
              'Arquivo de imagem "'+ NomeArq + '" não suportado!'#13#13+
              'Erro interno: '+ E.Message);
          end;
        end;

        // Faz uma copia na pasta de imagens
        if Assigned(FOnGetFileName) then
          FOnGetFileName(Self, NomeArqDest)
        else
          NomeArqDest:= ExtractFileName(NomeArq);
        CopyFile(PAnsiChar(NomeArq), PAnsiChar(FPastaImagem + '\' + NomeArqDest), True);
      end;
    end;
    1:
    begin
      // Obtém a pasta das imagens
      PathImagem:= ExtractFilePath(Application.ExeName) + 'Imagens';
      if not DirectoryExists(PathImagem) then
        CreateDir(PathImagem);

      // Gera um nome para a imagem

      // Faz uma copia na pasta de imagens
      if Assigned(FOnGetFileName) then
        FOnGetFileName(Self, NomeArqDest)
      else
        NomeArqDest:= 'imagem_' + FormatDateTime('yyyymmdd_hhmmss', Now) + '.jpg';

      ArqFoto:= FPastaImagem + '\' + NomeArqDest;

      Application.ProcessMessages;
      if SelecionaFoto(ArqFoto) then
      begin
        Application.ProcessMessages;
        TBlobField(foto.Field).LoadFromFile(ArqFoto);
      end;
    end;
  end;
end;

function TfrmeImagem.GetDataField: string;
begin
  Result:= foto.DataField;
end;

function TfrmeImagem.GetDataSource: TDataSource;
begin
  Result:= foto.DataSource;
end;

procedure TfrmeImagem.SetDataField(const Value: string);
begin
  foto.DataField:= Value;
end;

procedure TfrmeImagem.SetDataSource(const Value: TDataSource);
begin
  foto.DataSource:= Value;
end;

procedure TfrmeImagem.btnLimparClick(Sender: TObject);
begin
  if foto.Field.DataSet.State = dsBrowse then
    foto.Field.DataSet.Edit;
  foto.CutToClipboard;
end;

function TfrmeImagem.GetCaption: string;
begin
  Result:= GroupBox.Caption;
end;

procedure TfrmeImagem.SetCaption(const Value: string);
begin
  GroupBox.Caption:= Value;
end;

constructor TfrmeImagem.Create(AOwner: TComponent);
begin
  inherited;
  FTipoImagem:= tiOutros;
  FOnGetFileName:= nil;
end;

procedure TfrmeImagem.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    SetupPastaImagem;
end;

procedure TfrmeImagem.SetupPastaImagem;
begin
  FPastaImagem:= ExtractFilePath(Application.ExeName);
  case FTipoImagem of
    tiProdutos: FPastaImagem:= FPastaImagem + 'ImagensProdutos';
    tiPessoas: FPastaImagem:= FPastaImagem + 'ImagensPessoas';
    tiVeiculos: FPastaImagem:= FPastaImagem + 'ImagensVeiculos';
    tiFuncionarios: FPastaImagem:= FPastaImagem + 'ImagensFuncionarios';
    tiTransportadora: FPastaImagem:= FPastaImagem + 'ImagensTransportadora';
    else FPastaImagem:= FPastaImagem + 'Imagens';
  end;
  ForceDirectories(FPastaImagem);
  Imagem.InitialDir:= FPastaImagem;
end;

procedure TfrmeImagem.ImagemShow(Sender: TObject);
begin
  Imagem.InitialDir:= FPastaImagem;
end;



end.