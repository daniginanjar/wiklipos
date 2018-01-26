unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, sSkinManager, shellapi;

type
  TfLogin = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button2: TButton;
    sSkinManager1: TsSkinManager;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Label10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses udm, uMain;

{$R *.dfm}

procedure TfLogin.Button1Click(Sender: TObject);
begin
if edit1.Text='' then
  begin
    ShowMessage('Username belum diisi');
    edit1.SelectAll;
  end
else if edit2.Text='' then
  begin
    ShowMessage('Password belum diisi');
    edit1.SelectAll;
  end
else
  begin
    dm.vUsers.Close;
    dm.vUsers.SQL.Clear;
    dm.vUsers.SQL.Add('select*from vUsers where username ='+quotedstr(edit1.Text));
    dm.vUsers.SQL.Add('and password='+quotedstr(edit2.Text));
    dm.vUsers.Open;

    if (dm.vUsers.RecordCount = 1) and (dm.vUsers.Locate('username',uppercase(edit1.Text),[])) and (dm.vUsers.Locate('password',edit2.Text,[]))then
      begin
        fMain.Label10.Caption:=dm.vUsers.FieldValues['username'];
        fMain.Label11.Caption:=inttostr(dm.vUsers.FieldValues['user_id']);
        fMain.Label12.Caption:=inttostr(dm.vUsers.FieldValues['employee_id']);
        fMain.Label13.Caption:=dm.vUsers.FieldValues['employee_name']+' ('+dm.vUsers.FieldValues['division']+')';
        fMain.show;
        fLogin.Hide;
        fMain.AlarmsToday1.Click;
      end
    else
      begin
        ShowMessage('User tidak terdaftar, silahkan periksa akun anda kembali!');
      end;

  end;
end;

procedure TfLogin.Button2Click(Sender: TObject);
var
employee_id:integer;
begin
if edit3.Text='' then
  begin
    ShowMessage('Employee ID belum diisi!');
    edit3.SelectAll;
    edit3.SetFocus;
  end
else if (edit3.Text<>'') and (edit4.Text='') then
  begin
    ShowMessage('Username belum diisi!');
    edit4.SelectAll;
    edit4.SetFocus;
  end
else if (edit3.Text<>'') and (edit4.Text<>'') and (edit5.Text='') then
  begin
    ShowMessage('Password belum diisi!');
    edit5.SelectAll;
    edit5.SetFocus;
  end
else
  begin
    dm.employee.Close;
    dm.employee.SQL.Clear;
    dm.employee.SQL.Add('select*from vEmployee where employee_code = '+quotedstr(edit3.Text));
    dm.employee.SQL.Add('and division_id=23');
    dm.employee.Open;

    if dm.employee.RecordCount=0 then
      begin
        ShowMessage('ID anda tidak terdaftar sebagai IT');
      end
    else if dm.employee.RecordCount<>0 then
      begin
        employee_id:=dm.employee.FieldValues['employee_id'];
        dm.user.Close;
        dm.user.SQL.Clear;
        dm.user.SQL.Add('select*from vUsers where employee_id='+inttostr(employee_id));
        dm.user.Open;

        if dm.user.RecordCount<>0 then
          begin
            showmessage('ID anda sudah terdaftar!');
          end
        else
          begin
            {dm.user.SQL.Clear;
            dm.user.SQL.Add('INSERT INTO users (username, password, employee_id)');
            dm.user.SQL.Add('VALUES (:username, :password, :employee_id)');
            dm.user.Parameters[0].Value := edit4.text;
            dm.user.Parameters[1].value := edit5.text;
            dm.user.Parameters[2].value := employee_id;
            dm.user.ExecSQL; }

            dm.user.SQL.Clear;
            dm.user.SQL.Add('select*from users');
            dm.user.Open;

            dm.user.Append;
            dm.user.FieldValues['username']:=edit4.Text;
            dm.user.FieldValues['password']:=edit5.Text;
            dm.user.FieldValues['employee_id']:=employee_id;
            dm.user.Post;


            showmessage('Registrasi Berhasil, silahkan login!');
            panel1.Hide;
            label6.Caption:='Register';

            dm.user.SQL.Clear;
            dm.user.SQL.Add('select*from users');
            dm.user.Open;
          end;
      end
    end;
end;

procedure TfLogin.Label6Click(Sender: TObject);
begin
if label6.Caption = 'Register' then
  begin
    panel1.Show;
    label6.Caption:='Cancel';
  end
else if label6.Caption = 'Cancel' then
  begin
    panel1.Hide;
    label6.Caption:='Register';
  end;

end;

procedure TfLogin.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfLogin.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfLogin.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfLogin.Label10Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'WikliposManualHelp.chm', nil, nil, SW_SHOWNORMAL) ;
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
dm.skin.Close;
dm.skin.Open;

if dm.skin.RecordCount<>0 then
  begin
    fLogin.sSkinManager1.SkinName:=dm.skin.FieldValues['skin_name'];
    fLogin.sSkinManager1.SkinDirectory:=dm.skin.FieldValues['skin_url'];
  end;

end;

end.

