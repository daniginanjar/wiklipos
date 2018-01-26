unit uAlarms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Menus, sSkinProvider, Grids,
  DBGrids, acPNG, DBCtrls, Mask;

type
  TfAlarms = class(TForm)
    Panel6: TPanel;
    Label14: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button10: TButton;
    Panel2: TPanel;
    Label20: TLabel;
    Edit9: TEdit;
    CheckBox5: TCheckBox;
    Panel4: TPanel;
    Edit10: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    ListBox1: TListBox;
    sSkinProvider1: TsSkinProvider;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    UpdateStatus1: TMenuItem;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox4: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox3: TComboBox;
    DBCheckBox1: TDBCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure UpdateStatus1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button4Click(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  fAlarms: TfAlarms;

implementation

uses udm, uMain;

{$R *.dfm}



procedure TfAlarms.Button2Click(Sender: TObject);
begin
button1.Caption:='New';
panel2.Visible:=false;
button2.Enabled:=false;
end;

procedure TfAlarms.Button5Click(Sender: TObject);
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

procedure TfAlarms.Refresh1Click(Sender: TObject);
begin
if button1.Caption = 'Save' then
  begin
    button1.Caption:='New';
    button2.Click;
    button1.Click;
  end;

edit9.Clear;
edit10.Clear;
radiogroup1.ItemIndex:=-1;
checkbox1.Checked:=false;
checkbox2.Checked:=false;
checkbox3.Checked:=false;
checkbox4.Checked:=false;
checkbox6.Checked:=false;
checkbox7.Checked:=false;
checkbox8.Checked:=false;
combobox1.Text:='1';
combobox2.Text:='1';
combobox3.Text:='January';
datetimepicker1.Date:=now;
label1.Caption:='ALARM TYPE';


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

dm.vAlarms.Close;
dm.vAlarms.SQL.Clear;
dm.vAlarms.SQL.Add('select*from vAlarms where user_id='+fMain.Label11.Caption);
dm.vAlarms.Open;

updatestatus1.Click;

end;

procedure TfAlarms.UpdateStatus1Click(Sender: TObject);
begin
//update status bar
if dm.vAlarms.RecordCount>1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vAlarms.RecordCount) +' Rows ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vAlarms.RecNo) +' Selected');
  end
else if dm.vAlarms.RecordCount=1 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('Total: '+ inttostr(dm.vAlarms.RecordCount) +' Row ');
    listbox1.Items.Add('Row Number '+ inttostr(dm.vAlarms.RecNo) +' Selected');
  end
else if dm.vAlarms.RecordCount=0 then
  begin
    listbox1.Clear;
    listbox1.Items.Add('No Data');
  end
end;

procedure TfAlarms.Delete1Click(Sender: TObject);
begin
if dm.vAlarms.RecordCount<>0 then
  begin
    if MessageDlg('Yakin tetap Dihapus?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
        dm.alarms.Close;
        dm.alarms.SQL.Clear;
        dm.alarms.SQL.Add('delete from alarms where alarm_id = '+inttostr(dm.valarms.FieldValues['alarm_id']));
        dm.alarms.ExecSQL;
        fMain.AlarmsToday1.Click;
        refresh1.Click;
      end;
  end;

end;

procedure TfAlarms.Button1Click(Sender: TObject);
begin
if button1.Caption='New' then
  begin
    button1.Caption:='Save';
    button2.Enabled:=true;
    panel2.Visible:=true;
    label1.Caption:='ALARM TYPE';
    edit9.Clear;
    radiogroup1.ItemIndex:=-1;
  end
else if button1.Caption='Save' then
  begin
  if edit9.Text='' then
    begin
      ShowMessage('Alarm Title is Mandatory!');
      edit9.SetFocus;
    end
  else if radiogroup1.ItemIndex=-1 then
    begin
      ShowMessage('Alarm Type is Mandatory!');
      radiogroup1.SetFocus;
    end
  else
    begin
    if (radiogroup1.ItemIndex = 0) then
      begin
        if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=false) and (checkbox7.Checked=false) and (checkbox8.Checked=false) then
          begin
            ShowMessage('Daily Setting not Set Yet!');
          end
        else
          begin
                button1.Caption:='New';
                button2.Enabled:=false;
                panel2.Visible:=false;

                dm.alarms.SQL.Clear;
                dm.alarms.SQL.Add('insert into alarms (alarm_title, daily, monthly, monthly_date, yearly, yearly_date, yearly_month, selected_day, sunday, monday, tuesday, wednesday, thursday, friday, saturday, selected_date, dates, start_date, user_id)');
                dm.alarms.SQL.Add('values (:alarm_title, :daily, :monthly, :monthly_date, :yearly, :yearly_date, :yearly_month, :selected_day, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :selected_date, :dates, :start_date,:user_id)');
                dm.alarms.Parameters.ParamByName('alarm_title').Value:=edit9.Text;
                dm.alarms.Parameters.ParamByName('daily').Value:=true;
                dm.alarms.Parameters.ParamByName('monthly').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly').Value:=false;
                dm.alarms.Parameters.ParamByName('yearly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly_month').Value:='';
                dm.alarms.Parameters.ParamByName('selected_day').Value:=false;
                dm.alarms.Parameters.ParamByName('sunday').Value:=true;
                dm.alarms.Parameters.ParamByName('monday').Value:=true;
                dm.alarms.Parameters.ParamByName('tuesday').Value:=true;
                dm.alarms.Parameters.ParamByName('wednesday').Value:=true;
                dm.alarms.Parameters.ParamByName('thursday').Value:=true;
                dm.alarms.Parameters.ParamByName('friday').Value:=true;
                dm.alarms.Parameters.ParamByName('saturday').Value:=true;
                dm.alarms.Parameters.ParamByName('selected_date').Value:=false;
                dm.alarms.Parameters.ParamByName('dates').Value:=null;
                dm.alarms.Parameters.ParamByName('start_date').Value:=datetostr(now);
                dm.alarms.Parameters.ParamByName('user_id').Value:=fMain.Label11.Caption;

                dm.alarms.ExecSQL;
                refresh1.Click;
                ShowMessage('Saved Successfully');
                fMain.AlarmsToday1.Click;
                refresh1.Click;

          end;
      end
    else if radiogroup1.ItemIndex = 1 then
      begin
        if combobox1.Text<>'' then
          begin

                button1.Caption:='New';
                button2.Enabled:=false;
                panel2.Visible:=false;

                dm.alarms.SQL.Clear;
                dm.alarms.SQL.Add('insert into alarms (alarm_title, daily, monthly, monthly_date, yearly, yearly_date, yearly_month, selected_day, sunday, monday, tuesday, wednesday, thursday, friday, saturday, selected_date, dates, start_date, user_id)');
                dm.alarms.SQL.Add('values (:alarm_title, :daily, :monthly, :monthly_date, :yearly, :yearly_date, :yearly_month, :selected_day, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :selected_date, :dates, :start_date,:user_id)');
                dm.alarms.Parameters.ParamByName('alarm_title').Value:=edit9.Text;
                dm.alarms.Parameters.ParamByName('daily').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly').Value:=true;
                dm.alarms.Parameters.ParamByName('monthly_date').Value:=combobox1.Text;
                dm.alarms.Parameters.ParamByName('yearly').Value:=false;
                dm.alarms.Parameters.ParamByName('yearly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly_month').Value:='';
                dm.alarms.Parameters.ParamByName('selected_day').Value:=false;
                dm.alarms.Parameters.ParamByName('sunday').Value:=false;
                dm.alarms.Parameters.ParamByName('monday').Value:=false;
                dm.alarms.Parameters.ParamByName('tuesday').Value:=false;
                dm.alarms.Parameters.ParamByName('wednesday').Value:=false;
                dm.alarms.Parameters.ParamByName('thursday').Value:=false;
                dm.alarms.Parameters.ParamByName('friday').Value:=false;
                dm.alarms.Parameters.ParamByName('saturday').Value:=false;
                dm.alarms.Parameters.ParamByName('selected_date').Value:=false;
                dm.alarms.Parameters.ParamByName('dates').Value:=null;
                dm.alarms.Parameters.ParamByName('start_date').Value:=datetostr(now);
                dm.alarms.Parameters.ParamByName('user_id').Value:=fMain.Label11.Caption;


                dm.alarms.ExecSQL;
                refresh1.Click;
                ShowMessage('Saved Successfully');
                fMain.AlarmsToday1.Click;
                refresh1.Click;
          end
        else
          begin
            Showmessage('Monthly Setting not set yet!');
            combobox1.SetFocus;
          end;

      end
    else if radiogroup1.ItemIndex = 2 then
      begin
        if combobox2.Text='' then
          begin
            Showmessage('Yearly Day Setting not set yet!');
            combobox2.SetFocus;
          end
        else if combobox3.Text='' then
          begin
            Showmessage('Yearly Month Setting not set yet!');
            combobox2.SetFocus;
          end
        else
          begin
                button1.Caption:='New';
                button2.Enabled:=false;
                panel2.Visible:=false;

                dm.alarms.SQL.Clear;
                dm.alarms.SQL.Add('insert into alarms (alarm_title, daily, monthly, monthly_date, yearly, yearly_date, yearly_month, selected_day, sunday, monday, tuesday, wednesday, thursday, friday, saturday, selected_date, dates, start_date, user_id)');
                dm.alarms.SQL.Add('values (:alarm_title, :daily, :monthly, :monthly_date, :yearly, :yearly_date, :yearly_month, :selected_day, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :selected_date, :dates, :start_date,:user_id)');
                dm.alarms.Parameters.ParamByName('alarm_title').Value:=edit9.Text;
                dm.alarms.Parameters.ParamByName('daily').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly').Value:=true;
                dm.alarms.Parameters.ParamByName('yearly_date').Value:=combobox2.Text;
                dm.alarms.Parameters.ParamByName('yearly_month').Value:=combobox3.Text;
                dm.alarms.Parameters.ParamByName('selected_day').Value:=false;
                dm.alarms.Parameters.ParamByName('sunday').Value:=false;
                dm.alarms.Parameters.ParamByName('monday').Value:=false;
                dm.alarms.Parameters.ParamByName('tuesday').Value:=false;
                dm.alarms.Parameters.ParamByName('wednesday').Value:=false;
                dm.alarms.Parameters.ParamByName('thursday').Value:=false;
                dm.alarms.Parameters.ParamByName('friday').Value:=false;
                dm.alarms.Parameters.ParamByName('saturday').Value:=false;
                dm.alarms.Parameters.ParamByName('selected_date').Value:=false;
                dm.alarms.Parameters.ParamByName('dates').Value:=null;
                dm.alarms.Parameters.ParamByName('start_date').Value:=datetostr(now);
                dm.alarms.Parameters.ParamByName('user_id').Value:=fMain.Label11.Caption;

                dm.alarms.ExecSQL;
                refresh1.Click;
                ShowMessage('Saved Successfully');
                fMain.AlarmsToday1.Click;
                refresh1.Click;
          end;
      end
    else if radiogroup1.ItemIndex = 3 then
      begin
        if (checkbox1.Checked=false) and (checkbox2.Checked=false) and (checkbox3.Checked=false) and (checkbox4.Checked=false) and (checkbox6.Checked=false) and (checkbox7.Checked=false) and (checkbox8.Checked=false) then
          begin
            ShowMessage('Daily Setting not Set Yet!');
          end
        else
          begin
            if (checkbox1.Checked=true) or (checkbox2.Checked=true) or (checkbox3.Checked=true) or (checkbox4.Checked=true) or (checkbox6.Checked=true) or (checkbox7.Checked=true) or (checkbox8.Checked=true) then
              begin
                button1.Caption:='New';
                button2.Enabled:=false;
                panel2.Visible:=false;

                dm.alarms.SQL.Clear;
                dm.alarms.SQL.Add('insert into alarms (alarm_title, daily, monthly, monthly_date, yearly, yearly_date, yearly_month, selected_day, sunday, monday, tuesday, wednesday, thursday, friday, saturday, selected_date, dates, start_date, user_id)');
                dm.alarms.SQL.Add('values (:alarm_title, :daily, :monthly, :monthly_date, :yearly, :yearly_date, :yearly_month, :selected_day, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :selected_date, :dates, :start_date,:user_id)');
                dm.alarms.Parameters.ParamByName('alarm_title').Value:=edit9.Text;
                dm.alarms.Parameters.ParamByName('daily').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly').Value:=false;
                dm.alarms.Parameters.ParamByName('yearly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly_month').Value:='';
                dm.alarms.Parameters.ParamByName('selected_day').Value:=true;
                dm.alarms.Parameters.ParamByName('sunday').Value:=checkbox1.Checked;
                dm.alarms.Parameters.ParamByName('monday').Value:=checkbox2.Checked;
                dm.alarms.Parameters.ParamByName('tuesday').Value:=checkbox3.Checked;
                dm.alarms.Parameters.ParamByName('wednesday').Value:=checkbox4.Checked;
                dm.alarms.Parameters.ParamByName('thursday').Value:=checkbox6.Checked;
                dm.alarms.Parameters.ParamByName('friday').Value:=checkbox7.Checked;
                dm.alarms.Parameters.ParamByName('saturday').Value:=checkbox8.Checked;
                dm.alarms.Parameters.ParamByName('selected_date').Value:=false;
                dm.alarms.Parameters.ParamByName('dates').Value:=null;
                dm.alarms.Parameters.ParamByName('start_date').Value:=datetostr(now);
                dm.alarms.Parameters.ParamByName('user_id').Value:=fMain.Label11.Caption;

                dm.alarms.ExecSQL;
                refresh1.Click;
                ShowMessage('Saved Successfully');
                fMain.AlarmsToday1.Click;
                refresh1.Click;
              end
            
          end;
      end
    else if radiogroup1.ItemIndex = 4 then
      begin
                button1.Caption:='New';
                button2.Enabled:=false;
                panel2.Visible:=false;

                dm.alarms.SQL.Clear;
                dm.alarms.SQL.Add('insert into alarms (alarm_title, daily, monthly, monthly_date, yearly, yearly_date, yearly_month, selected_day, sunday, monday, tuesday, wednesday, thursday, friday, saturday, selected_date, dates, start_date, user_id)');
                dm.alarms.SQL.Add('values (:alarm_title, :daily, :monthly, :monthly_date, :yearly, :yearly_date, :yearly_month, :selected_day, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :selected_date, :dates, :start_date,:user_id)');
                dm.alarms.Parameters.ParamByName('alarm_title').Value:=edit9.Text;
                dm.alarms.Parameters.ParamByName('daily').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly').Value:=false;
                dm.alarms.Parameters.ParamByName('monthly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly').Value:=false;
                dm.alarms.Parameters.ParamByName('yearly_date').Value:='';
                dm.alarms.Parameters.ParamByName('yearly_month').Value:='';
                dm.alarms.Parameters.ParamByName('selected_day').Value:=false;
                dm.alarms.Parameters.ParamByName('sunday').Value:=false;
                dm.alarms.Parameters.ParamByName('monday').Value:=false;
                dm.alarms.Parameters.ParamByName('tuesday').Value:=false;
                dm.alarms.Parameters.ParamByName('wednesday').Value:=false;
                dm.alarms.Parameters.ParamByName('thursday').Value:=false;
                dm.alarms.Parameters.ParamByName('friday').Value:=false;
                dm.alarms.Parameters.ParamByName('saturday').Value:=false;
                dm.alarms.Parameters.ParamByName('selected_date').Value:=true;
                dm.alarms.Parameters.ParamByName('dates').Value:=datetostr(datetimepicker1.Date);
                dm.alarms.Parameters.ParamByName('start_date').Value:=datetostr(now);
                dm.alarms.Parameters.ParamByName('user_id').Value:=fMain.Label11.Caption;

                dm.alarms.ExecSQL;
                refresh1.Click;
                ShowMessage('Saved Successfully');
                fMain.AlarmsToday1.Click;
                refresh1.Click;
      end;
    end;



  end;
end;

procedure TfAlarms.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex = 0 then
  begin
    label1.Caption:='Daily';
    checkbox1.Enabled:=false;
    checkbox2.Enabled:=false;
    checkbox3.Enabled:=false;
    checkbox4.Enabled:=false;
    checkbox6.Enabled:=false;
    checkbox7.Enabled:=false;
    checkbox8.Enabled:=false;

    checkbox1.Checked:=true;
    checkbox2.Checked:=true;
    checkbox3.Checked:=true;
    checkbox4.Checked:=true;
    checkbox6.Checked:=true;
    checkbox7.Checked:=true;
    checkbox8.Checked:=true;

    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
    combobox3.Enabled:=false;

    datetimepicker1.Enabled:=false;
  end
else if radiogroup1.ItemIndex = 1 then
  begin
    label1.Caption:='Monthly';
    checkbox1.Enabled:=false;
    checkbox2.Enabled:=false;
    checkbox3.Enabled:=false;
    checkbox4.Enabled:=false;
    checkbox6.Enabled:=false;
    checkbox7.Enabled:=false;
    checkbox8.Enabled:=false;

    checkbox1.Checked:=false;
    checkbox2.Checked:=false;
    checkbox3.Checked:=false;
    checkbox4.Checked:=false;
    checkbox6.Checked:=false;
    checkbox7.Checked:=false;
    checkbox8.Checked:=false;

    combobox1.Enabled:=true;
    combobox2.Enabled:=false;
    combobox3.Enabled:=false;

    datetimepicker1.Enabled:=false;
  end
else if radiogroup1.ItemIndex = 2 then
  begin
    label1.Caption:='Yearly';
    checkbox1.Enabled:=false;
    checkbox2.Enabled:=false;
    checkbox3.Enabled:=false;
    checkbox4.Enabled:=false;
    checkbox6.Enabled:=false;
    checkbox7.Enabled:=false;
    checkbox8.Enabled:=false;

    checkbox1.Checked:=false;
    checkbox2.Checked:=false;
    checkbox3.Checked:=false;
    checkbox4.Checked:=false;
    checkbox6.Checked:=false;
    checkbox7.Checked:=false;
    checkbox8.Checked:=false;

    combobox1.Enabled:=false;
    combobox2.Enabled:=true;
    combobox3.Enabled:=true;

    datetimepicker1.Enabled:=false;
  end
else if radiogroup1.ItemIndex = 3 then
  begin
    label1.Caption:='Selected Day';
    checkbox1.Enabled:=true;
    checkbox2.Enabled:=true;
    checkbox3.Enabled:=true;
    checkbox4.Enabled:=true;
    checkbox6.Enabled:=true;
    checkbox7.Enabled:=true;
    checkbox8.Enabled:=true;

    checkbox1.Checked:=false;
    checkbox2.Checked:=false;
    checkbox3.Checked:=false;
    checkbox4.Checked:=false;
    checkbox6.Checked:=false;
    checkbox7.Checked:=false;
    checkbox8.Checked:=false;

    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
    combobox3.Enabled:=false;

    datetimepicker1.Enabled:=false;
  end
else if radiogroup1.ItemIndex = 4 then
  begin
    label1.Caption:='Selected Date';
    checkbox1.Enabled:=false;
    checkbox2.Enabled:=false;
    checkbox3.Enabled:=false;
    checkbox4.Enabled:=false;
    checkbox6.Enabled:=false;
    checkbox7.Enabled:=false;
    checkbox8.Enabled:=false;

    checkbox1.Checked:=false;
    checkbox2.Checked:=false;
    checkbox3.Checked:=false;
    checkbox4.Checked:=false;
    checkbox6.Checked:=false;
    checkbox7.Checked:=false;
    checkbox8.Checked:=false;

    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
    combobox3.Enabled:=false;

    datetimepicker1.Enabled:=true;
  end

end;

procedure TfAlarms.FormShow(Sender: TObject);
begin
refresh1.Click;
datetimepicker1.Date:=now;
end;

procedure TfAlarms.DBGrid1CellClick(Column: TColumn);
begin
updatestatus1.Click;

  
end;

procedure TfAlarms.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;

     
end;

procedure TfAlarms.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
updatestatus1.Click;
end;

procedure TfAlarms.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vDbGrid: TDBGrid absolute Sender;
begin
if DataCol=0 then
  begin
    vDbGrid.Canvas.TextOut(Rect.Left + 2 , Rect.Top + 2 , IntToStr(vDbGrid.DataSource.DataSet.RecNo));
  end;
end;

procedure TfAlarms.Button4Click(Sender: TObject);
begin
if edit10.Text<>'' then
  begin
    dm.vAlarms.SQL.Clear;
    dm.vAlarms.SQL.Add('select*from vAlarms');
    dm.vAlarms.SQL.Add('where user_id='+fMain.Label11.Caption+' and');
    dm.vAlarms.SQL.Add('alarm_title like '+quotedstr('%'+edit10.Text+'%'));
    dm.vAlarms.Open;
    edit10.SelectAll;
    edit10.SetFocus;
    updatestatus1.Click;
  end
else
  begin
    refresh1.Click;
  end;

if dm.vAlarms.RecordCount=0 then
  begin
    ShowMessage('No data found!');
  end;
end;

procedure TfAlarms.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
  begin
    button4.Click;
  end
end;

end.
