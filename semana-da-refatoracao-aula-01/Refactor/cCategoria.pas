﻿unit cCategoria;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, VCL.Graphics;

type
    TCategoria = class
    private
        Fconn: TFDConnection;
        FQuery : TFDQuery;
        FID_CATEGORIA: Integer;
        FDESCRICAO: string;
        FICONE: TBitmap;
        FINDICE_ICONE: Integer;
    public
        constructor Create(conn: TFDConnection);
        destructor Destroy; override;
        property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;
        property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
        property ICONE: TBitmap read FICONE write FICONE;
        property INDICE_ICONE: Integer read FINDICE_ICONE write FINDICE_ICONE;

        function ListarCategoria: TFDQuery;
        procedure Inserir;
        procedure Alterar;
        procedure Excluir;
end;

implementation

{ TCategoria }

constructor TCategoria.Create(conn: TFDConnection);
begin
  Fconn := conn;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConn;
end;

destructor TCategoria.Destroy;
begin
  FQuery.DisposeOf;
  inherited;
end;

procedure TCategoria.Inserir;
begin
  if DESCRICAO = '' then
    raise Exception.Create('Informe a descricao da categoria');

  try
    FQuery.Connection := Fconn;
    with FQuery do
    begin
        Active := false;
        SQL.Clear;
        SQL.Add('INSERT INTO TAB_CATEGORIA(DESCRICAO, ICONE, INDICE_ICONE)');
        SQL.Add('VALUES(:DESCRICAO, :ICONE, :INDICE_ICONE)');
        ParamByName('DESCRICAO').Value := DESCRICAO;
        ParamByName('ICONE').Assign(ICONE);
        ParamByName('INDICE_ICONE').Value := INDICE_ICONE;
        ExecSQL;
    end;
  except on ex:exception do
    raise Exception.Create('Erro ao inserir categorias: ' + ex.Message);
  end;
end;

procedure TCategoria.Alterar;
begin
  if ID_CATEGORIA <= 0 then
    raise Exception.Create('Informe o ID da categoria');

  if DESCRICAO = '' then
    raise Exception.Create('Informe a descricao da categoria');


  try
    FQuery.Connection := Fconn;

    with FQuery do
    begin
        Active := false;
        SQL.Clear;
        SQL.Add('UPDATE TAB_CATEGORIA SET DESCRICAO=:DESCRICAO, ICONE=:ICONE,');
        SQL.Add('INDICE_ICONE=:INDICE_ICONE');
        SQL.Add('WHERE ID_CATEGORIA = :ID_CATEGORIA');
        ParamByName('DESCRICAO').Value := DESCRICAO;
        ParamByName('ICONE').Assign(ICONE);
        ParamByName('ID_CATEGORIA').Value := ID_CATEGORIA;
        ParamByName('INDICE_ICONE').Value := INDICE_ICONE;
        ExecSQL;
    end;
  except on ex:exception do
    raise Exception.Create('Erro ao alterar categorias: ' + ex.Message);
  end;
end;

procedure TCategoria.Excluir;
begin
  if ID_CATEGORIA <= 0 then
    raise Exception.Create('ID da Categoria não pode ser Zero');

  try
    FQuery.Connection := Fconn;

    with FQuery do
    begin
        Active := false;
        SQL.Clear;
        SQL.Add('DELETE FROM TAB_CATEGORIA');
        SQL.Add('WHERE ID_CATEGORIA = :ID_CATEGORIA');
        ParamByName('ID_CATEGORIA').Value := ID_CATEGORIA;
        ExecSQL;
    end;

    except on ex:exception do
    begin
        raise Exception.Create('Erro ao Excluir Categorias: ' + ex.Message);
    end;
  end;
end;

function TCategoria.ListarCategoria: TFDQuery;
begin
    try
      FQuery.Connection := Fconn;
      with FQuery do
      begin
          Active := false;
          sql.Clear;
          sql.Add('SELECT * FROM TAB_CATEGORIA');
          sql.Add('WHERE 1 = 1');

          if ID_CATEGORIA > 0 then
          begin
              SQL.Add('AND ID_CATEGORIA = :ID_CATEGORIA');
              ParamByName('ID_CATEGORIA').Value := ID_CATEGORIA;
          end;

          Active := true;
      end;

      Result := FQuery;

    except on ex:exception do
    begin
        Result := nil;
        raise Exception.Create('Erro ao Consultar Categorias: ' + ex.Message);
    end;
  end;
end;

end.
