unit uMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Buttons, StdCtrls, TeEngine, Series,
  TeeProcs, Chart, DbChart, sSkinProvider;

type
  TfMonitoring = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label14: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Panel11: TPanel;
    Panel12: TPanel;
    Label4: TLabel;
    DBGrid4: TDBGrid;
    ListBox3: TListBox;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel9: TPanel;
    Panel17: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label3: TLabel;
    DBGrid3: TDBGrid;
    ListBox4: TListBox;
    Button2: TButton;
    Panel8: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    ListBox2: TListBox;
    Button3: TButton;
    Chart1: TChart;
    Series1: TPieSeries;
    sSkinProvider1: TsSkinProvider;
    Button4: TButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMonitoring: TfMonitoring;

implementation

uses udm;

{$R *.dfm}

procedure TfMonitoring.SpeedButton1Click(Sender: TObject);
begin
dm.vDivRanking.Close;
dm.vDivRanking.Open;

dm.vUserRanking.Close;
dm.vUserRanking.Open;

dm.vProblemRanking.Close;
dm.vProblemRanking.Open;

dm.vPerformance.Close;
dm.vPerformance.Open;

dm.vTotalPerformance.Close;
dm.vTotalPerformance.Open;

dm.vProblemChart.Close;
dm.vProblemChart.Open;

button1.Click;
end;

procedure TfMonitoring.DBGrid1CellClick(Column: TColumn);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid2CellClick(Column: TColumn);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid4CellClick(Column: TColumn);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.DBGrid4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.Click;
end;

procedure TfMonitoring.Button1Click(Sender: TObject);
begin
if dm.vDivRanking.RecordCount<>0 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total : '+inttostr(dm.vDivRanking.RecordCount)+' Divisi');
    listbox1.Items.Add('Row No : '+inttostr(dm.vDivRanking.RecNo)+' Selected');
  end;

if dm.vUserRanking.RecordCount<>0 then
  begin
    listbox2.Clear;
    listbox2.Items.Add('Total : '+inttostr(dm.vUserRanking.RecordCount)+' User');
    listbox2.Items.Add('Row No : '+inttostr(dm.vUserRanking.RecNo)+' Selected');
  end;

if dm.vProblemRanking.RecordCount<>0 then
  begin
    listbox3.Clear;
    listbox3.Items.Add('Total : '+inttostr(dm.vProblemRanking.RecordCount)+' Problem');
    listbox3.Items.Add('Row No : '+inttostr(dm.vProblemRanking.RecNo)+' Selected');
  end;

if dm.vPerformance.RecordCount<>0 then
  begin
    listbox4.Clear;
    listbox4.Items.Add('Tahun : '+floattostr(dm.vPerformance.FieldValues['TAHUN'])+' Sekitar '+ inttostr(dm.vTotalPerformance.FieldValues['PERFORMANCE'])+' Kasus Berhasil diselesaikan');
  end;

button3.Click;
end;

procedure TfMonitoring.Button3Click(Sender: TObject);
var
i:integer;
begin
Chart1.Title.Text.Clear;
chart1.Title.Text.Add('- MONITORING KASUS -');
chart1.Title.Text.Add('IT DEPT. PT. PANTOS LOGISTICS INDONESIA');
dm.vProblemChart.open;

chart1.Series[0].Clear;

if dm.vProblemChart.RecordCount<>0 then
  begin
    dm.vProblemChart.First;
    for i:=1 to dm.vProblemChart.RecordCount do
      begin
       chart1.Series[0].Add(strtofloat(dm.vProblemChart.FieldValues['jumlah_kasus']),dm.vProblemChart.FieldValues['title']);
       dm.vProblemChart.Next;
      end;
  end;
end;

procedure TfMonitoring.Button4Click(Sender: TObject);
begin
speedbutton1.Click;
end;

procedure TfMonitoring.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfMonitoring.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfMonitoring.DBGrid4DrawColumnCell(Sender: TObject;
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

procedure TfMonitoring.DBGrid3DrawColumnCell(Sender: TObject;
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
