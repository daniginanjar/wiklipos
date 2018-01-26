unit uEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, acPNG, ExtCtrls, sSkinProvider, Menus, DB, ADODB, ComCtrls, ExcelXP;

type
  TfEmployee = class(TForm)
    Panel6: TPanel;
    Label14: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button10: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button3: TButton;
    CheckBox5: TCheckBox;
    Edit9: TEdit;
    Panel4: TPanel;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    sSkinProvider1: TsSkinProvider;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Delete1: TMenuItem;
    Button4: TButton;
    ListBox1: TListBox;
    N1: TMenuItem;
    UpdateStatus1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Delete1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure UpdateStatus1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmployee: TfEmployee;

implementation

uses udm, uPopUp;

{$R *.dfm}

Function ExportToExcel(oDataSet : TDataSet; sFile : String): Boolean;
var
i : Integer;
batas:string;
oExcel : TExcelApplication;
oWorkbook : TExcelWorkbook;
oSheet : TExcelWorksheet;

begin
result := True;

oExcel := TExcelApplication.Create(Application);
oWorkbook := TExcelWorkbook.Create(Application);
oSheet := TExcelWorksheet.Create(Application);

try
  oExcel.Visible[0] := False;
  oExcel.Connect;
except
  result := False;
  MessageDlg('Excel may not be installed', mtError, [mbOk], 0);
  exit;
end;

oExcel.Visible[oExcel.Workbooks.Count+1] := True;
oExcel.Caption := 'Wiklipos V.1';
oExcel.Workbooks.Add(null,0);

oWorkbook.ConnectTo(oExcel.Workbooks[oExcel.Workbooks.Count]);
oSheet.ConnectTo(oWorkbook.Worksheets[1] as _Worksheet);

//export to excel
oDataSet.Open;
oDataset.First;
oSheet.Cells.Item[1,1] := 'PT. PANTOS LOGISTICS INDONESIA';
oSheet.Cells.Item[2,1] := 'IT DEPTARTEMENT';
oSheet.Cells.Item[3,1] := 'EMPLOYEE LIST :';

oSheet.Cells.Item[5,1] := 'NO';
oSheet.Cells.Item[5,2] := 'EPMLOYEE CODE';
oSheet.Cells.Item[5,3] := 'EMPLOYEE NAME';
oSheet.Cells.Item[5,4] := 'DIVISION CODE';
oSheet.Cells.Item[5,5] := 'DIVISION';

for i:=2 to oDataset.RecordCount+1 do
  begin
    oSheet.Cells.Item[i+4,1] := inttostr(i-1);
    oSheet.Cells.Item[i+4,2] := oDataSet.FieldValues['employee_code'];
    oSheet.Cells.Item[i+4,3] := oDataSet.FieldValues['employee_name'];
    oSheet.Cells.Item[i+4,4] := oDataSet.FieldValues['division_code'];
    oSheet.Cells.Item[i+4,5] := oDataSet.FieldValues['division'];
    oDataSet.Next;
  end;

//Change the wprksheet name.
oSheet.Name := 'Employee List';

//Change the font properties of all columns.
oSheet.Columns.Font.Color := clPurple;
oSheet.Columns.Font.FontStyle := fsBold;
oSheet.Columns.Font.Size := 10;

//Change the font properties of a row.
oSheet.Range['A5','E5'].Font.Color := clWhite;
oSheet.Range['A5','E5'].Interior.Color := clGray;
oSheet.Range['A5','E5'].Font.Size := 12;
oSheet.Range['A5','E5'].Font.FontStyle := fsBold;
oSheet.Range['A5','E5'].Borders.Color:= clBlack;
oSheet.Range['A5','E5'].Font.Name := 'Arabic Transparent';

batas:='E'+inttostr(oDataset.RecordCount+5);

oSheet.Range['A6',batas].Interior.Color := $00CCFFCC;
oSheet.Range['A6',batas].Borders.Color:= clBlack;
oSheet.Range['A6',batas].Font.Size := 10;
oSheet.Range['A6',batas].Font.Color:= clBlack;
oSheet.Range['A6',batas].Font.Name := 'Arabic Transparent';

oSheet.Columns.AutoFit;
{DeleteFile(sFile);

Sleep(2000);
oSheet.SaveAs(sFile);

{oSheet.ConnectTo(oWorkbook.Worksheets[1] as _Worksheet);
oExcel.DisplayAlerts[0]:=false;

oSheet.Delete(0);}
end;

procedure TfEmployee.Button1Click(Sender: TObject);
begin
if button1.Caption='New' then
  begin
    button1.Caption:='Save';
    button2.Enabled:=true;
    panel2.Visible:=true;
  end
else if button1.Caption='Save' then
  begin
  if edit9.Text='' then
    begin
      ShowMessage('Employee Code is Mandatory!');
      edit9.SetFocus;
    end
  else if edit1.Text='' then
    begin
      ShowMessage('Employee Name is Mandatory!');
      edit1.SetFocus;
    end
  else if edit4.Text='' then
    begin
      ShowMessage('Division is Mandatory!');
      edit4.SetFocus;
    end
  else
    begin
      dm.division.SQL.Clear;
      dm.division.SQL.Add('select*from division where division_code='+quotedstr(edit4.Text));
      dm.division.Open;

      if dm.division.RecordCount<>0 then
        begin
          button1.Caption:='New';
      button2.Enabled:=false;
      panel2.Visible:=false;

      dm.employee.SQL.Clear;
      dm.employee.SQL.Add('select*from employee where employee_code='+quotedstr(edit9.Text));
      dm.employee.Open;

      if dm.employee.RecordCount=0 then
        begin
          {dm.employee.Append;
          dm.employee.FieldValues['employee_code']:= edit9.Text;
          dm.employee.FieldValues['employee_name']:= edit1.Text;
          dm.employee.FieldValues['division_id']:= strtoint(label8.Caption);
          dm.employee.Post;}

          dm.employee.Close;
          dm.employee.SQL.Clear;
          dm.employee.SQL.Add('insert into employee (employee_code, employee_name, division_id)');
          dm.employee.SQL.Add('values (:employee_code, :employee_name, :division_id)');
          dm.employee.Parameters.ParamByName('employee_code').Value:=edit9.Text;
          dm.employee.Parameters.ParamByName('employee_name').Value:=edit1.Text;
          dm.employee.Parameters.ParamByName('division_id').Value:=label8.Caption;
          dm.employee.ExecSQL;
          refresh1.Click;
          ShowMessage('Saved Successfully');
          refresh1.Click;
        end
      else
        begin
          ShowMessage('This Employee Code ('+dm.employee.FieldValues['employee_code']+') Already Registered!');
        end;
      end
    else
      begin
        Showmessage('Division Code invalid, please check again!');
      end;
    end;
  end;
end;

procedure TfEmployee.Button2Click(Sender: TObject);
begin
button1.Caption:='New';
panel2.Visible:=false;
button2.Enabled:=false;
end;

procedure TfEmployee.Button5Click(Sender: TObject);
begin
if button5.Caption='Filter' then
  begin
    button5.Caption:='Hide Filter';
    panel4.Show;
  end
else if button5.Caption='Hide Filter' then
  begin
    button5.Caption:='Filter';
    panel4.hide;
  end
end;

procedure TfEmployee.Button3Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP EMPLOYEE DIVISION';
fPopUp.Refresh1.Click;
end;

procedure TfEmployee.Refresh1Click(Sender: TObject);
begin
if button1.Caption = 'Save' then
  begin
    button1.Caption:='New';
    button2.Click;
    button1.Click;
  end;

edit9.Clear;
edit1.Clear;
edit4.Clear;
edit5.Clear;
edit10.Clear;
if checkbox5.Checked=true then
  begin
    panel2.Visible:=true;
    button1.Caption:='Save';
    button2.Enabled:=true;
  end
else if checkbox5.Checked=false then
  begin
    panel2.Visible:=false;
    button1.Caption:='New';
    button2.Enabled:=false;
    button1.SetFocus;
  end;

dm.vEmployee.Close;
dm.vEmployee.SQL.Clear;
dm.vEmployee.SQL.Add('select*from vEmployee');
dm.vEmployee.Open;

updatestatus1.Click;
end;

procedure TfEmployee.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfEmployee.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;

if ( key in['0'..'9', #8, #13]) then
    key:= #0 ;
end;

procedure TfEmployee.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;

if Key = #13 then
  begin
    dm.division.Close;
    dm.division.SQL.Clear;
    dm.division.SQL.Add('select*from division where division_code = '+quotedstr(edit4.Text));
    dm.division.Active:=true;

    if dm.division.RecordCount<>0 then
      begin
        //label7.Caption:=dm.division.FieldValues['employee_name'];
        label8.Caption:=inttostr(dm.division.FieldValues['division_id']);
        edit5.Text:=dm.division.FieldValues['division'];
      end;
  end;
end;

procedure TfEmployee.Delete1Click(Sender: TObject);
begin
if dm.vEmployee.RecordCount<>0 then
  begin
    if MessageDlg('Yakin tetap Dihapus?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
        dm.employee.Close;
        dm.employee.SQL.Clear;
        dm.employee.SQL.Add('delete from employee where employee_id = '+inttostr(dm.vEmployee.FieldValues['employee_id']));
        dm.employee.ExecSQL;
        refresh1.Click;
      end;
  end;
end;

procedure TfEmployee.Button4Click(Sender: TObject);
begin
if edit10.Text<>'' then
  begin
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee');
    dm.vEmployee.SQL.Add('where');
    dm.vEmployee.SQL.Add('employee_code like '+quotedstr('%'+edit10.Text+'%'));
    dm.vEmployee.SQL.Add('or employee_name like '+quotedstr('%'+edit10.Text+'%'));
    dm.vEmployee.SQL.Add('or division like '+quotedstr('%'+edit10.Text+'%'));
    dm.vEmployee.SQL.Add('or division_code like '+quotedstr('%'+edit10.Text+'%'));
    dm.vEmployee.Open;
    edit10.SelectAll;
    edit10.SetFocus;
    updatestatus1.Click;
  end
else
  begin
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee');
    dm.vEmployee.Open;
    edit10.SelectAll;
    edit10.SetFocus;
    updatestatus1.Click;
  end;

if dm.vEmployee.RecordCount=0 then
  begin
    ShowMessage('No data found!');
  end;
end;

procedure TfEmployee.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
  begin
    button4.Click;
  end
end;

procedure TfEmployee.FormShow(Sender: TObject);
begin
refresh1.Click;
end;

procedure TfEmployee.Button10Click(Sender: TObject);
var
namafile:string;
begin
if dm.vEmployee.RecordCount<>0 then
  begin
    namafile:=(application.ExeName)+ '\EmployeeList'+formatdatetime('ss',now)+'.xlsx';
    ExportToExcel(dm.vEmployee,namafile);
  end
else
  begin
    ShowMessage('No data to Export!');
  end
end;

procedure TfEmployee.UpdateStatus1Click(Sender: TObject);
begin
//update status bar
if dm.vEmployee.RecordCount>1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vEmployee.RecordCount) +' Rows ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vEmployee.RecNo) +' Selected');
  end
else if dm.vEmployee.RecordCount=1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vEmployee.RecordCount) +' Row ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vEmployee.RecNo) +' Selected');
  end
else if dm.vEmployee.RecordCount=0 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('No Data');
  end
end;

procedure TfEmployee.DBGrid1CellClick(Column: TColumn);
begin
updatestatus1.Click;
end;

procedure TfEmployee.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfEmployee.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfEmployee.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vDbGrid: TDBGrid absolute Sender;
begin
  // only do the next line if this event generated for
  // the first columnn (column with index 0)
  if DataCol=0 then
    vDbGrid.Canvas.TextOut(Rect.Left + 2
                           , Rect.Top + 2
                           , IntToStr(vDbGrid.DataSource.DataSet.RecNo));

end;

end.
