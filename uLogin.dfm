object fLogin: TfLogin
  Left = 436
  Top = 232
  Width = 358
  Height = 198
  AutoSize = True
  Caption = 'Wiklipos V.1 (Login)'
  Color = clWhite
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 342
    Height = 160
  end
  object Label1: TLabel
    Left = 51
    Top = 32
    Width = 40
    Height = 14
    Caption = 'USERNAME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 51
    Top = 51
    Width = 40
    Height = 14
    Caption = 'PASSWORD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 138
    Width = 54
    Height = 15
    Caption = 'Copyright'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388863
    Font.Height = -11
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 78
    Top = 138
    Width = 24
    Height = 15
    Caption = '2018'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7631988
    Font.Height = -11
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 281
    Top = 122
    Width = 48
    Height = 15
    Cursor = crHandPoint
    Caption = 'Register'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Ubuntu Mono'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label6Click
  end
  object Label10: TLabel
    Left = 13
    Top = 122
    Width = 66
    Height = 15
    Cursor = crHandPoint
    Caption = 'Manual Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Ubuntu Mono'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label10Click
  end
  object Edit1: TEdit
    Left = 109
    Top = 32
    Width = 98
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 109
    Top = 51
    Width = 98
    Height = 22
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
    PasswordChar = 'l'
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 219
    Top = 32
    Width = 60
    Height = 33
    Caption = 'LOGIN'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Ubuntu Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 119
    BevelOuter = bvLowered
    Color = clGray
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 28
      Top = 21
      Width = 55
      Height = 14
      Caption = 'EMPLOYEE ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 28
      Top = 44
      Width = 40
      Height = 14
      Caption = 'USERNAME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 28
      Top = 65
      Width = 40
      Height = 14
      Caption = 'PASSWORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 90
      Top = 21
      Width = 105
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 90
      Top = 44
      Width = 105
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 90
      Top = 65
      Width = 105
      Height = 22
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
      PasswordChar = 'l'
      TabOrder = 2
      OnKeyPress = Edit5KeyPress
    end
    object Button2: TButton
      Left = 201
      Top = 21
      Width = 105
      Height = 63
      Caption = 'REGISTER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Ubuntu Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object sSkinManager1: TsSkinManager
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'MS Sans Serif'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'Skins'
    SkinName = 'FM'
    SkinInfo = '10'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 208
    Top = 120
  end
end
