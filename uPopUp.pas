unit uPopUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Menus;

type
  TfPopUp = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Select1: TMenuItem;
    procedure Refresh1Click(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPopUp: TfPopUp;

implementation

uses udm, uMain, uWeeklyReport, uEmployee;

{$R *.dfm}

procedure TfPopUp.Refresh1Click(Sender: TObject);
begin
if (label1.Caption='POP UP TASK MASTER') or (label1.Caption='POP UP FILTER TASK MASTER') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from vEmployee');
    dm.popup.Open;
  end
else if (label1.Caption='POP UP FILTER TASK MASTER DIVISION') OR (label1.Caption='POP UP EMPLOYEE DIVISION') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from division');
    dm.popup.Open;
  end
else if (label1.Caption='POP UP FILTER EXECUTOR') OR (label1.Caption='POP UP FILTER WEEKLY EXECUTOR') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from vEmployee where division_code="IT"');
    dm.popup.Open;
  end
end;

procedure TfPopUp.Select1Click(Sender: TObject);
begin
if (label1.Caption='POP UP TASK MASTER') then
  begin
    fMain.Edit4.Text:=dm.popup.FieldValues['employee_code'];
    fMain.Label7.Caption:=dm.popup.FieldValues['employee_name'];
    fMain.Edit5.Text:=dm.popup.FieldValues['division'];
    fMain.Label8.Caption:=inttostr(dm.popup.FieldValues['employee_id']);
    close;
  end
else if (label1.Caption='POP UP FILTER TASK MASTER') then
  begin
    fMain.Edit6.Text:=dm.popup.FieldValues['employee_code'];
    fMain.Label17.Caption:=dm.popup.FieldValues['employee_name'];
    fMain.Edit7.Text:=dm.popup.FieldValues['division_code'];
    fMain.Label18.Caption:=(dm.popup.FieldValues['division']);
    close;
  end
else if (label1.Caption='POP UP FILTER TASK MASTER DIVISION') then
  begin
    fMain.Edit6.Clear;
    fMain.Label17.Caption:='';
    fMain.Edit7.Text:=dm.popup.FieldValues['division_code'];
    fMain.Label18.Caption:=(dm.popup.FieldValues['division']);
    fMain.CheckBox2.Checked:=false;
    fMain.Edit6.Enabled:=false;
    fMain.Edit6.Enabled:=false;
    fMain.label17.Caption:='';
    close;
  end
else if (label1.Caption='POP UP FILTER EXECUTOR') then
  begin
    fMain.Edit8.Text:=dm.popup.FieldValues['employee_code'];
    fMain.Label19.Caption:=dm.popup.FieldValues['employee_name'];
    close;
  end
else if (label1.Caption='POP UP FILTER WEEKLY EXECUTOR') then
  begin
    fWeeklyReport.Edit8.Text:=dm.popup.FieldValues['employee_code'];
    fWeeklyReport.Label19.Caption:=dm.popup.FieldValues['employee_name'];
    close;
  end
else if (label1.Caption='POP UP EMPLOYEE DIVISION') then
  begin
    fEmployee.Edit4.Text:=dm.popup.FieldValues['division_code'];
    fEmployee.edit5.text:=(dm.popup.FieldValues['division']);
    fEmployee.label8.caption:=inttostr(dm.popup.FieldValues['division_id']);
    close;
  end
end;

procedure TfPopUp.DBGrid1DblClick(Sender: TObject);
begin
select1.Click;
end;

procedure TfPopUp.Button1Click(Sender: TObject);
begin
if (label1.Caption='POP UP TASK MASTER') or (label1.Caption='POP UP FILTER TASK MASTER') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from vEmployee');
    dm.popup.SQL.Add('where');
    dm.popup.SQL.Add('employee_code like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or employee_name like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or division like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or division_code like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.Open;
    edit1.SetFocus;
    edit1.SelectAll;
  end
else if (label1.Caption='POP UP FILTER TASK MASTER DIVISION') or (label1.Caption='POP UP EMPLOYEE DIVISION') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from division');
    dm.popup.SQL.Add('where');
    dm.popup.SQL.Add('division like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or division_code like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.Open;
    edit1.SetFocus;
    edit1.SelectAll;
  end
else if (label1.Caption='POP UP FILTER EXECUTOR') or (label1.Caption='POP UP FILTER WEEKLY EXECUTOR') then
  begin
    dm.popup.Close;
    dm.popup.SQL.Clear;
    dm.popup.SQL.Add('select*from vEmployee');
    dm.popup.SQL.Add('where division_code="IT" and (');
    dm.popup.SQL.Add('employee_code like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or employee_name like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or division like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add('or division_code like '+quotedstr('%'+edit1.Text+'%'));
    dm.popup.SQL.Add(')');

    dm.popup.Open;
    edit1.SetFocus;
    edit1.SelectAll;
  end
end;

procedure TfPopUp.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;

if Key = #13 then
  begin
    dbgrid1.SetFocus;
  end;
end;

procedure TfPopUp.FormShow(Sender: TObject);
begin
edit1.SetFocus;
end;

end.
