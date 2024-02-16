unit Refactor.Model.DAO.Categoria;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  System.SysUtils,
  VCL.Graphics,
  Refactor.Model.Entities.Categoria,
  FireDAC.Stan.Param;

type
  TModelDAOCategoria = class
    private
      FConnection: TFDConnection;
      FQuery : TFDQuery;
      FDataSet : TDataSource;
      FEntity : TCategoria;
    public
      constructor Create ( aConnection : TFDConnection);
      destructor Destroy; override;
      function Get : TModelDAOCategoria;
      function Insert : TModelDAOCategoria;
      function Update : TModelDAOCategoria;
      function Delete : TModelDAOCategoria;
      function DataSet ( aValue : TDataSource ) : TModelDAOCategoria;
      function This : TCategoria;
  end;

implementation

{ TModelDAOCategoria }

constructor TModelDAOCategoria.Create( aConnection : TFDConnection);
begin
  FConnection := aConnection;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
  FEntity := TCategoria.Create;
end;

function TModelDAOCategoria.DataSet( aValue : TDataSource ) : TModelDAOCategoria;
begin
  Result := Self;
  FDataSet := aValue;
  aValue.DataSet := FQuery;
end;

function TModelDAOCategoria.Delete: TModelDAOCategoria;
begin
  Result := Self;
  try
    FQuery.Active := false;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM TAB_CATEGORIA');
    FQuery.SQL.Add('WHERE ID_CATEGORIA = :ID_CATEGORIA');
    FQuery.ParamByName('ID_CATEGORIA').Value := FEntity.ID_CATEGORIA;
    FQuery.ExecSQL;
  except on ex:exception do
      raise Exception.Create('Erro ao Excluir Categorias: ' + ex.Message);
  end;
end;

destructor TModelDAOCategoria.Destroy;
begin
  FEntity.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

function TModelDAOCategoria.Get: TModelDAOCategoria;
begin
  Result := Self;
  try
    FQuery.Active := false;
    FQuery.sql.Clear;
    FQuery.sql.Add('SELECT * FROM TAB_CATEGORIA');
    FQuery.Active := true;
    except on ex : exception do
        raise Exception.Create('Erro ao Consultar Categorias: ' + ex.Message);
    end;
end;

function TModelDAOCategoria.Insert: TModelDAOCategoria;
begin
  Result := Self;
  try
    FQuery.Active := false;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('INSERT INTO TAB_CATEGORIA(DESCRICAO, ICONE, INDICE_ICONE)');
    FQuery.SQL.Add('VALUES(:DESCRICAO, :ICONE, :INDICE_ICONE)');
    FQuery.ParamByName('DESCRICAO').Value := FEntity.DESCRICAO;
    FQuery.ParamByName('ICONE').Assign(FEntity.ICONE);
    FQuery.ParamByName('INDICE_ICONE').Value := FEntity.INDICE_ICONE;
    FQuery.ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao Inserir Categorias: ' + ex.Message);
  end;
end;

function TModelDAOCategoria.This: TCategoria;
begin
  Result := FEntity;
end;

function TModelDAOCategoria.Update: TModelDAOCategoria;
begin
  Result := Self;
  try
    FQuery.Active := false;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('UPDATE TAB_CATEGORIA SET DESCRICAO=:DESCRICAO, ICONE=:ICONE,');
    FQuery.SQL.Add('INDICE_ICONE=:INDICE_ICONE');
    FQuery.SQL.Add('WHERE ID_CATEGORIA = :ID_CATEGORIA');
    FQuery.ParamByName('DESCRICAO').Value := FEntity.DESCRICAO;
    FQuery.ParamByName('ICONE').Assign(FEntity.ICONE);
    FQuery.ParamByName('ID_CATEGORIA').Value := FEntity.ID_CATEGORIA;
    FQuery.ParamByName('INDICE_ICONE').Value := FEntity.INDICE_ICONE;
    FQuery.ExecSQL;
  except on ex:exception do
    raise Exception.Create('Erro ao Alterar Categorias: ' + ex.Message);
  end;
end;

end.
