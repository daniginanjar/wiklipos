unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, acPNG, comobj, DB, ADODB,
  sSkinProvider, ExcelXP, shellapi, ExtDlgs;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    System1: TMenuItem;
    Exit1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Label11: TLabel;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Label12: TLabel;
    Delete1: TMenuItem;
    Panel5: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel6: TPanel;
    Label14: TLabel;
    Label13: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    DateTimePicker2: TDateTimePicker;
    Label15: TLabel;
    DateTimePicker3: TDateTimePicker;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button5: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox5: TCheckBox;
    Button9: TButton;
    N1: TMenuItem;
    Button10: TButton;
    Label20: TLabel;
    Edit9: TEdit;
    Label21: TLabel;
    Panel7: TPanel;
    Button4: TButton;
    CheckBox6: TCheckBox;
    Edit10: TEdit;
    UpdateStatus1: TMenuItem;
    ListBox1: TListBox;
    Monitoring1: TMenuItem;
    sSkinProvider1: TsSkinProvider;
    WeeklyReport1: TMenuItem;
    Reuse1: TMenuItem;
    Master1: TMenuItem;
    Employee1: TMenuItem;
    Division1: TMenuItem;
    Help1: TMenuItem;
    ManualHelp1: TMenuItem;
    About1: TMenuItem;
    ChangeSkin1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Alarms1: TMenuItem;
    AlarmsToday1: TMenuItem;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    ListBox2: TListBox;
    Panel10: TPanel;
    N2: TMenuItem;
    SetAlarm1: TMenuItem;
    Panel11: TPanel;
    Button11: TButton;
    Splitter1: TSplitter;
    Database1: TMenuItem;
    Backup1: TMenuItem;
    Restore1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Button9Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Button10Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure UpdateStatus1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox6Click(Sender: TObject);
    procedure Monitoring1Click(Sender: TObject);
    procedure WeeklyReport1Click(Sender: TObject);
    procedure Reuse1Click(Sender: TObject);
    procedure Employee1Click(Sender: TObject);
    procedure Division1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ManualHelp1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeSkin1Click(Sender: TObject);
    procedure Alarms1Click(Sender: TObject);
    procedure AlarmsToday1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure SetAlarm1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  XlApp, XlBook, XlSheet: Variant;


implementation

uses udm, uPopUp, uMonitoring, uWeeklyReport, uEmployee, uDivision, uAbout,
  uLogin, uAlarms;

{$R *.dfm}



function BulanIni(bln:TDateTime):string;
var
myYear, myMonth, myDay : Word;
begin
DecodeDate(bln, myYear, myMonth, myDay);

case myMonth of
1 : Result := 'January';
2 : Result := 'February';
3 : Result := 'March';
4 : Result := 'April';
5 : Result := 'May';
6 : Result := 'June';
7 : Result := 'July';
8 : Result := 'August';
9 : Result := 'September';
10: Result := 'October';
11 : Result := 'November';
12 : Result := 'December';

end;
end;

function HariIni(tgl:TDateTime):string;
begin
case DayOfWeek(Tgl) of
1 : Result := 'Sunday';
2 : Result := 'Monday';
3 : Result := 'Tuesday';
4 : Result := 'Wednesday';
5 : Result := 'Thursday';
6 : Result := 'Friday';
7 : Result := 'Saturday';
end;
end;

Function ExportToExcel(oDataSet : TDataSet; sFile : String ; dari: TDateTime; sampai: TDateTime): Boolean;
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
oSheet.Cells.Item[3,1] := 'PROGRESS REPORT PERIOD :';
oSheet.Cells.Item[3,2] := formatdatetime('dd-mm-yyy',dari)+' Until '+formatdatetime('dd-mm-yyy',sampai);

oSheet.Cells.Item[5,1] := 'DATE';
oSheet.Cells.Item[5,2] := 'CASE TITLE';
oSheet.Cells.Item[5,3] := 'SYMPTOMS';
oSheet.Cells.Item[5,4] := 'DIAGNOSIS';
oSheet.Cells.Item[5,5] := 'ACTIONS';
oSheet.Cells.Item[5,6] := 'TASK MASTER';
oSheet.Cells.Item[5,7] := 'TASK MASTER CODE';
oSheet.Cells.Item[5,8] := 'TASK MASTER DIVISION';
oSheet.Cells.Item[5,9] := 'DIVISION CODE';
oSheet.Cells.Item[5,10] := 'EXECUTOR';
oSheet.Cells.Item[5,11] := 'DIVISION';
oSheet.Cells.Item[5,12] := 'EXECUTOR CODE';

for i:=2 to oDataset.RecordCount+1 do
  begin
    oSheet.Cells.Item[i+4,1] := formatdatetime('dd-mm-yyyy',oDataSet.FieldValues['report_date']);
    oSheet.Cells.Item[i+4,2] := oDataSet.FieldValues['title'];
    oSheet.Cells.Item[i+4,3] := oDataSet.FieldValues['symptoms'];
    oSheet.Cells.Item[i+4,4] := oDataSet.FieldValues['diagnosis'];
    oSheet.Cells.Item[i+4,5] := oDataSet.FieldValues['actions'];
    oSheet.Cells.Item[i+4,6] := oDataSet.FieldValues['taskmaster_name'];
    oSheet.Cells.Item[i+4,7] := oDataSet.FieldValues['employee.employee_code'];
    oSheet.Cells.Item[i+4,8] := oDataSet.FieldValues['taskmaster_division'];
    oSheet.Cells.Item[i+4,9] := oDataSet.FieldValues['division_code'];
    oSheet.Cells.Item[i+4,10] := oDataSet.FieldValues['employee_name'];
    oSheet.Cells.Item[i+4,11] := oDataSet.FieldValues['division'];
    oSheet.Cells.Item[i+4,12] := oDataSet.FieldValues['employee_1.employee_code'];
    oDataSet.Next;
  end;

//Change the wprksheet name.
oSheet.Name := 'Progress Report';

//Change the font properties of all columns.
oSheet.Columns.Font.Color := clPurple;
oSheet.Columns.Font.FontStyle := fsBold;
oSheet.Columns.Font.Size := 10;

//Change the font properties of a row.
oSheet.Range['A5','L5'].Font.Color := clWhite;
oSheet.Range['A5','L5'].Interior.Color := clGray;
oSheet.Range['A5','L5'].Font.Size := 12;
oSheet.Range['A5','L5'].Font.FontStyle := fsBold;
oSheet.Range['A5','L5'].Borders.Color:= clBlack;
oSheet.Range['A5','L5'].Font.Name := 'Arabic Transparent';

batas:='L'+inttostr(oDataset.RecordCount+5);

oSheet.Range['A6',batas].Interior.Color := $00CCFFCC;
oSheet.Range['A6',batas].Borders.Color:= clBlack;
oSheet.Range['A6',batas].Font.Size := 10;
oSheet.Range['A6',batas].Font.Color:= clBlack;
oSheet.Range['A6',batas].Font.Name := 'Arabic Transparent';

{oSheet.Range['C6','C'+inttostr(oDataset.RecordCount+5)].HorizontalAlignment:= -4108;
oSheet.Range['C6','C'+inttostr(oDataset.RecordCount+5)].VerticalAlignment:= -4108;

oSheet.Range['D6',batas].Merge(EmptyParam);
oSheet.Cells.Item[6,4] := '"5/5';
oSheet.Range['D6','D6'].HorizontalAlignment := -4108;
oSheet.Range['D6','D6'].VerticalAlignment := -4108;
}
oSheet.Columns.AutoFit;
{DeleteFile(sFile);

Sleep(2000);

oSheet.SaveAs(sFile);
{oSheet.ConnectTo(oWorkbook.Worksheets[1] as _Worksheet);
oExcel.DisplayAlerts[0]:=false;
oSheet.Delete(0);}

end;

procedure TfMain.Button1Click(Sender: TObject);
begin
if button1.Caption='New' then
  begin
    button1.Caption:='Save';
    panel2.Visible:=true;
    datetimepicker1.DateTime:=now;
    edit1.Clear;
    edit2.Clear;
    edit3.Clear;
    edit4.Clear;
    edit5.Clear;
    edit9.Clear;
    label7.Caption:='TASK MASTER NAME';
    label8.Caption:='0';
    button2.Enabled:=true;
    edit9.SetFocus;
  end
else if button1.Caption='Save' then
  begin
    if edit9.Text='' then
      begin
        ShowMessage('Case Title is Mandatory!');
        edit9.SetFocus;
      end
    else if edit3.Text='' then
      begin
        ShowMessage('Actions is Mandatory!');
        edit3.SetFocus;
      end
    else if edit4.Text='' then
      begin
        ShowMessage('Task Master is Mandatory!');
        edit4.SetFocus;
      end
    else
      begin
        dm.vEmployee.Close;
        dm.vEmployee.SQL.Clear;
        dm.vEmployee.SQL.Add('select*from vEmployee where employee_code = '+quotedstr(edit4.Text));
        dm.vEmployee.Active:=true;

        if (edit4.Text<>'') and (dm.vEmployee.RecordCount<>0) then
          begin
            label7.Caption:=dm.vEmployee.FieldValues['employee_name'];
            label8.Caption:=inttostr(dm.vEmployee.FieldValues['employee_id']);
            edit5.Text:=dm.vEmployee.FieldValues['division'];

            button1.Caption:='New';

            button2.Enabled:=false;
            dm.reports.Close;
            dm.reports.SQL.Clear;
            dm.reports.SQL.Add('insert into reports (report_date, symptoms, diagnosis, actions, taskmaster_id,executor_id, title)');
            dm.reports.SQL.Add('values (:report_date, :symptoms, :diagnosis, :actions, :taskmaster_id, :executor_id, :title)');
            dm.reports.Parameters.ParamByName('report_date').Value:=datetimepicker1.DateTime;
            dm.reports.Parameters.ParamByName('symptoms').Value:=edit1.Text;
            dm.reports.Parameters.ParamByName('diagnosis').Value:=edit2.Text;
            dm.reports.Parameters.ParamByName('actions').Value:=edit3.Text;
            dm.reports.Parameters.ParamByName('taskmaster_id').Value:=label8.Caption;
            dm.reports.Parameters.ParamByName('executor_id').Value:=label12.Caption;
            dm.reports.Parameters.ParamByName('title').Value:=edit9.Text;

            dm.reports.ExecSQL;
            refresh1.Click;
            ShowMessage('Data berhasil disave!');
            refresh1.Click;
            fMonitoring.SpeedButton1.Click;
          end
        else if (edit4.Text='') then
          begin
            ShowMessage('Task Master Empty!');
            edit4.SetFocus;
          end;
      end;
  end;
end;

procedure TfMain.FormShow(Sender: TObject);

begin
datetimepicker1.DateTime:=now;
refresh1.Click;


end;

procedure TfMain.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dm.vEmployee.Close;
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee where employee_code = '+quotedstr(edit4.Text));
    dm.vEmployee.Active:=true;

    if dm.vEmployee.RecordCount<>0 then
      begin
        label7.Caption:=dm.vEmployee.FieldValues['employee_name'];
        label8.Caption:=inttostr(dm.vEmployee.FieldValues['employee_id']);
        edit5.Text:=dm.vEmployee.FieldValues['division'];
      end;
  end;

if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;  
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
button1.Caption:='New';
panel2.Visible:=false;
button2.Enabled:=false;
end;



procedure TfMain.Refresh1Click(Sender: TObject);
begin
if button1.Caption = 'Save' then
  begin
    button1.Caption:='New';
    button2.Click;
    button1.Click;
  end;
  
datetimepicker2.DateTime:=now;
datetimepicker3.DateTime:=now;
edit6.Clear;
label17.Caption:='TASK MASTER NAME';
edit7.Clear;
label18.Caption:='DIVISION';
edit8.Clear;
label19.Caption:='EXECUTOR';
checkbox1.Checked:=false;
checkbox2.Checked:=false;
checkbox3.Checked:=false;
checkbox4.Checked:=false; 

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

{dm.vReports.Close;
dm.vReports.SQL.Clear;
dm.vReports.SQL.Add('select*from vReports where executor_id = '+label12.Caption);
dm.vReports.Active:=true;}

dm.vReports.Close;
dm.vReports.SQL.Clear;
dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(now)+'# and #'+datetostr(now+1)+'#');
dm.vReports.SQL.Add('and executor_id = '+label12.Caption);
dm.vReports.SQL.Add('ORDER BY report_date');

dm.vReports.Open;

updatestatus1.Click;
end;

procedure TfMain.Delete1Click(Sender: TObject);
begin
if dm.vReports.RecordCount<>0 then
  begin
    if MessageDlg('Yakin tetap Dihapus?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
        dm.reports.Close;
        dm.reports.SQL.Clear;
        dm.reports.SQL.Add('delete from reports where reports_id = '+inttostr(dm.vReports.FieldValues['reports_id']));
        dm.reports.ExecSQL;
        refresh1.Click;
        fMonitoring.Button4.Click;
      end;
  end;
end;

procedure TfMain.Button3Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP TASK MASTER';
fPopUp.Refresh1.Click;
end;

procedure TfMain.Button4Click(Sender: TObject);
begin
if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=false)  then
  begin
    refresh1.Click;

    updatestatus1.Click;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        refresh1.Click;
        //datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=true) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where (report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(') and employee.employee_code ='+quotedstr(edit6.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=true) and (checkbox3.Checked=true) and (checkbox4.Checked=false) and (checkbox6.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add('and employee.employee_code ='+quotedstr(edit6.Text));
        dm.vReports.SQL.Add('and division_code ='+quotedstr(edit7.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=true) and (checkbox3.Checked=true) and (checkbox4.Checked=true) and (checkbox6.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add('and employee.employee_code ='+quotedstr(edit6.Text));
        dm.vReports.SQL.Add('and division_code ='+quotedstr(edit7.Text));
        dm.vReports.SQL.Add('and employee_1.employee.code ='+quotedstr(edit8.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=true) and (checkbox4.Checked=false) and (checkbox6.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add('and division_code ='+quotedstr(edit7.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=true) and (checkbox4.Checked=false) and (checkbox6.Checked=false) then
  begin
    dm.vReports.Close;
    dm.vReports.SQL.Clear;
    dm.vReports.SQL.Add('select*from vReports where ');
    dm.vReports.SQL.Add('division_code ='+quotedstr(edit7.Text));
    dm.vReports.SQL.Add('ORDER BY report_date');
    dm.vReports.Open;
  end
else if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=true) and (checkbox6.Checked=false) then
  begin
    dm.vReports.Close;
    dm.vReports.SQL.Clear;
    dm.vReports.SQL.Add('select*from vReports where ');
    dm.vReports.SQL.Add('employee_1.employee_code ='+quotedstr(edit8.Text));
    dm.vReports.SQL.Add('ORDER BY report_date');
    dm.vReports.Open;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=true) and (checkbox6.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(' and employee_1.employee_code ='+quotedstr(edit8.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where (report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(') and (title like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or symptoms like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or diagnosis like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or actions like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' )');
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=true) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where (report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(') and (title like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or symptoms like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or diagnosis like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or actions like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(') and employee.employee_code ='+quotedstr(edit6.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=true) and (checkbox4.Checked=false) and (checkbox6.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where (report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(') and (title like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or symptoms like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or diagnosis like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or actions like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(') and division_code ='+quotedstr(edit7.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox2.Checked=false) and (checkbox3.Checked=true) and (checkbox4.Checked=true) and (checkbox6.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vReports.Close;
        dm.vReports.SQL.Clear;
        dm.vReports.SQL.Add('select*from vReports where (report_date BETWEEN #'+datetostr(datetimepicker2.Date)+'# and #'+datetostr(datetimepicker3.Date+1)+'#');
        dm.vReports.SQL.Add(') and (title like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or symptoms like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or diagnosis like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(' or actions like'+quotedstr('%'+edit10.Text+'%'));
        dm.vReports.SQL.Add(') and (division_code ='+quotedstr(edit7.Text));
        dm.vReports.SQL.Add(') and employee_1.employee.code ='+quotedstr(edit8.Text));
        dm.vReports.SQL.Add('ORDER BY report_date');
        dm.vReports.Open;
      end;
  end
else if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=true) then
  begin
    dm.vReports.Close;
    dm.vReports.SQL.Clear;
    dm.vReports.SQL.Add('select*from vReports where title like'+quotedstr('%'+edit10.Text+'%'));
    dm.vReports.SQL.Add(' or symptoms like'+quotedstr('%'+edit10.Text+'%'));
    dm.vReports.SQL.Add(' or diagnosis like'+quotedstr('%'+edit10.Text+'%'));
    dm.vReports.SQL.Add(' or actions like'+quotedstr('%'+edit10.Text+'%'));
    dm.vReports.SQL.Add('ORDER BY report_date');
    dm.vReports.Open;
  end;

updatestatus1.Click;

end;

procedure TfMain.Button5Click(Sender: TObject);
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

procedure TfMain.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dm.vEmployee.Close;
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee where employee_code = '+quotedstr(edit6.Text));
    dm.vEmployee.Active:=true;

    if dm.vEmployee.RecordCount<>0 then
      begin
        label17.Caption:=dm.vEmployee.FieldValues['employee_name'];
      end
    else
      begin
        label17.Caption:='-';
        showmessage('CODE NOT FOUND!');
      end;
  end;

if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;  
end;

procedure TfMain.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dm.vEmployee.Close;
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee where division_code = '+quotedstr(edit7.Text));
    dm.vEmployee.Active:=true;

    if dm.vEmployee.RecordCount<>0 then
      begin
        label18.Caption:=inttostr(dm.vEmployee.FieldValues['division']);
      end
    else
      begin
        label18.Caption:='-';
        showmessage('CODE NOT FOUND!');
      end;
  end;

if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;  
end;

procedure TfMain.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    dm.vEmployee.Close;
    dm.vEmployee.SQL.Clear;
    dm.vEmployee.SQL.Add('select*from vEmployee where employee_code = '+quotedstr(edit8.Text));
    dm.vEmployee.Active:=true;

    if dm.vEmployee.RecordCount<>0 then
      begin
        label19.Caption:=dm.vEmployee.FieldValues['employee_name'];
      end
    else
      begin
        label19.Caption:='-';
        showmessage('CODE NOT FOUND!');
      end;
  end;

if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;  
end;

procedure TfMain.Button9Click(Sender: TObject);
var
namafile:string;
begin
if dm.vReports.RecordCount<>0 then
  begin
    namafile:=(application.ExeName)+ '\ProgressReport_'+formatdatetime('dd-mm-yyyy',datetimepicker2.Date)+'_to_'+formatdatetime('dd-mm-yyyy',datetimepicker3.Date)+'_'+formatdatetime('ss',now)+'.xlsx';
    ExportToExcel(dm.vReports,namafile, datetimepicker2.date, datetimepicker3.date);
  end
else
  begin
    ShowMessage('No data to Export!');
  end;
end;

procedure TfMain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfMain.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfMain.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfMain.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfMain.Button10Click(Sender: TObject);
begin
button9.Click;
end;

procedure TfMain.Button6Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP FILTER TASK MASTER';
fPopUp.Refresh1.Click;
end;

procedure TfMain.CheckBox2Click(Sender: TObject);
begin
if checkbox2.Checked=true then
  begin
    checkbox3.Checked:=true;
    edit6.Enabled:=true;
    button6.Enabled:=true;
    edit6.SetFocus;
  end
else if checkbox2.Checked=false then
  begin
    checkbox3.Checked:=false;
    edit6.Enabled:=false;
    button6.Enabled:=false;
  end
end;

procedure TfMain.Button7Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP FILTER TASK MASTER DIVISION';
fPopUp.Refresh1.Click;
end;

procedure TfMain.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked=true then
  begin
    datetimepicker2.Enabled:=true;
    datetimepicker3.Enabled:=true;
    datetimepicker2.SetFocus;
  end
else if checkbox1.Checked=false then
  begin
    datetimepicker2.Enabled:=false;
    datetimepicker3.Enabled:=false;
  end
end;

procedure TfMain.CheckBox3Click(Sender: TObject);
begin
if checkbox3.Checked=true then
  begin
    edit7.Enabled:=true;
    button7.Enabled:=true;
    edit7.SetFocus;
  end
else if checkbox3.Checked=false then
  begin
    edit7.Enabled:=false;
    button7.Enabled:=false;
  end
end;

procedure TfMain.CheckBox4Click(Sender: TObject);
begin
if checkbox4.Checked=true then
  begin
    edit8.Enabled:=true;
    button8.Enabled:=true;
    edit8.SetFocus;
  end
else if checkbox4.Checked=false then
  begin
    edit8.Enabled:=false;
    button8.Enabled:=false;
  end
end;

procedure TfMain.Button8Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP FILTER EXECUTOR';
fPopUp.Refresh1.Click;
end;

procedure TfMain.UpdateStatus1Click(Sender: TObject);
begin
//update status bar
if dm.vReports.RecordCount>1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vReports.RecordCount) +' Rows ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vReports.RecNo) +' Selected');
  end
else if dm.vReports.RecordCount=1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vReports.RecordCount) +' Row ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vReports.RecNo) +' Selected');
  end
else if dm.vReports.RecordCount=0 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('No Data');
  end
end;

procedure TfMain.DBGrid1CellClick(Column: TColumn);
begin
updatestatus1.Click;
end;

procedure TfMain.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfMain.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfMain.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    button4.Click;
  end
else if Key = ^A then
  begin
    (Sender as TEdit).SelectAll;
    Key := #0;
  end;
end;

procedure TfMain.CheckBox6Click(Sender: TObject);
begin
if checkbox6.Checked=true then
  begin
    edit10.Enabled:=true;
    edit10.SetFocus;
  end
else if checkbox6.Checked=false then
  begin
    edit10.Enabled:=false;
  end
end;

procedure TfMain.Monitoring1Click(Sender: TObject);
begin
dm.reports.SQL.Clear;
dm.reports.SQL.Add('select*from reports');
dm.reports.Open;

if dm.reports.RecordCount<>0 then
  begin
    fMonitoring.Show;
    fMonitoring.SpeedButton1.Click;
  end
else
  begin
    Showmessage('You are not starting any activities yet!');
  end;
end;

procedure TfMain.WeeklyReport1Click(Sender: TObject);
begin
fWeeklyReport.Show;
end;

procedure TfMain.Reuse1Click(Sender: TObject);
begin
NullStrictConvert := false; 
button1.Click;
edit9.Text:=dm.vReports.FieldValues['title'];
edit1.Text:=dm.vReports.FieldValues['symptoms'];
edit2.Text:=dm.vReports.FieldValues['diagnosis'];
edit3.Text:=dm.vReports.FieldValues['actions'];
edit4.Text:=dm.vReports.FieldValues['employee.employee_code'];
label7.Caption:=dm.vReports.FieldValues['taskmaster_name'];
edit5.Text:=dm.vReports.FieldValues['taskmaster_division'];
label8.Caption:=dm.vReports.FieldValues['employee.division_id'];
end;

procedure TfMain.Employee1Click(Sender: TObject);
begin
fEmployee.show;
end;

procedure TfMain.Division1Click(Sender: TObject);
begin
fDivision.Show;
end;

procedure TfMain.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfMain.ManualHelp1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'WikliposManualHelp.chm', nil, nil, SW_SHOWNORMAL) ;
end;

procedure TfMain.About1Click(Sender: TObject);
begin
fAbout.showmodal
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
Screen.MenuFont.Name := 'Ubuntu Mono';
end;

procedure TfMain.ChangeSkin1Click(Sender: TObject);
begin
opendialog1.InitialDir:=dm.skin.FieldValues['skin_url'];
if opendialog1.Execute then
  begin
    dm.skin.Edit;
    dm.skin.FieldValues['skin_name']:=extractfilename(opendialog1.FileName);
    dm.skin.FieldValues['skin_url']:=extractfilepath(opendialog1.FileName);
    dm.skin.Post;
    fLogin.sSkinManager1.SkinName:=dm.skin.FieldValues['skin_name'];
  end
end;

procedure TfMain.Alarms1Click(Sender: TObject);
begin
fAlarms.show;
end;

procedure TfMain.AlarmsToday1Click(Sender: TObject);
var
bulan,hari:string;
i:integer;
begin
listbox2.Clear;
hari:=HariIni(now);
bulan:=BulanIni(now);



dm.vAlarms.SQL.Clear;
dm.vAlarms.SQL.Add('select*from vAlarms where (user_id='+fMain.Label11.Caption+') and (start_date > '+formatdatetime('dd-MM-yyy', now)+')');
dm.vAlarms.SQL.Add('and (('+hari+' = true and daily = true)');
dm.vAlarms.SQL.Add('or (monthly = true and monthly_date = '+quotedstr(formatdatetime('d',now))+')');
dm.vAlarms.SQL.Add('or (yearly = true and yearly_date = '+quotedstr(formatdatetime('d',now))+' and yearly_month = '+quotedstr(bulan)+')');
dm.vAlarms.SQL.Add('or (selected_day = true and '+hari+' = true)');
dm.vAlarms.SQL.Add('or (selected_date = true and dates BETWEEN #'+datetostr(now)+'# and #'+datetostr(now+1)+'#))');
dm.vAlarms.Open;

if dm.vAlarms.RecordCount<>0 then
  begin
    panel9.Show;
    for i:=1 to dm.vAlarms.RecordCount do
      begin
        listbox2.Items.Add(dm.vAlarms.FieldValues['alarm_title']);
        dm.vAlarms.Next;
      end
  end
else if dm.vAlarms.RecordCount=0 then
  begin
    panel9.Hide;
  end;
end;

procedure TfMain.Button11Click(Sender: TObject);
begin
panel9.Hide;
end;

procedure TfMain.SetAlarm1Click(Sender: TObject);
begin
if dm.vReports.RecordCount<>0 then
  begin
    fAlarms.Show;
    fAlarms.Button1.Click;
    fAlarms.Edit9.Text:=dm.vReports.FieldValues['title'];
  end;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if MessageBox(Handle, 'Keluar dari aplikasi ? ','Konfirmasi',MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    application.Terminate;
  end
else
  begin
    Action:=caNone;
  end;
end;

procedure TfMain.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TfMain.Backup1Click(Sender: TObject);
var
path: string;
begin
if SaveDialog1.Execute then
  if SaveDialog1.FileName <>'' then
    begin
      path:= ExtractFilePath(application.ExeName);
      try
        copyfile(pchar(path + 'wiklipos.mdb'), pchar(SaveDialog1.FileName + '.mdb'), false);
        ShowMessage('backup was successful!');
      except
        ShowMessage('backup failed, please retry!');
    end;
end;


end;

procedure TfMain.Restore1Click(Sender: TObject);
var
path: string;
begin
OpenDialog1.Filter := 'Wiklipos DB (*.mdb)|*.MDB';
if OpenDialog1.Execute then
  begin
    if (OpenDialog1.FileName <>'') and (extractfilename(opendialog1.FileName)='wiklipos.mdb') then
      begin
        path:= ExtractFilePath(application.ExeName);
        try
          dm.data.Connected:= false;
          DeleteFile(path + 'wiklipos.mdb');
          CopyFile(PChar(opendialog1.FileName), PChar(path+'wiklipos.mdb'), true);

          if FileExists(extractfilepath(application.ExeName)+'wiklipos.mdb') then
            begin
              try
                dm.data.ConnectionString:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source=wiklipos.mdb;'
                +'Jet OLEDB:Database Password=admin$@*^@;';
                dm.data.Connected:=true;

                dm.user.Open;
                dm.reports.Open;
                dm.employee.Open;
                dm.division.Open;
                dm.vreports.Open;
                dm.vemployee.Open;
                dm.popup.Open;
                dm.vDivRanking.Open;
                dm.vProblemRanking.Open;
                dm.vPerformance.Open;
                dm.vTotalPerformance.Open;
                dm.vProblemChart.Open;
                dm.vWeeklyReport.Open;
                dm.skin.Open;
                dm.alarms.Open;
                dm.valarms.Open;
                Showmessage('Database Recovery Successfull!');
              except
                Showmessage('Invalid Database!');
                dm.data.Connected:=false;
                //application.Terminate;
              end;
            end
          else
            begin
              ShowMessage('Database doesnt Exist!');
              //application.Terminate;
            end;
        except
          ShowMessage('Recovery failed, please try again!');
        end;
      end
  end;
end;

end.
