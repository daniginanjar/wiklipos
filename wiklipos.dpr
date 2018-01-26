program wiklipos;

uses
  Forms,SysUtils, Dialogs,
  uMain in 'uMain.pas' {fMain},
  udm in 'udm.pas' {dm: TDataModule},
  uLogin in 'uLogin.pas' {fLogin},
  uPopUp in 'uPopUp.pas' {fPopUp},
  uMonitoring in 'uMonitoring.pas' {fMonitoring},
  uWeeklyReport in 'uWeeklyReport.pas' {fWeeklyReport},
  uEmployee in 'uEmployee.pas' {fEmployee},
  uDivision in 'uDivision.pas' {fDivision},
  uAbout in 'uAbout.pas' {fAbout},
  uAlarms in 'uAlarms.pas' {fAlarms};

{$R *.res}



begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  if FileExists(extractfilepath(application.ExeName)+'wiklipos.mdb') then
    begin
      try
        dm.data.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=wiklipos.mdb;Jet OLEDB:Database Password=admin$@*^@;';
        dm.data.Connected:=true;
        dm.user.Open;
        dm.reports.Open;
        dm.employee.Open;
        dm.division.Open;
        dm.vreports.Open;
        dm.vemployee.Open;
        dm.popup.Open;
        dm.vDivRanking.Open;
        dm.vUserRanking.Open;
        dm.vProblemRanking.Open;
        dm.vPerformance.Open;
        dm.vTotalPerformance.Open;
        dm.vUsers.Open;
        dm.vProblemChart.Open;
        dm.vWeeklyReport.Open;
        dm.skin.Open;
        dm.alarms.Open;
        dm.vAlarms.Open;



        Application.CreateForm(TfLogin, fLogin);
        Application.CreateForm(TfMain, fMain);
        Application.CreateForm(TfPopUp, fPopUp);
        Application.CreateForm(TfMonitoring, fMonitoring);
        Application.CreateForm(TfWeeklyReport, fWeeklyReport);
        Application.CreateForm(TfEmployee, fEmployee);
        Application.CreateForm(TfDivision, fDivision);
        Application.CreateForm(TfAbout, fAbout);
        Application.CreateForm(TfAlarms, fAlarms);
        Application.Run;
      except
        Showmessage('Invalid Database, please reinstall Wiklipos!');
        dm.data.Connected:=false;
        application.Terminate;
      end;
    end
  else
    begin
      ShowMessage('Database doesnt Exist! please reinstall Wiklipos!');
      application.Terminate;
    end;

end.
