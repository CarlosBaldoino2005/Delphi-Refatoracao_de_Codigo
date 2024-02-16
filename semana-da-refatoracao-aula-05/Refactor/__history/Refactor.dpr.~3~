program Refactor;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {Form1},
  uDmDados in 'uDmDados.pas' {DataModule1: TDataModule},
  Refactor.Model.Entities.Categoria in 'src\Model\Entities\Refactor.Model.Entities.Categoria.pas',
  Refactor.Model.DAO.Categoria in 'src\Model\DAO\Refactor.Model.DAO.Categoria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
