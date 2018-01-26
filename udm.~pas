unit udm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    data: TADOConnection;
    user: TADOQuery;
    reports: TADOQuery;
    employee: TADOQuery;
    division: TADOQuery;
    dsEmployee: TDataSource;
    vReports: TADOQuery;
    dsvReports: TDataSource;
    vEmployee: TADOQuery;
    dsvEmployee: TDataSource;
    popup: TADOQuery;
    dsPopUp: TDataSource;
    vUsers: TADOQuery;
    vReportsreports_id: TAutoIncField;
    vReportsreport_date: TDateTimeField;
    vReportssymptoms: TWideStringField;
    vReportsdiagnosis: TWideStringField;
    vReportsactions: TWideStringField;
    vReportstaskmaster_id: TIntegerField;
    vReportstaskmaster_name: TWideStringField;
    vReportsemployeedivision_id: TIntegerField;
    vReportstaskmaster_division: TWideStringField;
    vReportsexecutor_id: TIntegerField;
    vReportsemployee_name: TWideStringField;
    vReportsemployee_1division_id: TIntegerField;
    vReportsdivision: TWideStringField;
    vReportsemployeeemployee_code: TWideStringField;
    vReportsemployee_1employee_code: TWideStringField;
    vReportstitle: TWideStringField;
    vReportsdivision_code: TWideStringField;
    vDivRanking: TADOQuery;
    dsvDivRanking: TDataSource;
    vUserRanking: TADOQuery;
    dsvUserRanking: TDataSource;
    vProblemRanking: TADOQuery;
    dsvProblemRanking: TDataSource;
    vPerformance: TADOQuery;
    dsvPerformance: TDataSource;
    vPerformanceTAHUN: TSmallintField;
    vPerformanceBULAN: TSmallintField;
    vPerformancePERFORMANCE: TIntegerField;
    vTotalPerformance: TADOQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    dsvTotalPerformance: TDataSource;
    vProblemChart: TADOQuery;
    dsvProblemChart: TDataSource;
    vWeeklyReport: TADOQuery;
    dsvWeeklyReport: TDataSource;
    dsDivision: TDataSource;
    skin: TADOQuery;
    dsskin: TDataSource;
    alarms: TADOQuery;
    dsalrm: TDataSource;
    vAlarms: TADOQuery;
    dsvAlarms: TDataSource;
    vAlarmsalarm_id: TAutoIncField;
    vAlarmsalarm_title: TWideStringField;
    vAlarmsdaily: TBooleanField;
    vAlarmsmonthly: TBooleanField;
    vAlarmsmonthly_date: TWideStringField;
    vAlarmsyearly: TBooleanField;
    vAlarmsyearly_date: TWideStringField;
    vAlarmsyearly_month: TWideStringField;
    vAlarmsselected_day: TBooleanField;
    vAlarmssunday: TBooleanField;
    vAlarmsmonday: TBooleanField;
    vAlarmstuesday: TBooleanField;
    vAlarmswednesday: TBooleanField;
    vAlarmsthursday: TBooleanField;
    vAlarmsfriday: TBooleanField;
    vAlarmssaturday: TBooleanField;
    vAlarmsselected_date: TBooleanField;
    vAlarmsdates: TDateTimeField;
    vAlarmsstart_date: TDateTimeField;
    vAlarmsuser_id: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses uLogin;

{$R *.dfm}

end.
