unit Refactor.Model.Entities.Categoria;

interface

uses
  Vcl.Graphics;

type
  TCategoria = class
  private
    FDESCRICAO: string;
    FID_CATEGORIA: Integer;
    FINDICE_ICONE: Integer;
    FICONE: TBitmap;
    function GetDESCRICAO: string;
    function GetID_CATEGORIA: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property ID_CATEGORIA: Integer read GetID_CATEGORIA write FID_CATEGORIA;
    property DESCRICAO: string read GetDESCRICAO write FDESCRICAO;
    property ICONE: TBitmap read FICONE write FICONE;
    property INDICE_ICONE: Integer read FINDICE_ICONE write FINDICE_ICONE;
  end;

implementation

uses
  System.SysUtils;

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.GetDESCRICAO: string;
begin
 if FDESCRICAO = '' then
  raise Exception.Create('Informe a descricao da categoria');

  Result := FDESCRICAO;
end;

function TCategoria.GetID_CATEGORIA: Integer;
begin
  if FID_CATEGORIA <= 0 then
    raise Exception.Create('Informe o ID da categoria');

  Result := FID_CATEGORIA;
end;

end.
