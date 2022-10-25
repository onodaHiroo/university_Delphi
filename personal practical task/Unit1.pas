unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ListBox1: TListBox;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  procentFalse,procentTrue: integer;
  verdict: string;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  Combobox1.Clear;
  if Edit1.Text= '' then
  Label2.Caption := '������� �������'
  else
  begin
    Label1.Caption := '������ �� �� ������?';
    Combobox1.Items.Add('��');
    Combobox1.Items.Add('���');
    Label2.Caption := '';
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if Combobox1.Itemindex = -1 then
    Label2.Caption := '�������, ������ �� �� ������'
  else
    begin
    if Combobox1.Itemindex = 0 then
    begin
      verdict:='������';
      Listbox1.Items.Add(Edit1.Text + ' - ' + verdict);
      procentTrue := procentTrue + 1;
      Label2.Caption := '�������';
    end;
    if Combobox1.Itemindex = 1 then
    begin
      verdict:='�� ������';
      Listbox1.Items.Add(Edit1.Text + ' - ' + verdict);
      procentFalse :=  procentFalse + 1;
      Label2.Caption := '����, ���� ������';
    end;
    Label1.Caption := '';
    Edit1.Text := '';
  end;
  Label3.Caption := ('�������� ' + FloatToStrF((procentTrue/(procentTrue+procentFalse))*100,ffgeneral,3,2) + '%');
end;


end.
