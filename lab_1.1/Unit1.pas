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
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  function odz(x:real):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x,f: real;

implementation

{$R *.dfm}

//функция проверки одз
function TForm1.odz(x:real):boolean;
begin
  if (x*x - 2 > 0) and ((1 - x < 0) or (1 - x > 0)) then
  odz := True
  else
  odz := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  f := 0;
  x := StrToFloat (Edit1.Text);
  if odz(x) = False then
    begin
      Edit2.Text := '';
      Label4.Caption := 'х не принадлежит ОДЗ';
    end
    else
    begin
      f := ln(x*x-2)/(1-x);
      Edit2.Text := FloatToStr(f);
      Label4.Caption := '';
    end
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;

end.

