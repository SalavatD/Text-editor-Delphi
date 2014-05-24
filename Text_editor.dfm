object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1088#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 441
  ClientWidth = 984
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    984
    441)
  PixelsPerInch = 96
  TextHeight = 13
  object Editor: TMemo
    Left = 0
    Top = 0
    Width = 984
    Height = 419
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
    OnChange = EditorChange
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 419
    Width = 984
    Height = 22
    Panels = <
      item
        Alignment = taRightJustify
        Text = #1041#1077#1079#1099#1084#1103#1085#1085#1099#1081
        Width = 350
      end
      item
        Alignment = taRightJustify
        Text = #1057#1090#1088#1086#1082': 0'
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Menu: TMainMenu
    object ActionFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object ActionCreate: TMenuItem
        Caption = #1057#1086#1079#1076'&'#1072#1090#1100
        ShortCut = 16462
        OnClick = ActionCreateClick
      end
      object ActionNewWindow: TMenuItem
        Caption = '&'#1053#1086#1074#1086#1077' '#1086#1082#1085#1086
        ShortCut = 24654
        OnClick = ActionNewWindowClick
      end
      object ActionOpen: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
        ShortCut = 16463
        OnClick = ActionOpenClick
      end
      object ActionSave: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = ActionSaveClick
      end
      object ActionSaveAs: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        ShortCut = 24659
        OnClick = ActionSaveAsClick
      end
      object Delimiter1: TMenuItem
        Caption = '-'
      end
      object ActionExit: TMenuItem
        Caption = '&'#1042#1099#1093#1086#1076
        OnClick = ActionExitClick
      end
    end
    object ActionEdit: TMenuItem
      Caption = '&'#1055#1088#1072#1074#1082#1072
      object ActionUndo: TMenuItem
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        ShortCut = 16474
        OnClick = ActionUndoClick
      end
      object ActionRedo: TMenuItem
        Caption = '&'#1042#1077#1088#1085#1091#1090#1100
        ShortCut = 16473
        OnClick = ActionRedoClick
      end
      object Delimiter2: TMenuItem
        Caption = '-'
      end
      object ActionCut: TMenuItem
        Caption = '&'#1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
        OnClick = ActionCutClick
      end
      object ActionCopy: TMenuItem
        Caption = '&'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
        OnClick = ActionCopyClick
      end
      object ActionPaste: TMenuItem
        Caption = #1042#1089#1090'&'#1072#1074#1080#1090#1100
        ShortCut = 16470
        OnClick = ActionPasteClick
      end
      object ActionDelete: TMenuItem
        Caption = '&'#1059#1076#1072#1083#1080#1090#1100
        ShortCut = 46
        OnClick = ActionDeleteClick
      end
      object Delimiter3: TMenuItem
        Caption = '-'
      end
      object ActionSelectAll: TMenuItem
        Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074'&'#1089#1077
        ShortCut = 16449
        OnClick = ActionSelectAllClick
      end
      object ActionTimeAndDate: TMenuItem
        Caption = #1042#1088#1077#1084'&'#1103' '#1080' '#1076#1072#1090#1072
        ShortCut = 116
        OnClick = ActionTimeAndDateClick
      end
    end
    object ActionFormat: TMenuItem
      Caption = #1060#1086#1088'&'#1084#1072#1090
      object ActionWordWrap: TMenuItem
        Caption = '&'#1055#1077#1088#1077#1085#1086#1089' '#1087#1086' '#1089#1083#1086#1074#1072#1084
        OnClick = ActionWordWrapClick
      end
      object ActionFont: TMenuItem
        Caption = '&'#1064#1088#1080#1092#1090'...'
        OnClick = ActionFontClick
      end
    end
    object ActionHelp: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object ActionAbout: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = ActionAboutClick
      end
    end
  end
  object OpenDialog: TOpenTextFileDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    FilterIndex = 2
  end
  object SaveDialog: TSaveTextFileDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    FilterIndex = 2
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = []
  end
end
