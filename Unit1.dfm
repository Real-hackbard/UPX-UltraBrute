object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'UPX Ultra Brute'
  ClientHeight = 575
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 336
    Width = 89
    Height = 13
    Caption = 'Used Parameters :'
  end
  object Button2: TButton
    Left = 199
    Top = 539
    Width = 263
    Height = 25
    Caption = 'Compress'
    Enabled = False
    TabOrder = 0
    TabStop = False
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 199
    Top = 509
    Width = 263
    Height = 25
    Caption = 'Decrompress'
    Enabled = False
    TabOrder = 1
    TabStop = False
    OnClick = Button1Click
  end
  object CompressionBox: TGroupBox
    Left = 8
    Top = 71
    Width = 457
    Height = 85
    Caption = 'Compression Rate : '
    TabOrder = 2
    object LabTauxCompression: TLabel
      Left = 436
      Top = 19
      Width = 9
      Height = 20
      Caption = '1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TrackBar1: TTrackBar
      Left = 5
      Top = 20
      Width = 425
      Height = 25
      Min = 1
      Position = 1
      TabOrder = 0
      TabStop = False
      OnChange = TrackBar1Change
    end
    object CheckBox1: TCheckBox
      Left = 13
      Top = 60
      Width = 44
      Height = 17
      TabStop = False
      Caption = 'Brute'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 85
      Top = 60
      Width = 73
      Height = 17
      TabStop = False
      Caption = 'Ultra Brute'
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object CheckBox13: TCheckBox
      Left = 296
      Top = 60
      Width = 96
      Height = 17
      TabStop = False
      Caption = 'Try all Methods'
      TabOrder = 3
      OnClick = CheckBox13Click
    end
  end
  object OptionsBox: TGroupBox
    Left = 199
    Top = 171
    Width = 266
    Height = 152
    Caption = 'Advanced Options : '
    TabOrder = 3
    object RessourcesBox: TCheckBox
      Left = 17
      Top = 25
      Width = 150
      Height = 17
      TabStop = False
      Caption = 'Compress resources'
      TabOrder = 0
    end
    object ExportsBox: TCheckBox
      Left = 17
      Top = 48
      Width = 132
      Height = 17
      TabStop = False
      Caption = 'Compress exports'
      TabOrder = 1
    end
    object IconesBox: TComboBox
      Left = 17
      Top = 112
      Width = 232
      Height = 21
      TabOrder = 2
      TabStop = False
      Text = 'Ne pas compresser les ic'#244'nes'
      Items.Strings = (
        'Do not compress icons'
        'Compress icons except 1st directory'
        'Compress all except the first icon'
        'Compress all icons')
    end
    object RelocsBox: TCheckBox
      Left = 17
      Top = 71
      Width = 124
      Height = 17
      TabStop = False
      Caption = 'Remove relocations'
      TabOrder = 3
    end
  end
  object DiversBox: TGroupBox
    Left = 8
    Top = 171
    Width = 185
    Height = 398
    Caption = 'Compression Options :'
    TabOrder = 4
    object CheckBox3: TCheckBox
      Left = 13
      Top = 20
      Width = 108
      Height = 17
      TabStop = False
      Caption = '8086 Compatibility'
      TabOrder = 0
    end
    object CheckBox4: TCheckBox
      Left = 13
      Top = 43
      Width = 124
      Height = 17
      TabStop = False
      Caption = 'Force compression'
      TabOrder = 1
    end
    object CheckBox5: TCheckBox
      Left = 13
      Top = 66
      Width = 124
      Height = 17
      TabStop = False
      Caption = 'Make a backup'
      TabOrder = 2
    end
    object CheckBox6: TCheckBox
      Left = 13
      Top = 89
      Width = 113
      Height = 17
      TabStop = False
      Caption = 'Suppress Warnings'
      TabOrder = 3
    end
    object CheckBox7: TCheckBox
      Left = 13
      Top = 112
      Width = 100
      Height = 17
      TabStop = False
      Caption = 'Suppress Errors'
      TabOrder = 4
    end
    object CheckBox8: TCheckBox
      Left = 13
      Top = 135
      Width = 46
      Height = 17
      TabStop = False
      Caption = 'LZMA'
      TabOrder = 5
    end
    object CheckBox9: TCheckBox
      Left = 13
      Top = 158
      Width = 85
      Height = 17
      TabStop = False
      Caption = 'Overlay Strip'
      TabOrder = 6
    end
    object CheckBox10: TCheckBox
      Left = 13
      Top = 181
      Width = 89
      Height = 17
      TabStop = False
      Caption = 'Overlay Copy'
      TabOrder = 7
    end
    object CheckBox11: TCheckBox
      Left = 13
      Top = 204
      Width = 84
      Height = 17
      TabStop = False
      Caption = 'Overlay Skip'
      TabOrder = 8
    end
    object CheckBox12: TCheckBox
      Left = 13
      Top = 227
      Width = 68
      Height = 17
      TabStop = False
      Caption = 'All Filters'
      TabOrder = 9
    end
    object CheckBox14: TCheckBox
      Left = 13
      Top = 250
      Width = 72
      Height = 17
      TabStop = False
      Caption = 'No Relocs'
      TabOrder = 10
    end
    object CheckBox15: TCheckBox
      Left = 13
      Top = 273
      Width = 49
      Height = 17
      TabStop = False
      Caption = 'COFF'
      TabOrder = 11
    end
    object CheckBox16: TCheckBox
      Left = 13
      Top = 296
      Width = 72
      Height = 17
      TabStop = False
      Caption = 'Linux/386'
      TabOrder = 12
    end
    object CheckBox17: TCheckBox
      Left = 13
      Top = 319
      Width = 86
      Height = 17
      TabStop = False
      Caption = 'Use 8 bit size'
      TabOrder = 13
    end
    object CheckBox18: TCheckBox
      Left = 13
      Top = 342
      Width = 72
      Height = 17
      TabStop = False
      Caption = 'LE Output'
      TabOrder = 14
    end
    object CheckBox19: TCheckBox
      Left = 13
      Top = 365
      Width = 68
      Height = 17
      TabStop = False
      Caption = 'No Align'
      TabOrder = 15
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 57
    Caption = ' File :'
    TabOrder = 5
    object LoaderString: TEdit
      Left = 13
      Top = 22
      Width = 393
      Height = 21
      TabStop = False
      TabOrder = 0
    end
    object Button3: TButton
      Left = 412
      Top = 22
      Width = 33
      Height = 22
      Caption = '...'
      TabOrder = 1
      TabStop = False
      OnClick = Button3Click
    end
  end
  object Memo1: TMemo
    Left = 199
    Top = 355
    Width = 266
    Height = 148
    Lines.Strings = (
      '         The Ultimate Packer for eXecutables'
      '                  Copyright (c) 1996-2025 '
      'Markus Oberhumer, Laszlo Molnar & John Reiser'
      '                    https://upx.github.io'
      ''
      ''
      'ready.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object OpenExe: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Programme EXE|*.exe'
    Options = [ofHideReadOnly]
    Title = 'Choisissez un programme .exe'
    Left = 272
    Top = 24
  end
end
