unit FFotoPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MPlayer, StdCtrls, Videocap, ExtCtrls, Grids, Spin, CodeDetector,
  Buttons, DBCtrls, UnBmpToGIF;

type
  TfrmFotoPreview = class(TForm)
    btnFotografar: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fScanBitmap: TBitmap;
    VideoCap1: TVideoCap;
  public
    property ScanBitmap: TBitmap read fScanBitmap write fScanBitmap;
  end;

function SelecionaFoto(const ArqFoto: string): Boolean;


implementation

{$R *.DFM}

function SelecionaFoto(const ArqFoto: string): Boolean;
var
  frmFotoPreview: TfrmFotoPreview;
begin
  frmFotoPreview:= TfrmFotoPreview.Create(Application);
  try
    Result:= frmFotoPreview.ShowModal = mrOk;
    if Result then
    begin
      if FileExists(ArqFoto) then
        DeleteFile(ArqFoto);

      Application.ProcessMessages;
      frmFotoPreview.VideoCap1.SaveToClipboard;
      Application.ProcessMessages;
      frmFotoPreview.VideoCap1.SingleImageFile:= ArqFoto;
      frmFotoPreview.VideoCap1.SaveAsDIB;
      Application.ProcessMessages;
    end;
  finally
    frmFotoPreview.Free;
  end;
end;


procedure TfrmFotoPreview.FormCreate(Sender: TObject);
begin
  try
    VideoCap1:=TVideoCap.Create(self);
    VideoCap1.ParentWindow:=Self.Handle;
    VideoCap1.Left:=2;
    VideoCap1.Top:=2;
    VideoCap1.Width:=182;
    VideoCap1.Height:=160;
    VideoCap1.PreviewScaleToWindow:= True;
    VideoCap1.PreviewRate:=30;
    VideoCap1.FrameRate:=30;
    ScanBitmap:=TBitmap.Create;
    VideoCap1.DriverIndex:= 0;

    Application.ProcessMessages;
    Application.ProcessMessages;
    Application.ProcessMessages;

    VideoCap1.DriverOpen:=True;

    Application.ProcessMessages;

    if VideoCap1.DriverOpen then
    begin
      if VideoCap1.HasVideoOverlay then VideoCap1.VideoOverlay:=True
      else VideoCap1.VideoPreview:=True;
      ScanBitmap.Width:=VideoCAp1.Width;
      ScanBitmap.Height:=VideoCAp1.Height;
      BitBlt(ScanBitmap.canvas.handle,0,0,VideoCAp1.Width,VideoCAp1.Height,VideoCAp1.HDCHandle,0,0,SRCCOPY);
    end;
  except
    ShowMessage('Erro ao conectar ao dispositivo Web-Cam!');
  end;
end;

procedure TfrmFotoPreview.FormDestroy(Sender: TObject);
begin
  ScanBitmap.Free;
end;

end.
