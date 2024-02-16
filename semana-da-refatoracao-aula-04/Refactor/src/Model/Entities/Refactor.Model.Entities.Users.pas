unit Refactor.Model.Entities.Users;

interface

type
  TUSERS = class
    private
    FNAME: String;
    FID: Integer;
    procedure SetID(const Value: Integer);
    procedure SetNAME(const Value: String);
    function GetNAME: String;
    public
      property ID : Integer read FID write SetID;
      property NAME : String read GetNAME write SetNAME;
  end;

implementation

uses
  System.SysUtils;

{ TUSERS }

function TUSERS.GetNAME: String;
begin
  if Trim(FNAME) = '' then
    raise Exception.Create('Informe o nome do Usuário');

  Result := FNAME;
end;

procedure TUSERS.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TUSERS.SetNAME(const Value: String);
begin
  FNAME := Value;
end;

end.
