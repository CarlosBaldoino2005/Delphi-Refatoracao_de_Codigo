unit Refactor.Controller;

interface

uses
  Refactor.Controller.Interfaces,
  Refactor.Model.DAO.Interfaces,
  Refactor.Model.Entities.Categoria,
  Refactor.Model.Entities.Users;

type
  TController = class(TInterfacedObject, iController)
    private
      FCategorias : iModelDAOEntity<TCategoria>;
      FUsers : iModelDAOEntity<TUsers>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Categorias : iModelDAOEntity<TCategoria>;
      function Users : iModelDAOEntity<TUsers>;
  end;

implementation

uses
  Refactor.Model.DAO.Categoria, Refactor.Model.DAO.Users;

{ TController }

function TController.Categorias: iModelDAOEntity<TCategoria>;
begin
  if not Assigned(FCategorias) then
    FCategorias := TModelDAOCategoria.New;

  Result := FCategorias;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Users: iModelDAOEntity<TUsers>;
begin
  if not Assigned(FUsers) then
    FUsers := TModelDAOUsers.New;

  Result := FUsers;
end;

end.
