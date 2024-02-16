program Refactor;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {Form1},
  Refactor.Model.Entities.Categoria in 'src\Model\Entities\Refactor.Model.Entities.Categoria.pas',
  Refactor.Model.DAO.Categoria in 'src\Model\DAO\Refactor.Model.DAO.Categoria.pas',
  Refactor.Model.Behaviors in 'src\Model\Behaviors\Refactor.Model.Behaviors.pas',
  Refactor.Model.Components.Connections.Interfaces in 'src\Model\Components\Connections\Refactor.Model.Components.Connections.Interfaces.pas',
  Refactor.Model.Components.Connections.Firedac in 'src\Model\Components\Connections\Refactor.Model.Components.Connections.Firedac.pas',
  Refactor.Model.DAO.Interfaces in 'src\Model\DAO\Refactor.Model.DAO.Interfaces.pas',
  Refactor.Model.Entities.Users in 'src\Model\Entities\Refactor.Model.Entities.Users.pas',
  Refactor.Model.DAO.Users in 'src\Model\DAO\Refactor.Model.DAO.Users.pas',
  Refactor.View.Pages.Users in 'src\View\Pages\Refactor.View.Pages.Users.pas' {PageUsers},
  Refactor.Controller.Interfaces in 'src\Controller\Refactor.Controller.Interfaces.pas',
  Refactor.Controller in 'src\Controller\Refactor.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPageUsers, PageUsers);
  Application.Run;
end.
