unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
  function plus(s1,s2:string):boolean;
  function minus(s1,s2:string):boolean;
  function change(s1,s2:string):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  len1,len2:integer;

implementation

{$R *.dfm}
function TForm2.plus(s1,s2:string): Boolean;
var i,j,k:integer;
begin
  if length(s1)+1 = length(s2) then
  begin
    k:=0;
    j:=0;
    for i:=1 to length(s1) do
    begin
      j:=j+1;
        if pos(s1[i],s2)=0 then
        begin
          plus:=false;
          break;
        end
        else;
          if (not(s1[i]=s2[j])) then
          begin
            k:=k+1;
            j:=j+1;
            if k>1 then
              break;
          end
          else
          plus:=true;
    end;
    if k>1 then
      plus := false;
  end
  else
    plus:= false;
end;
function TForm2.minus(s1: string; s2: string): Boolean;
var i,j,k:integer;
begin
  if length(s1)-1 = length(s2) then
  begin
    k:=0;
    j:=0;
    for i:=1 to length(s2) do
    begin
      j:=j+1;
      if pos(s2[i],s1)=0 then
      begin
        minus:=false;
        break;
      end
      else;
        if (not(s1[j]=s2[i])) then
        begin
          k:=k+1;
          j:=j+1;
          if k>1 then
            break;
        end
        else
          minus:=true;
    end;
    if k>1 then
      minus := false;
  end
  else
    minus:= false;
end;
function TForm2.change(s1: string; s2: string): Boolean;
var i,j,k:integer;
begin
  if (length(s1) = length(s2)) and (not(s1=s2)) then
  begin
    k:=0;
    for i:=1 to length(s1) do
    begin
      if (not(s1[i]=s2[i])) then
        k:=k+1;
    end;
    if not(k>1) then
      change:=true
    else
      change:=false;
  end
  else
    change:=false;
end;

procedure TForm2.Button1Click(Sender: TObject);
var txt1, txt2, answer:string;
i:integer;
begin
  txt1 := (edit1.Text);
  txt2:= (edit2.Text);
  if radiogroup1.itemindex = -1 then
  label2.caption := '�������� �������';
    if radiogroup1.itemindex = 0 then
      if plus(txt1,txt2)=true then
        label2.Caption := '��, �����'
      else
        label2.Caption := '���, ������';
    if radiogroup1.itemindex = 1 then
      if minus(txt1,txt2)=true then
        label2.Caption := '��, �����'
      else
        label2.Caption := '���, ������';
    if radiogroup1.itemindex = 2 then
      if change(txt1,txt2)=true then
        label2.Caption := '��, �����'
      else
        label2.Caption := '���, ������';
end;

end.
