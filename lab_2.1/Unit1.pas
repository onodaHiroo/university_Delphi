unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
  function sravnit(n1,n2:real):real;
  function summa(n1,n2,a:real):real;
  function proizvedenie(n1,n2,a:real):real;
  function kosinus(a:real):real;
  function perevod_gradusov_v_radiani(a:real):real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function TForm1.sravnit(n1,n2:real): Real;
begin
  if n1 > n2 then
    sravnit := n1 - n2;
  if n1 < n2 then
    sravnit := n2 - n1
    else
  if n1 = n2 then
    sravnit := 0;
end;

function TForm1.summa(n1,n2,a:real): Real;
begin
  summa := sqrt(sqr(n1) + sqr(n2) - 2 * n1 * n2 * cos(perevod_gradusov_v_radiani(a))); 
end;

function TForm1.proizvedenie(n1,n2,a:real): Real;
begin
  proizvedenie := n1 * n2 * cos(perevod_gradusov_v_radiani(a));
end;

//обозначила функцию kosinus для корректного расчёта косинуса,
//т.к. значение pi в delphi определено до конкретного числа
//и в точках, где косинус должен равняться нулю -
//это pi*k/2, где k - все целые числа, функция cos
//считает приблизительное значение, но не 0
function TForm1.kosinus(a:real): real;
var a1,a2: single;
begin
a1 := fmod(a, 90);
a2 := fmod(a, 180);
if ((not(a1 = 0)) or (a2 = 0))then
  kosinus := cos(perevod_gradusov_v_radiani(a))   
else  
  kosinus := 0;
end;

function TForm1.perevod_gradusov_v_radiani(a:real):real;
begin
   perevod_gradusov_v_radiani := a * pi/180;
end;

procedure TForm1.Button1Click(Sender: TObject);
var num1, num2, ugol: real;
begin

  if radiogroup1.itemindex = -1 then
  label4.caption := 'выберите условие';
  if radiogroup1.itemindex = 0 then
  begin
  if (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      label4.Caption := 'Введите длины двух векторов';
    end
    else
    if (StrToFloat(Edit1.Text) < 0) or (StrToFloat(Edit2.Text) < 0) then
    begin
      label4.Caption := 'Длины векторов не могут быть отрицательными';
    end
    else
    begin
      num1 := StrToFloat (edit1.Text);
      num2 := StrToFloat (edit2.Text);
      if num1 > num2 then
        label4.Caption := 'Первый вектор больше второго на ' + FloatToStr(sravnit(num1,num2));
      if num1 < num2 then
        label4.Caption := 'Второй вектор больше первого на ' + FloatToStr(sravnit(num1,num2));
      if num1 = num2 then
        label4.Caption := 'Векторы равны';
    end;
  end;
  if radiogroup1.itemindex = 1 then
  begin
    if (Edit3.Text = '') or (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      label4.Caption := 'Вы не ввели угол между векторами или два вектора';
    end
    else
    if (StrToFloat(Edit1.Text) < 0) or (StrToFloat(Edit2.Text) < 0) then
    begin
      label4.Caption := 'Длины векторов не могут быть отрицательными';
    end
      else
      begin
        num1 := StrToFloat (edit1.Text);
        num2 := StrToFloat (edit2.Text);
        ugol := StrToFloat (edit3.Text);
        label4.Caption := 'Длина суммы векторов: ' + FloatToStr(summa(num1, num2, ugol));
      end;
  end;
  if radiogroup1.itemindex = 2 then
  begin
  if (Edit3.Text = '') or (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      label4.Caption := 'Вы не ввели угол между векторами или два вектора';
    end
    else
    if (StrToFloat(Edit1.Text) < 0) or (StrToFloat(Edit2.Text) < 0) then
    begin
      label4.Caption := 'Длины векторов не могут быть отрицательными';
    end
      else
      begin
        num1 := StrToFloat (edit1.Text);
        num2 := StrToFloat (edit2.Text);
        ugol := StrToFloat (edit3.Text);
        label4.Caption := 'Длина скалярного произведения векторов: ' + FloatToStr(proizvedenie(num1, num2, ugol));
      end;
  end;
  if radiogroup1.itemindex = 3 then
  begin
  if (Edit3.Text = '') or (Edit1.Text = '0') or (Edit2.Text = '0') or (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      label4.Caption := 'Вы не ввели угол между векторами или длины векторов инициализированы как 0 или вовсе не инициализированы';
    end
    else
    if (StrToFloat(Edit1.Text) < 0) or (StrToFloat(Edit2.Text) < 0) then
    begin
      label4.Caption := 'Длины векторов не могут быть отрицательными';
    end
      else
      begin
        ugol := StrToFloat (edit3.Text);
        label4.Caption := 'Косинус угла между векторами: ' + FloatToStr(kosinus(ugol));
      end;
  end;
end;

end.
