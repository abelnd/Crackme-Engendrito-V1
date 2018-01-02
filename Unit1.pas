unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,registry;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure autentificacion();
    procedure registro();
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function StrArrayJoin(const StringArray : array of string; const Separator : string) : string;
var
  i : Integer;
begin
  Result := '';
  for i := low(StringArray) to high(StringArray) do
    Result := Result + StringArray[i] + Separator;

  Delete(Result, Length(Result), 1);
end;

function ArrayToString(const a: array of Char): string;
begin
  if Length(a)>0 then
    SetString(Result, PChar(@a[0]), Length(a))
  else
    Result := '';
end;



procedure TForm1.Button1Click(Sender: TObject);
begin

Application.Terminate;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
reg        : TRegistry;


begin

reg := TRegistry.Create(KEY_READ);
reg.RootKey := HKEY_CURRENT_USER;

if (not reg.KeyExists('SOFTWARE\abeljm\engendrito')) then
    begin
      label3.caption := StrArrayJoin(['u','s','u','a','r','i','o',' ','n','o',' ','r','e','g','i','s','t','r','a','d','o','o'], '');
    end
else
  begin

  label3.caption := StrArrayJoin(['u','s','u','a','r','i','o',' ','r','e','g','i','s','t','r','a','d','o','o'], '');

  end;


end;

procedure TForm1.autentificacion;
var


nombre,chicomalo,chicobueno :string;
clave :string;
serial: array[0..11] of char;


begin


serial[0] := 's';
serial[1] := 'o';
serial[2] := 's';
serial[3] := 'e';
serial[4] := 'l';
serial[5] := 'p';
serial[6] := 'u';
serial[7] := 't';
serial[8] := 'o';
serial[9] := 'a';
serial[10] := 'm';
serial[11] := 'o';

clave := ArrayToString(serial);

nombre := Edit1.Text;




  if (Edit2.Text = clave) then
  begin // inicio

    chicobueno :=StrArrayJoin(['G','e','n','i','a','l',' ','l','o',' ','l','o','g','r','a','s','t','e',' ','i','n','t','e','n','t','a',' ','h','a','c','e','r',' ','u','n',' ','T','u','t','o','.','o'], '');
    label3.Caption := chicobueno;
    registro();


  end
else
begin
  chicomalo :=StrArrayJoin(['L', 'o',' ', 's','i','e','n','t','o',' ','s','i','g','u','e',' ','i','n','t','e','n','t','a','n','d','o','o'], '');
  label3.Caption := chicomalo;
end;

end;
procedure TForm1.registro;
var
Result : Boolean;
miregistro : TRegistry;
nombre :string;

begin
      result := true;
      miregistro := TRegistry.Create(KEY_READ);
      miregistro.RootKey := HKEY_CURRENT_USER;

    // -------------------------------------------------------------------------
    if (not miregistro.KeyExists('SOFTWARE\abeljm\engendrito')) then
    begin

      miregistro.Access := KEY_WRITE;

      if miregistro.OpenKey('SOFTWARE\abeljm\engendrito', result) then
      begin
        miregistro.WriteString('user', nombre);
        miregistro.WriteString('serial',Edit2.Text);

      end;
      miregistro.CloseKey;
      miregistro.Free;

    end;
    //-------------------------------------------------------------------------

end;

procedure TForm1.Button2Click(Sender: TObject);

begin


autentificacion();

end;

end.
