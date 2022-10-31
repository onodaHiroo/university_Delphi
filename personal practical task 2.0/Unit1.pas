unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Label6: TLabel;
    Label7: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  verdict: string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Combobox1.Clear;
  if Edit1.Text= '' then
  Label2.Caption := 'Вы не указали автора и название композиции.'
  else
  begin
    Label1.Caption := 'Выберите жанр';
    Combobox1.Items.Add('Рок');
    Combobox1.Items.Add('Реп');
    Combobox1.Items.Add('Танцевальная');
    Label2.Caption := '';
    Label4.Caption := '';
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if Combobox1.Itemindex = -1 then
    Label2.Caption := 'Вы не указали жанр.'
  else
  begin
    Label1.Caption := 'Выберите жанр';
    Combobox1.Items.Add('Рок');
    Combobox1.Items.Add('Реп');
    Combobox1.Items.Add('Танцевальная');
    Label2.Caption := '';

    if Combobox1.Itemindex = 0 then
    begin
      Listbox1.Items.Add(Edit1.Text);
      Label2.Caption := 'Добавлено'
    end;
    if Combobox1.Itemindex = 1 then
    begin
      Listbox2.Items.Add(Edit1.Text);
      Label2.Caption := 'Добавлено'
    end;
    if Combobox1.Itemindex = 2 then
    begin
      Listbox3.Items.Add(Edit1.Text);
      Label2.Caption := 'Добавлено'
    end;
    Combobox1.Clear;
    Label4.Caption := 'Введите название и автора композиции';
    Label1.Caption := '';
    Edit1.Text := '';
  end;
end;

end.
