unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  function odz(x:real):boolean;
  function odz1(x:real):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x,v: real;

implementation

{$R *.dfm}

function TForm1.odz(x:real):boolean;
begin
if ((2*sqr(x)-x) > 0) and ((3+5*x > 0) or (3+5*x = 0)) then
  odz := True
  else
  odz := False;
end;

function TForm1.odz1(x:real):boolean;
begin
if ((x >= -0.6) and (x < 0)) or (x > 0.5) then
  odz1 := True
  else
  odz1 := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  v := 0;
  x := StrToFloat (Edit1.Text);
  if odz1(x) = True then
  begin
    v := ln(2*sqr(x)-x)/ln(10)+sqrt(3+5*x);
    Edit2.Text := FloatToStr(v);
    Label4.Caption := '';
  end
  else
  begin
    Edit2.Text := '';
    Label4.Caption := '� �� ����������� ���';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form1.Close;
end;

end.
