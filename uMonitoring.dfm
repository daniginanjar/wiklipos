object fMonitoring: TfMonitoring
  Left = 241
  Top = 221
  Width = 1382
  Height = 784
  Caption = 'Symptoms and Performance Monitoring'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Ubuntu Mono'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 10
    Top = 33
    Width = 455
    Height = 713
    Align = alLeft
    BevelOuter = bvNone
    Color = clMaroon
    TabOrder = 0
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 455
      Height = 298
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 455
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Color = 4194368
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 112
          Height = 17
          Alignment = taRightJustify
          Caption = 'Division Ranking'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Ubuntu Mono'
          Font.Style = []
          ParentFont = False
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 31
        Width = 455
        Height = 233
        Align = alClient
        DataSource = dm.dsvDivRanking
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Ubuntu Mono'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnKeyDown = DBGrid1KeyDown
        OnKeyUp = DBGrid1KeyUp
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'NO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'division_id'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'division'
            Title.Alignment = taCenter
            Title.Caption = 'DIVISION'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'division_code'
            Title.Alignment = taCenter
            Title.Caption = 'DIV. CODE'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'jumlah_kasus'
            Title.Alignment = taCenter
            Title.Caption = 'JUMLAH KASUS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object ListBox1: TListBox
        Left = 0
        Top = 264
        Width = 455
        Height = 34
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Ubuntu'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
      end
    end
    object Panel11: TPanel
      Left = 0
      Top = 298
      Width = 455
      Height = 415
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 455
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Color = 4194368
        TabOrder = 0
        object Label4: TLabel
          Left = 15
          Top = 7
          Width = 105
          Height = 17
          Alignment = taRightJustify
          Caption = 'Problem Ranking'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Ubuntu Mono'
          Font.Style = []
          ParentFont = False
        end
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 31
        Width = 455
        Height = 350
        Align = alClient
        DataSource = dm.dsvProblemRanking
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Ubuntu Mono'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid4CellClick
        OnDrawColumnCell = DBGrid4DrawColumnCell
        OnKeyDown = DBGrid4KeyDown
        OnKeyUp = DBGrid4KeyUp
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'NO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'title'
            Title.Alignment = taCenter
            Title.Caption = 'PROBLEMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Width = 280
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'jumlah_kasus'
            Title.Alignment = taCenter
            Title.Caption = 'JUMLAH KASUS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Ubuntu Mono'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end>
      end
      object ListBox3: TListBox
        Left = 0
        Top = 381
        Width = 455
        Height = 34
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Ubuntu'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = 3086480
    TabOrder = 1
    object Label14: TLabel
      Left = 15
      Top = 5
      Width = 170
      Height = 22
      Caption = 'MONITORING STATUS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Ubuntu Mono'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 490
      Top = -3
      Width = 23
      Height = 25
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000819002D21530ECD00110201FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0003394E21296314F121630DEBFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0008498222286722EC428A40FF22660FEB1F5E00DA1F5F00DA1F5F00DB1F5F
        00DB1F5F00DB1F5F00DB1F5E00DA1F5E00DA1F5D01A0FFFFFF00FFFFFF00114F
        792529631CEC458941FF378B39FF37A43BFD2FB536F229C134F224CC31F21FCD
        2DF219C726F212B61DF20E9B15F00F7D14F51F620DF0FFFFFF00FFFFFF00235F
        1DD547893AFF378E3AFF32AC36FF2EC436FF2DD638FF28E137FF23E934FF1AE7
        2BFF10DB20FF06C612FF00A105FF006F02FF196208F8FFFFFF00FFFFFF001365
        A4351A691AEB0DA310FF28C936FF45D856FB57E768EA6DF37BEA75F483EA68F4
        72EA52EF57E841CE50F029BF39FF018F06FF196809F8FFFFFF00FFFFFF000F6A
        C638097CD85D248527F049EB4FFF308C21EA206001BA216102BA216102BB2161
        02BB205E00B6226606C748D957FF08AB10FF197109F8FFFFFF00FFFFFF000F6D
        C0710981F7804EABE88B3C9C39F43E912BEAFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00112BA3BE267D32845BF25EB20FB91AC21A7208DFFFFFFF00FFFFFF00106C
        BBAB037FEDCB3C9DFFBE1144918132861AC041E05901FFFFFF00FFFFFF00FFFF
        FF002B4BB2E32B51A9F359EA786A16C61B561D6B05BCFFFFFF00FFFFFF001066
        B3DE0077E1FF1F8DF9FF1F8DF9FF000079A801047CAD00037CAD00037CAC0002
        7BAB1C41ADE23499FFFF0E3F97EC13AF262E11A9170AFFFFFF00FFFFFF001562
        ACE10672D7FF0E7BE0FF2189F2ED3F9DFFE261B0FFE470B9FFE467B4FEE44DA3
        F7E4288FF8F90177ECFF1671CDFF07356FDD1496261BFFFFFF00FFFFFF003672
        B1E24796ECFF3899EDFF32AAFDFF47B7FFFF60C0FFFF60BFFFFF4AB5FFFF28A4
        FFFF0B8AF3FF1A86E0FF2788D8FF1B6AC4FF0B3367C9FFFFFF00FFFFFF00527A
        A2D27AAFE7FB6DADE4F467B3EAF461B7EFF462B8F1F55AB4F1F54CAAEDF5479E
        E3F54A99E0FD4295E0FF428FE0FF183B85E90E70222FFFFFFF00FFFFFF000307
        736501067692010378B201047AB201057AB201057AB301057BB401057AB30003
        79B2243892E594C1FDFF3A5D99E90C7B1B2AFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00343E8EE3646EAAF10848212AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF002B3066B916142536FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Visible = False
      OnClick = SpeedButton1Click
    end
    object Panel3: TPanel
      Left = 1277
      Top = 0
      Width = 89
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      Color = 3086480
      TabOrder = 0
      object Button4: TButton
        Left = 8
        Top = 5
        Width = 75
        Height = 25
        Caption = 'REFRESH'
        TabOrder = 0
        OnClick = Button4Click
      end
    end
    object Button1: TButton
      Left = 240
      Top = 0
      Width = 99
      Height = 25
      Caption = 'Update Status'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 344
      Top = 0
      Width = 137
      Height = 25
      Caption = 'Update Grafik'
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
  end
  object Panel15: TPanel
    Left = 0
    Top = 33
    Width = 10
    Height = 713
    Align = alLeft
    BevelOuter = bvNone
    Color = clMaroon
    TabOrder = 2
  end
  object Panel16: TPanel
    Left = 1356
    Top = 33
    Width = 10
    Height = 713
    Align = alRight
    BevelOuter = bvNone
    Color = clMaroon
    TabOrder = 3
  end
  object Panel9: TPanel
    Left = 465
    Top = 33
    Width = 891
    Height = 713
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Panel17: TPanel
      Left = 0
      Top = 0
      Width = 891
      Height = 297
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel17'
      TabOrder = 0
      object Panel10: TPanel
        Left = 577
        Top = 0
        Width = 314
        Height = 297
        Align = alClient
        BevelOuter = bvNone
        Color = clMaroon
        TabOrder = 0
        object Panel13: TPanel
          Left = 0
          Top = 0
          Width = 314
          Height = 298
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 314
            Height = 31
            Align = alTop
            BevelOuter = bvNone
            Color = 4194368
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 7
              Width = 196
              Height = 17
              Caption = 'Your Performance (Per Month)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Ubuntu Mono'
              Font.Style = []
              ParentFont = False
            end
          end
          object DBGrid3: TDBGrid
            Left = 0
            Top = 31
            Width = 314
            Height = 233
            Align = alClient
            DataSource = dm.dsvPerformance
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Ubuntu Mono'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid3DrawColumnCell
            OnKeyDown = DBGrid1KeyDown
            OnKeyUp = DBGrid1KeyUp
            Columns = <
              item
                Expanded = False
                Title.Alignment = taCenter
                Title.Caption = 'NO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TAHUN'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'BULAN'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PERFORMANCE'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object ListBox4: TListBox
            Left = 0
            Top = 264
            Width = 314
            Height = 34
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Ubuntu Mono'
            Font.Style = []
            ItemHeight = 15
            ParentFont = False
            TabOrder = 2
          end
        end
        object Button2: TButton
          Left = 8
          Top = 672
          Width = 75
          Height = 25
          Caption = 'Button2'
          TabOrder = 1
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 577
        Height = 297
        Align = alLeft
        BevelOuter = bvNone
        Color = clMaroon
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 577
          Height = 298
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 577
            Height = 31
            Align = alTop
            BevelOuter = bvNone
            Color = 4194368
            TabOrder = 0
            object Label2: TLabel
              Left = 12
              Top = 7
              Width = 84
              Height = 17
              Alignment = taRightJustify
              Caption = 'User Ranking'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Ubuntu Mono'
              Font.Style = []
              ParentFont = False
            end
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 31
            Width = 577
            Height = 233
            Align = alClient
            DataSource = dm.dsvUserRanking
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Ubuntu Mono'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid2CellClick
            OnDrawColumnCell = DBGrid2DrawColumnCell
            OnKeyDown = DBGrid2KeyDown
            OnKeyUp = DBGrid2KeyUp
            Columns = <
              item
                Expanded = False
                Title.Alignment = taCenter
                Title.Caption = 'NO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'taskmaster_id'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'employee_code'
                Title.Caption = 'EMP. CD'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'employee_name'
                Title.Caption = 'EMP. NAME'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'division_id'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'division'
                Title.Alignment = taCenter
                Title.Caption = 'DIVISION'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'division_code'
                Title.Alignment = taCenter
                Title.Caption = 'DIV. CODE'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'jumlah_kasus'
                Title.Alignment = taCenter
                Title.Caption = 'JUMLAH KASUS'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Ubuntu Mono'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object ListBox2: TListBox
            Left = 0
            Top = 264
            Width = 577
            Height = 34
            Align = alBottom
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Ubuntu Mono'
            Font.Style = []
            ItemHeight = 15
            ParentFont = False
            TabOrder = 2
          end
        end
      end
    end
    object Chart1: TChart
      Left = 0
      Top = 297
      Width = 891
      Height = 416
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Pen.Visible = False
      Foot.Font.Charset = DEFAULT_CHARSET
      Foot.Font.Color = clRed
      Foot.Font.Height = -11
      Foot.Font.Name = 'Ubuntu'
      Foot.Font.Style = [fsItalic]
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -11
      Title.Font.Name = 'Ubuntu'
      Title.Font.Style = []
      Title.Text.Strings = (
        '- TOP 10 MONITORING PROBLEMS -'
        'IT DEPT. PT. PANTOS LOGISTICS INDONESIA')
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      Legend.Font.Charset = DEFAULT_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -11
      Legend.Font.Name = 'Ubuntu'
      Legend.Font.Style = []
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      Align = alClient
      TabOrder = 1
      object Series1: TPieSeries
        Marks.ArrowLength = 8
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1.000000000000000000
        PieValues.Order = loNone
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    FormHeader.AdditionalHeight = 0
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 592
  end
end
