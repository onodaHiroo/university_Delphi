unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  var x0,y0: integer;
  var x1,x2,x,y,mash,mash1: real;
  begin
    //чиcтим канву от предыдущего графика
    Image1.Canvas.Pen.Color := clWhite;
    Image1.Canvas.Rectangle(0,0,Width,Height);
    //проверка условий на ввод x1 и x2
    if (Edit1.Text = '') and (Edit2.Text = '') then
    begin
      label4.Caption := 'введите x(min) и x(max)';
      exit;
    end
    else;
    if Edit1.Text = '' then
    begin
      label4.Caption := 'введите x(min)';
      exit;
    end;
    if Edit2.Text = '' then
    begin
      label4.Caption := 'введите x(max)';
      exit;
    end
    else;

    label4.Caption := '';
    x1 := StrToFloat (Edit1.Text);
    x2 := StrToFloat (Edit2.Text);

    if x1>x2 then
    begin
      label4.Caption := ('x(min) больше x(max)');
      exit
    end;
    if x2=x1 then
    begin
      label4.Caption := ('x(max) равен x(min)');
      exit
    end;
    if x1=1 then
    begin
      x1:=x1+0.001;
      label4.Caption := ('x(min) не удовлетвор€ет ќƒ«');
    end;
    if x2=1 then
    begin
      x2:=x2-0.001;
      label4.Caption := ('x(max) не удовлетвор€ет ќƒ«');
    end;
    mash:= 50*(x2-x1)/(x2-x1);
    //mash1 - динамический масштаб
    mash1 := (0.5*(Image1.Width+Image1.Height))/(x2-x1);
    with Image1 do
    begin
    x0 := Width div 2;
    y0 := Height div 2;
    with Canvas do
      begin
        //чищу оси
        Pen.Color := clWhite;
        Rectangle(0,0,Width,Height);
        //рисую оси
        Pen.Color := clBlack;
        MoveTo(0,y0);
        LineTo(width,y0);
        MoveTo(x0,0);
        LineTo(x0,height);

        Pen.Color := clRed;
        Pen.Width := 2;

        x := x1;
        y := 2 * x * cos(1/(x-1));

        if checkbox1.checked then //провер€ю нужно ли использовать динамический массив
        begin
          MoveTo(x0+Trunc(x*mash1),y0-Trunc(y*mash1));
          while x < x2 do
          begin
            if not(x=1) then //провер€ю на одз
            begin
              x := x + 0.001;
              y := 2 * x * cos(1/(x-1));
              LineTo(x0+Trunc(x*mash1),y0-Trunc(y*mash1));
            end
            else
              x:=x+0.00001;
          end;
        end
        else
        begin
          MoveTo(x0+Trunc(x*mash),y0-Trunc(y*mash));
          while x < x2 do
          begin
            if not(x=1) then //провер€ю на одз
            begin
              x := x + 0.001;
              y := 2 * x * cos(1/(x-1));
              LineTo(x0+Trunc(x*mash),y0-Trunc(y*mash));
            end
            else
              x:=x+0.00001;
          end
        end;
      end;
    end;
  end;
end;

end.
