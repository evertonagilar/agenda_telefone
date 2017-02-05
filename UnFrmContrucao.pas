unit UnFrmContrucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, JvExControls, JvAnimatedImage, JvGIFCtrl,
  JvLabel;

type
  TfrmConstrucao = class(TForm)
    RxGIFAnimator1: TJvGIFAnimator;
    BitBtn1: TBitBtn;
    RxLabel1: TJvLabel;
    RxLabel2: TJvLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TfrmConstrucao.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

end.
