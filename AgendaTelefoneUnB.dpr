program AgendaTelefoneUnB;

uses
  Midas,
  Forms,
  UnMultInstGestor in 'UnMultInstGestor.pas',
  frmAgenda in 'frmAgenda.pas' {FormAgenda},
  uLkJSON in 'uLkJSON.pas',
  Vcl.Themes,
  Vcl.Styles,
  Windows;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Pesquisar Telefone/Ramal no CPD/UnB';
  if not AppExecutando then
  begin
    Application.CreateForm(TFormAgenda, FormAgenda);
  Application.Run;
  end;
end.
