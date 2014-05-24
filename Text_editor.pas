unit Text_editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtDlgs, XPMan, ComCtrls;

type
  TMainForm = class(TForm)

    Menu: TMainMenu;

    Editor: TMemo;

    ActionFile: TMenuItem;
    ActionCreate: TMenuItem;
    ActionNewWindow: TMenuItem;
    ActionOpen: TMenuItem;
    ActionSave: TMenuItem;
    ActionSaveAs: TMenuItem;
    Delimiter1: TMenuItem;
    ActionExit: TMenuItem;

    ActionEdit: TMenuItem;
    ActionUndo: TMenuItem;
    ActionRedo: TMenuItem;
    Delimiter2: TMenuItem;
    ActionCut: TMenuItem;
    ActionCopy: TMenuItem;
    ActionPaste: TMenuItem;
    ActionDelete: TMenuItem;
    Delimiter3: TMenuItem;
    ActionSelectAll: TMenuItem;
    ActionTimeAndDate: TMenuItem;

    ActionFormat: TMenuItem;
    ActionWordWrap: TMenuItem;
    ActionFont: TMenuItem;

    ActionHelp: TMenuItem;
    ActionAbout: TMenuItem;

    OpenDialog: TOpenTextFileDialog;
    SaveDialog: TSaveTextFileDialog;

    FontDialog: TFontDialog;
    StatusBar: TStatusBar;

    procedure ActionAboutClick(Sender: TObject);
    procedure ActionCopyClick(Sender: TObject);
    procedure ActionCreateClick(Sender: TObject);
    procedure ActionCutClick(Sender: TObject);
    procedure ActionDeleteClick(Sender: TObject);
    procedure ActionExitClick(Sender: TObject);
    procedure ActionFontClick(Sender: TObject);
    procedure ActionNewWindowClick(Sender: TObject);
    procedure ActionOpenClick(Sender: TObject);
    procedure ActionPasteClick(Sender: TObject);
    procedure ActionRedoClick(Sender: TObject);
    procedure ActionSaveAsClick(Sender: TObject);
    procedure ActionSaveClick(Sender: TObject);
    procedure ActionSelectAllClick(Sender: TObject);
    procedure ActionTimeAndDateClick(Sender: TObject);
    procedure ActionUndoClick(Sender: TObject);
    procedure ActionWordWrapClick(Sender: TObject);
    procedure EditorChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

  FilePath: String;

  TextUndoed: Boolean;

implementation

{$R *.dfm}

procedure StatusBarUpdate();
begin
  if FilePath = '' then begin
    MainForm.StatusBar.Panels[0].Text := 'Безымянный';
  end
  else begin
     MainForm.StatusBar.Panels[0].Text := ExtractFileName(FilePath);
  end;
end;

procedure SaveAs();
begin
  If MainForm.SaveDialog.Execute then begin
    FilePath := MainForm.SaveDialog.FileName;
    MainForm.Editor.Lines.SaveToFile(MainForm.SaveDialog.FileName);
    StatusBarUpdate;
  end;
end;

procedure TMainForm.ActionAboutClick(Sender: TObject);
begin
  MessageBox(handle, 'Текстовый редактор 1.0'#10#10'Автор: Салават Даутов'#10#10'Дата создания: январь - май 2014 года', 'О программе', MB_ICONINFORMATION);
end;

procedure TMainForm.ActionCopyClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TMainForm.ActionCreateClick(Sender: TObject);
begin
  if IDYES = MessageBox(handle, 'Все несохраненные изменения будут потеряны.'#10'Продолжить?', 'Создание', MB_YESNO+MB_ICONINFORMATION) then begin
    FilePath := '';
    StatusBarUpdate;
    Editor.Clear;
  end;
end;

procedure TMainForm.ActionCutClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TMainForm.ActionDeleteClick(Sender: TObject);
begin
  Editor.SelText := '';
end;

procedure TMainForm.ActionExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ActionFontClick(Sender: TObject);
begin
  if FontDialog.Execute then begin
    Editor.Font := FontDialog.Font;
  end;
end;

procedure TMainForm.ActionNewWindowClick(Sender: TObject);
begin
  WinExec(PChar(Application.ExeName), SW_SHOW);
end;

procedure TMainForm.ActionOpenClick(Sender: TObject);
begin
  if IDYES = MessageBox(handle, 'Все несохраненные изменения будут потеряны.'#10'Продолжить?', 'Открытие', MB_YESNO+MB_ICONINFORMATION) then begin
    if OpenDialog.Execute then begin
      FilePath := OpenDialog.FileName;
      Editor.Lines.LoadFromFile(OpenDialog.FileName);
      StatusBarUpdate;
    end;
  end;
end;

procedure TMainForm.ActionPasteClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TMainForm.ActionRedoClick(Sender: TObject);
begin
  if TextUndoed then begin
    Editor.Undo;
    TextUndoed := False;
  end;
end;

procedure TMainForm.ActionSaveAsClick(Sender: TObject);
begin
  SaveAs;
end;

procedure TMainForm.ActionSaveClick(Sender: TObject);
begin
  If FilePath = '' then begin
    SaveAs;
  end
  else begin
    Editor.Lines.SaveToFile(FilePath);
  end;
end;

procedure TMainForm.ActionSelectAllClick(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TMainForm.ActionTimeAndDateClick(Sender: TObject);
begin
  Editor.SelText := FormatDateTime('hh:mm dd.MM.YYYY', Now)
end;

procedure TMainForm.ActionUndoClick(Sender: TObject);
begin
  if Not TextUndoed then begin
    Editor.Undo;
    TextUndoed := True;
  end;
end;

procedure TMainForm.ActionWordWrapClick(Sender: TObject);
begin
  If Editor.WordWrap then begin
    Editor.WordWrap := False;
    Editor.ScrollBars := ssBoth;
    ActionWordWrap.Checked := False;
  end
  else begin
    Editor.WordWrap := True;
    Editor.ScrollBars := ssVertical;
    ActionWordWrap.Checked := True;
  end;
end;

procedure TMainForm.EditorChange(Sender: TObject);
begin
  StatusBar.Panels[1].Text := 'Строк: ' + IntToStr(Editor.Lines.Count)
end;

end.
