unit FOrigemImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfrmOrigemImagem = class(TForm)
    GroupBoxFocus1: TGroupBox;
    rbtArquivo: TRadioButton;
    rbtWebCam: TRadioButton;
    btnOk: TButton;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelecionaOrigemImagem: Integer;


implementation

{$R *.dfm}

function SelecionaOrigemImagem: Integer;
var
  frmOrigemImagem: TfrmOrigemImagem;
begin
  frmOrigemImagem:= TfrmOrigemImagem.Create(Application);
  try
    if frmOrigemImagem.ShowModal = mrOk then
    begin
      if frmOrigemImagem.rbtArquivo.Checked then
        Result:= 0
      else
        Result:= 1;
    end
    else
      Result:= -1;
  finally
    frmOrigemImagem.Free;
  end;
end;

end.
