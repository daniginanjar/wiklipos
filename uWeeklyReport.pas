unit uWeeklyReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, acPNG, ExtCtrls, Grids, DBGrids, Menus, ExcelXP, DB;

type
  TfWeeklyReport = class(TForm)
    Panel6: TPanel;
    Label14: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    Label15: TLabel;
    Label19: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Edit8: TEdit;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Label1: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Refresh1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWeeklyReport: TfWeeklyReport;

implementation

uses udm, uPopUp;

{$R *.dfm}

Function ExportToExcel(oDataSet : TDataSet; sFile : String ; dari: TDateTime; sampai: TDateTime; harikerja: String): Boolean;
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
oSheet.Cells.Item[3,1] := 'WEEKLY REPORT PERIOD :';
oSheet.Cells.Item[3,2] := formatdatetime('dd-mm-yyy',dari)+' Until '+formatdatetime('dd-mm-yyy',sampai);

oSheet.Cells.Item[5,1] := 'PIC';
oSheet.Cells.Item[5,2] := 'WORKING RESULT';
oSheet.Cells.Item[5,3] := 'PENDING ISSUE';
oSheet.Cells.Item[5,4] := 'ATTENDANCE';

for i:=2 to oDataset.RecordCount+1 do
  begin
    oSheet.Cells.Item[i+4,1] := oDataSet.FieldValues['employee_name'];
    oSheet.Cells.Item[i+4,2] := oDataSet.FieldValues['title'];
    oSheet.Cells.Item[i+4,3] := 'DONE';
    //oSheet.Cells.Item[i+4,4] := oDataSet.FieldValues['TANGGAL'];
    oDataSet.Next;
  end;

//Change the wprksheet name.
oSheet.Name := 'Weekly Report';

//Change the font properties of all columns.
oSheet.Columns.Font.Color := clPurple;
oSheet.Columns.Font.FontStyle := fsBold;
oSheet.Columns.Font.Size := 10;

//Change the font properties of a row.
oSheet.Range['A5','D5'].Font.Color := clWhite;
oSheet.Range['A5','D5'].Interior.Color := clGray;
oSheet.Range['A5','D5'].Font.Size := 12;
oSheet.Range['A5','D5'].Font.FontStyle := fsBold;
oSheet.Range['A5','D5'].Borders.Color:= clBlack;
oSheet.Range['A5','D5'].Font.Name := 'Arabic Transparent';

batas:='D'+inttostr(oDataset.RecordCount+5);

oSheet.Range['A6',batas].Interior.Color := $00CCFFCC;
oSheet.Range['A6',batas].Borders.Color:= clBlack;
oSheet.Range['A6',batas].Font.Size := 10;
oSheet.Range['A6',batas].Font.Color:= clBlack;
//oSheet.Range['A5',batas].EntireRow.Font.FontStyle := fsBold;
oSheet.Range['A6',batas].Font.Name := 'Arabic Transparent';

oSheet.Range['C6','C'+inttostr(oDataset.RecordCount+5)].HorizontalAlignment:= -4108;
oSheet.Range['C6','C'+inttostr(oDataset.RecordCount+5)].VerticalAlignment:= -4108;

oSheet.Range['D6',batas].Merge(EmptyParam);
oSheet.Cells.Item[6,4] := '"'+harikerja+'/5';
oSheet.Range['D6','D6'].HorizontalAlignment := -4108;
oSheet.Range['D6','D6'].VerticalAlignment := -4108;



//oSheet.Range['A1','D5'].Borders.Color:= clBlack;

//Change the font properties of a row.
{oSheet.Range['A2','A2'].EntireRow.Font.Color := clBlue;
oSheet.Range['A2','A2'].EntireRow.Font.Size := 12;
oSheet.Range['A2','A2'].EntireRow.Font.FontStyle := fsBold;
oSheet.Range['A2','A2'].EntireRow.Font.Name := 'Arabic Transparent';
oSheet.Range['A2','H2'].HorizontalAlignment := xlHAlignCenter;}

//Change the font properties of a column.
//oSheet.Range['A1','C1'].EntireColumn.Font.Color := clBlue;
//oSheet.Range['A2','D5'].EntireColumn.Borders.Color := clBlack;
//oSheet.Range['A2','D5'].EntireColumn.Borders.Weight := 10;


{
//Change Cells color of a row.
oSheet.Range['A1', 'A1'].EntireRow.Interior.Color := clNavy;

//hange Cells color of a column.
oSheet.Range['C1', 'C1'].EntireColumn.Interior.Color := clYellow;

//Align a column.
oSheet.Range['A1','A1'].HorizontalAlignment := xlHAlignLeft;

//Set a column with manually.
// oSheet.Columns.Range['A1','A1'].ColumnWidth := 16;
}
//Auto fit all columns.
oSheet.Columns.AutoFit;


{DeleteFile(sFile);

Sleep(2000);

oSheet.SaveAs(sFile);

{oSheet.ConnectTo(oWorkbook.Worksheets[1] as _Worksheet);

oExcel.DisplayAlerts[0]:=false;

oSheet.Delete(0);

{oSheet.Disconnect;
oSheet.Free;

oWorkbook.Disconnect;
oWorkbook.Free;

oExcel.Quit;
oExcel.Disconnect;
oExcel.Free;}
end;


procedure TfWeeklyReport.CheckBox1Click(Sender: TObject);
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

procedure TfWeeklyReport.CheckBox4Click(Sender: TObject);
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

procedure TfWeeklyReport.Button4Click(Sender: TObject);
begin
if (checkbox1.Checked=true) and (checkbox4.Checked=false) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        refresh1.Click;
        //datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vWeeklyReport.SQL.Clear;
        dm.vWeeklyReport.SQL.Add('select TANGGAL from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' GROUP BY TANGGAL');
        dm.vWeeklyReport.Open;

        label1.Caption:=inttostr(dm.vWeeklyReport.RecordCount);

        dm.vWeeklyReport.SQL.Clear;
        dm.vWeeklyReport.SQL.Add('select * from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' ');
        dm.vWeeklyReport.Open;
      end;
  end
else if (checkbox1.Checked=true) and (checkbox4.Checked=true) then
  begin
    if (datetimepicker2.DateTime > datetimepicker3.DateTime) then
      begin
        ShowMessage('Date Range is Confusing!');
        datetimepicker2.SetFocus;
      end
    else
      begin
        dm.vWeeklyReport.SQL.Clear;
        dm.vWeeklyReport.SQL.Add('select TANGGAL from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' GROUP BY TANGGAL');
        dm.vWeeklyReport.Open;

        label1.Caption:=inttostr(dm.vWeeklyReport.RecordCount);

        dm.vWeeklyReport.SQL.Clear;
        dm.vWeeklyReport.SQL.Add('select * from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' ');
        dm.vWeeklyReport.SQL.Add('and employee_code ='+quotedstr(edit8.Text));
        dm.vWeeklyReport.Open;
      end;
  end
else if (checkbox1.Checked=false) and (checkbox4.Checked=true) then
  begin
    dm.vWeeklyReport.SQL.Clear;
    dm.vWeeklyReport.SQL.Add('select TANGGAL from vWeeklyReport where ');
    dm.vWeeklyReport.SQL.Add('employee_code ='+quotedstr(edit8.Text));
    dm.vWeeklyReport.SQL.Add('GROUP BY TANGGAL');
    dm.vWeeklyReport.Open;

    label1.Caption:=inttostr(dm.vWeeklyReport.RecordCount);

    dm.vWeeklyReport.Close;
    dm.vWeeklyReport.SQL.Clear;
    dm.vWeeklyReport.SQL.Add('select*from vWeeklyReport where');
    dm.vWeeklyReport.SQL.Add('employee_code ='+quotedstr(edit8.Text));
    dm.vWeeklyReport.Open;
  end
else
  begin
    refresh1.Click;
  end
end;

procedure TfWeeklyReport.Button8Click(Sender: TObject);
begin
fPopUp.show;
fPopUp.Label1.Caption:='POP UP FILTER WEEKLY EXECUTOR';
fPopUp.Refresh1.Click;
end;

procedure TfWeeklyReport.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfWeeklyReport.Refresh1Click(Sender: TObject);
begin
datetimepicker2.DateTime:=now;
datetimepicker3.DateTime:=now;
edit8.Clear;
label19.Caption:='EXECUTOR';
checkbox1.Checked:=false;
checkbox4.Checked:=false;

dm.vWeeklyReport.SQL.Clear;
dm.vWeeklyReport.SQL.Add('select TANGGAL from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' GROUP BY TANGGAL');
dm.vWeeklyReport.Open;

label1.Caption:=inttostr(dm.vWeeklyReport.RecordCount);

dm.vWeeklyReport.SQL.Clear;
dm.vWeeklyReport.SQL.Add('select * from vWeeklyReport where TANGGAL between '''+ formatdatetime('dd-mm-yyyy',datetimepicker2.Date) +''' and '''+ formatdatetime('dd-mm-yyyy',datetimepicker3.Date+1) +''' ');
dm.vWeeklyReport.Open;
end;

procedure TfWeeklyReport.FormShow(Sender: TObject);
begin
refresh1.Click;
end;

procedure TfWeeklyReport.Button9Click(Sender: TObject);
var
harikerja,namafile:string;
begin
if dm.vWeeklyReport.RecordCount<>0 then
  begin
    harikerja:=label1.Caption;
    namafile:=(application.ExeName)+ '\WeeklyReport_'+formatdatetime('dd-mm-yyyy',datetimepicker2.Date)+'_to_'+formatdatetime('dd-mm-yyyy',datetimepicker3.Date)+'_'+formatdatetime('ss',now)+'.xlsx';
    ExportToExcel(dm.vWeeklyReport,namafile, datetimepicker2.date, datetimepicker3.date, harikerja);
  end
else
  begin
    ShowMessage('No data to Export!');
  end
end;

procedure TfWeeklyReport.DBGrid1DrawColumnCell(Sender: TObject;
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
