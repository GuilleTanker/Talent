program Project1;

uses
  Vcl.Forms,
  frmPrin in 'frmPrin.pas' {Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
