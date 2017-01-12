object Form1: TForm1
  Left = 287
  Top = 265
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IP2Location DEMO | DeadC0der - DeadC0der7@gmail.com |'
  ClientHeight = 323
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rb1: TRadioButton
    Left = 8
    Top = 24
    Width = 137
    Height = 17
    Caption = 'Read from file (Deafault)'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rb2: TRadioButton
    Left = 191
    Top = 24
    Width = 137
    Height = 17
    Caption = 'Read from Cache'
    TabOrder = 1
  end
  object rb3: TRadioButton
    Left = 376
    Top = 24
    Width = 145
    Height = 17
    Caption = 'Read from shared memory'
    TabOrder = 2
  end
  object grp1: TGroupBox
    Left = 2
    Top = 3
    Width = 545
    Height = 54
    Caption = 'Database Path'
    TabOrder = 3
    object lbl1: TLabel
      Left = 7
      Top = 22
      Width = 101
      Height = 13
      Caption = 'Select Database File:'
    end
    object edt1: TEdit
      Left = 110
      Top = 19
      Width = 403
      Height = 21
      TabOrder = 0
      OnChange = edt1Change
    end
    object btn1: TButton
      Left = 516
      Top = 19
      Width = 22
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object rg1: TRadioGroup
    Left = 2
    Top = 60
    Width = 545
    Height = 54
    Caption = 'Open Mode'
    Columns = 3
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Read from file (default)'
      'Read from cache'
      'Read from shared memory')
    TabOrder = 4
    OnClick = rg1Click
  end
  object grp2: TGroupBox
    Left = 3
    Top = 118
    Width = 545
    Height = 184
    Caption = 'IP2Location'
    Enabled = False
    TabOrder = 5
    object lbl2: TLabel
      Left = 120
      Top = 15
      Width = 52
      Height = 13
      Caption = 'IP Address'
    end
    object lv1: TListView
      Left = 7
      Top = 39
      Width = 529
      Height = 139
      Columns = <
        item
          Caption = 'IP'
          Width = 100
        end
        item
          Caption = 'Code'
        end
        item
          Caption = 'Country'
          Width = 150
        end
        item
          Caption = 'Region'
          Width = 150
        end
        item
          Caption = 'City'
          Width = 150
        end
        item
          Caption = 'Latitude'
          Width = 150
        end
        item
          Caption = 'Longitude'
          Width = 150
        end
        item
          Caption = 'Zip Code'
          Width = 75
        end
        item
          Caption = 'Time Zone'
          Width = 100
        end
        item
          Caption = 'ISP'
          Width = 150
        end
        item
          Caption = 'Domain'
          Width = 100
        end
        item
          Caption = 'Connection type'
          Width = 100
        end
        item
          Caption = 'Area code'
          Width = 100
        end
        item
          Caption = 'Weather'
          Width = 100
        end
        item
          Caption = 'Mobile Network'
          Width = 100
        end
        item
          Caption = 'Elevation'
        end
        item
          Caption = 'Usage type'
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object edt2: TEdit
      Left = 176
      Top = 12
      Width = 193
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = edt2Enter
      OnExit = edt2Exit
      OnKeyPress = edt2KeyPress
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 304
    Width = 550
    Height = 19
    Panels = <
      item
        Text = 'Database Date:'
        Width = 150
      end
      item
        Text = 'Database Entries:'
        Width = 150
      end
      item
        Text = 'IP Version:'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Width = 100
      end>
  end
  object XPManifest1: TXPManifest
  end
  object dlgOpen1: TOpenDialog
    Filter = 'IP2LOC Binary File (*.Bin)|*.Bin'
    Left = 32
  end
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
    Left = 330
    Top = 3
  end
end
