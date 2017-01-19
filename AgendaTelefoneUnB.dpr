program AgendaTelefoneUnB;

uses
  VCLFixPack,
  Midaslib,
  Forms,
  frmAgenda in 'frmAgenda.pas' {FormAgenda},
  uLkJSON in 'uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Pesquisar Telefone/Ramal no CPD/UnB';
  Application.CreateForm(TFormAgenda, FormAgenda);
  Application.Run;
end.
