unit uDivision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, sSkinProvider, Grids, DBGrids, StdCtrls, acPNG, ExtCtrls, ExcelXP, DB;

type
  TfDivision = class(TForm)
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
    Label20: TLabel;
    Edit1: TEdit;
    Edit9: TEdit;
    Panel4: TPanel;
    Edit10: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    sSkinProvider1: TsSkinProvider;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Delete1: TMenuItem;
    CheckBox5: TCheckBox;
    ListBox1: TListBox;
    N1: TMenuItem;
    UpdateStatus1: TMenuItem;
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
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
  fDivision: TfDivision;

implementation

uses udm;

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
oSheet.Cells.Item[3,1] := 'DIVISION LIST :';

oSheet.Cells.Item[5,1] := 'NO';
oSheet.Cells.Item[5,2] := 'DIVISION CODE';
oSheet.Cells.Item[5,3] := 'DIVISION';

for i:=2 to oDataset.RecordCount+1 do
  begin
    oSheet.Cells.Item[i+4,1] := inttostr(i-1);
    oSheet.Cells.Item[i+4,2] := oDataSet.FieldValues['division_code'];
    oSheet.Cells.Item[i+4,3] := oDataSet.FieldValues['division'];
    oDataSet.Next;
  end;

//Change the wprksheet name.
oSheet.Name := 'Division List';

//Change the font properties of all columns.
oSheet.Columns.Font.Color := clPurple;
oSheet.Columns.Font.FontStyle := fsBold;
oSheet.Columns.Font.Size := 10;

//Change the font properties of a row.
oSheet.Range['A5','C5'].Font.Color := clWhite;
oSheet.Range['A5','C5'].Interior.Color := clGray;
oSheet.Range['A5','C5'].Font.Size := 12;
oSheet.Range['A5','C5'].Font.FontStyle := fsBold;
oSheet.Range['A5','C5'].Borders.Color:= clBlack;
oSheet.Range['A5','C5'].Font.Name := 'Arabic Transparent';

batas:='C'+inttostr(oDataset.RecordCount+5);

oSheet.Range['A6',batas].Interior.Color := $00CCFFCC;
oSheet.Range['A6',batas].Borders.Color:= clBlack;
oSheet.Range['A6',batas].Font.Size := 10;
oSheet.Range['A6',batas].Font.Color:= clBlack;
oSheet.Range['A6',batas].Font.Name := 'Arabic Transparent';

oSheet.Columns.AutoFit;
{DeleteFile(sFile);

Sleep(2000);
oSheet.SaveAs(sFile);

//oSheet.ConnectTo(oWorkbook.Worksheets[oExcel.Workbooks.Count] as _Worksheet);
//oExcel.DisplayAlerts[0]:=false;

//oSheet.Delete(0);}
end;

procedure TfDivision.Button5Click(Sender: TObject);
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

procedure TfDivision.Button2Click(Sender: TObject);
begin
button1.Caption:='New';
panel2.Visible:=false;
button2.Enabled:=false;
end;

procedure TfDivision.Button1Click(Sender: TObject);
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
      ShowMessage('Division Code is Mandatory!');
      edit9.SetFocus;
    end
  else if edit1.Text='' then
    begin
      ShowMessage('Division Name is Mandatory!');
      edit1.SetFocus;
    end
  else
    begin

    button1.Caption:='New';
    button2.Enabled:=false;
    panel2.Visible:=false;

    dm.division.SQL.Clear;
    dm.division.SQL.Add('select*from division where division_code='+quotedstr(edit9.Text));
    dm.division.Open;

    if dm.division.RecordCount=0 then
      begin
        dm.division.Close;
        dm.division.SQL.Clear;
        dm.division.SQL.Add('insert into division (division_code, division)');
        dm.division.SQL.Add('values (:division_code, :division)');
        dm.division.Parameters.ParamByName('division_code').Value:=edit9.Text;
        dm.division.Parameters.ParamByName('division').Value:=edit1.Text;
        dm.division.ExecSQL;
        refresh1.Click;
        ShowMessage('Saved Successfully');
        refresh1.Click;
      end
    else
      begin
        ShowMessage('This Division Code ('+dm.division.FieldValues['division_code']+') Already Registered!');
      end;
    end;
  end;
end;

procedure TfDivision.Delete1Click(Sender: TObject);
var
division_id:integer;
begin
if dm.division.RecordCount<>0 then
  begin
    if MessageDlg('Yakin tetap Dihapus?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
        division_id:=dm.division.FieldValues['division_id'];
        dm.division.Close;
        dm.division.SQL.Clear;
        dm.division.SQL.Add('delete from division where division_id = '+inttostr(division_id));
        dm.division.ExecSQL;
        refresh1.Click;
      end;
  end;

end;

procedure TfDivision.Refresh1Click(Sender: TObject);
begin
if button1.Caption = 'Save' then
  begin
    button1.Caption:='New';
    button2.Click;
    button1.Click;
  end;

edit9.Clear;
edit1.Clear;
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

dm.division.Close;
dm.division.SQL.Clear;
dm.division.SQL.Add('select*from division');
dm.division.Open;

updatestatus1.Click;
end;

procedure TfDivision.Button4Click(Sender: TObject);
begin
if edit10.Text<>'' then
  begin
    dm.division.SQL.Clear;
    dm.division.SQL.Add('select*from division');
    dm.division.SQL.Add('where');
    dm.division.SQL.Add('division_code like '+quotedstr('%'+edit10.Text+'%'));
    dm.division.SQL.Add('or division like '+quotedstr('%'+edit10.Text+'%'));
    dm.division.Open;
    edit10.SelectAll;
    edit10.SetFocus;
    updatestatus1.Click;
  end
else
  begin
    dm.division.SQL.Clear;
    dm.division.SQL.Add('select*from division');
    dm.division.Open;
    edit10.SelectAll;
    edit10.SetFocus;
    updatestatus1.Click;
  end;

if dm.division.RecordCount=0 then
  begin
    ShowMessage('No data found!');
  end;

end;

procedure TfDivision.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
  begin
    button4.Click;
  end
end;

procedure TfDivision.FormShow(Sender: TObject);
begin
refresh1.Click;
end;

procedure TfDivision.Button10Click(Sender: TObject);
var
namafile:string;
begin
if dm.division.RecordCount<>0 then
  begin
    namafile:=(application.ExeName)+ '\DivisionList'+formatdatetime('ss',now)+'.xlsx';
    ExportToExcel(dm.division,namafile);
  end
else
  begin
    ShowMessage('No data to Export!');
  end;

end;

procedure TfDivision.UpdateStatus1Click(Sender: TObject);
begin
//update status bar
if dm.division.RecordCount>1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.division.RecordCount) +' Rows ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.division.RecNo) +' Selected');
  end
else if dm.division.RecordCount=1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.division.RecordCount) +' Row ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.division.RecNo) +' Selected');
  end
else if dm.division.RecordCount=0 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('No Data');
  end
end;

procedure TfDivision.DBGrid1CellClick(Column: TColumn);
begin
updatestatus1.Click;
end;

procedure TfDivision.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfDivision.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfDivision.DBGrid1DrawColumnCell(Sender: TObject;
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
