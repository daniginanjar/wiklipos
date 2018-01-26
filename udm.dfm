object dm: Tdm
  OldCreateOrder = False
  Left = 1587
  Top = 159
  Height = 339
  Width = 1108
  object data: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object user: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from users')
    Left = 88
    Top = 16
  end
  object reports: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from reports')
    Left = 128
    Top = 16
  end
  object employee: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from employee')
    Left = 192
    Top = 16
  end
  object division: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from division')
    Left = 256
    Top = 16
  end
  object dsEmployee: TDataSource
    DataSet = employee
    Left = 192
    Top = 72
  end
  object vReports: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vReports')
    Left = 320
    Top = 16
    object vReportsreports_id: TAutoIncField
      FieldName = 'reports_id'
      ReadOnly = True
    end
    object vReportsreport_date: TDateTimeField
      FieldName = 'report_date'
      DisplayFormat = 'dd-MM-yyy'
    end
    object vReportssymptoms: TWideStringField
      FieldName = 'symptoms'
      Size = 255
    end
    object vReportsdiagnosis: TWideStringField
      FieldName = 'diagnosis'
      Size = 255
    end
    object vReportsactions: TWideStringField
      FieldName = 'actions'
      Size = 255
    end
    object vReportstaskmaster_id: TIntegerField
      FieldName = 'taskmaster_id'
    end
    object vReportstaskmaster_name: TWideStringField
      FieldName = 'taskmaster_name'
      Size = 150
    end
    object vReportsemployeedivision_id: TIntegerField
      FieldName = 'employee.division_id'
    end
    object vReportstaskmaster_division: TWideStringField
      FieldName = 'taskmaster_division'
      Size = 30
    end
    object vReportsexecutor_id: TIntegerField
      FieldName = 'executor_id'
    end
    object vReportsemployee_name: TWideStringField
      FieldName = 'employee_name'
      Size = 150
    end
    object vReportsemployee_1division_id: TIntegerField
      FieldName = 'employee_1.division_id'
    end
    object vReportsdivision: TWideStringField
      FieldName = 'division'
      Size = 30
    end
    object vReportsemployeeemployee_code: TWideStringField
      FieldName = 'employee.employee_code'
      Size = 5
    end
    object vReportsemployee_1employee_code: TWideStringField
      FieldName = 'employee_1.employee_code'
      Size = 5
    end
    object vReportstitle: TWideStringField
      FieldName = 'title'
      Size = 100
    end
    object vReportsdivision_code: TWideStringField
      FieldName = 'division_code'
    end
  end
  object dsvReports: TDataSource
    DataSet = vReports
    Left = 320
    Top = 72
  end
  object vEmployee: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vEmployee')
    Left = 384
    Top = 16
  end
  object dsvEmployee: TDataSource
    DataSet = vEmployee
    Left = 384
    Top = 72
  end
  object popup: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vEmployee')
    Left = 456
    Top = 16
  end
  object dsPopUp: TDataSource
    DataSet = popup
    Left = 456
    Top = 72
  end
  object vUsers: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vUsers')
    Left = 88
    Top = 72
  end
  object vDivRanking: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vDivRanking where division_code <> "IT"')
    Left = 536
    Top = 16
  end
  object dsvDivRanking: TDataSource
    DataSet = vDivRanking
    Left = 536
    Top = 72
  end
  object vUserRanking: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vUserRanking where division_code <> "IT"')
    Left = 624
    Top = 16
  end
  object dsvUserRanking: TDataSource
    DataSet = vUserRanking
    Left = 624
    Top = 72
  end
  object vProblemRanking: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select*from vProblemRanking where title <> "HOMESHOPPING WMS DAI' +
        'LY CHECKING"')
    Left = 728
    Top = 16
  end
  object dsvProblemRanking: TDataSource
    DataSet = vProblemRanking
    Left = 728
    Top = 72
  end
  object vPerformance: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT YEAR(reports.report_date) AS TAHUN, MONTH(reports.report_' +
        'date) AS BULAN, COUNT(*) AS PERFORMANCE'
      'FROM vReports'
      'WHERE division_code<>"IT"'
      'GROUP BY YEAR(reports.report_date), MONTH(reports.report_date);')
    Left = 840
    Top = 16
    object vPerformanceTAHUN: TSmallintField
      FieldName = 'TAHUN'
    end
    object vPerformanceBULAN: TSmallintField
      FieldName = 'BULAN'
    end
    object vPerformancePERFORMANCE: TIntegerField
      FieldName = 'PERFORMANCE'
    end
  end
  object dsvPerformance: TDataSource
    DataSet = vPerformance
    Left = 840
    Top = 72
  end
  object vTotalPerformance: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT YEAR(reports.report_date) AS TAHUN, COUNT(*) AS PERFORMAN' +
        'CE'
      'FROM vReports'
      'Where division_code <> "IT"'
      'GROUP BY YEAR(reports.report_date);')
    Left = 936
    Top = 16
    object SmallintField1: TSmallintField
      FieldName = 'TAHUN'
    end
    object IntegerField1: TIntegerField
      FieldName = 'PERFORMANCE'
    end
  end
  object dsvTotalPerformance: TDataSource
    DataSet = vTotalPerformance
    Left = 936
    Top = 72
  end
  object vProblemChart: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select TOP 10 * from vProblemRanking where title <> "HOMESHOPPIN' +
        'G WMS DAILY CHECKING"')
    Left = 88
    Top = 128
  end
  object dsvProblemChart: TDataSource
    DataSet = vProblemChart
    Left = 88
    Top = 184
  end
  object vWeeklyReport: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vWeeklyReport')
    Left = 192
    Top = 128
  end
  object dsvWeeklyReport: TDataSource
    DataSet = vWeeklyReport
    Left = 192
    Top = 184
  end
  object dsDivision: TDataSource
    DataSet = division
    Left = 256
    Top = 72
  end
  object skin: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from skin')
    Left = 280
    Top = 128
  end
  object dsskin: TDataSource
    DataSet = skin
    Left = 280
    Top = 184
  end
  object alarms: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from alarms')
    Left = 352
    Top = 128
  end
  object dsalrm: TDataSource
    DataSet = alarms
    Left = 352
    Top = 184
  end
  object vAlarms: TADOQuery
    Connection = data
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select*from vAlarms')
    Left = 424
    Top = 128
    object vAlarmsalarm_id: TAutoIncField
      FieldName = 'alarm_id'
      ReadOnly = True
    end
    object vAlarmsalarm_title: TWideStringField
      FieldName = 'alarm_title'
      Size = 100
    end
    object vAlarmsdaily: TBooleanField
      FieldName = 'daily'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsmonthly: TBooleanField
      FieldName = 'monthly'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsmonthly_date: TWideStringField
      FieldName = 'monthly_date'
      Size = 2
    end
    object vAlarmsyearly: TBooleanField
      FieldName = 'yearly'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsyearly_date: TWideStringField
      FieldName = 'yearly_date'
      Size = 2
    end
    object vAlarmsyearly_month: TWideStringField
      FieldName = 'yearly_month'
      Size = 2
    end
    object vAlarmsselected_day: TBooleanField
      FieldName = 'selected_day'
      DisplayValues = 'Yes;No'
    end
    object vAlarmssunday: TBooleanField
      FieldName = 'sunday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsmonday: TBooleanField
      FieldName = 'monday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmstuesday: TBooleanField
      FieldName = 'tuesday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmswednesday: TBooleanField
      FieldName = 'wednesday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsthursday: TBooleanField
      FieldName = 'thursday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsfriday: TBooleanField
      FieldName = 'friday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmssaturday: TBooleanField
      FieldName = 'saturday'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsselected_date: TBooleanField
      FieldName = 'selected_date'
      DisplayValues = 'Yes;No'
    end
    object vAlarmsdates: TDateTimeField
      FieldName = 'dates'
      DisplayFormat = 'dd-MM-yyy'
    end
    object vAlarmsstart_date: TDateTimeField
      FieldName = 'start_date'
      DisplayFormat = 'dd-MM-yyy'
    end
    object vAlarmsuser_id: TIntegerField
      FieldName = 'user_id'
    end
  end
  object dsvAlarms: TDataSource
    DataSet = vAlarms
    Left = 424
    Top = 184
  end
end
