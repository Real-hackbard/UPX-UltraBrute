unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, XPMan, ComCtrls, IniFiles;

type
  TForm1 = class(TForm)
    OpenExe: TOpenDialog;
    Button2: TButton;
    Button1: TButton;
    CompressionBox: TGroupBox;
    TrackBar1: TTrackBar;
    LabTauxCompression: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    OptionsBox: TGroupBox;
    RessourcesBox: TCheckBox;
    ExportsBox: TCheckBox;
    IconesBox: TComboBox;
    RelocsBox: TCheckBox;
    DiversBox: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox1: TGroupBox;
    LoaderString: TEdit;
    Button3: TButton;
    Memo1: TMemo;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  UPXPath, INIPath, Parameters : String;

implementation

{$R *.dfm}
procedure TForm1.Button2Click(Sender: TObject);
begin
 Parameters := '';
 Memo1.Lines.Add('');

 if CheckBox2.Checked
   then Parameters := Parameters+' --ultra-brute'
   else if CheckBox1.Checked
        then Parameters := Parameters+' --brute'
        else if TrackBar1.Position = 10
            then Parameters := Parameters+' --best'
            else Parameters := Parameters+' -'+IntToStr(TrackBar1.Position);

  if RessourcesBox.Checked
    then Parameters := Parameters+' --compress-resources=1'
      else Parameters := Parameters+' --compress-resources=0';

  if ExportsBox.Checked
    then Parameters := Parameters+' --compress-exports=1'
      else Parameters := Parameters+' --compress-exports=0';

  if RelocsBox.Checked
    then Parameters := Parameters+' --strip-relocs=1'
      else Parameters := Parameters+' --strip-relocs=0';

  Parameters := Parameters+' --compress-icons='+IntToStr(IconesBox.ItemIndex);

  if CheckBox3.Checked then Parameters := Parameters+' --8086';
  if CheckBox4.Checked then Parameters := Parameters+' --force';

  if CheckBox5.Checked
    then Parameters := Parameters+' --backup'
    else Parameters := Parameters+' --no-backup';

  if CheckBox6.Checked then Parameters := Parameters+' -q';
  if CheckBox7.Checked then Parameters := Parameters+' -qq';
  if CheckBox8.Checked then Parameters := Parameters+' --lzma';
  if CheckBox9.Checked then Parameters := Parameters+' --overlay=strip';
  if CheckBox10.Checked then Parameters := Parameters+' --overlay=copy';
  if CheckBox11.Checked then Parameters := Parameters+' --overlay=skip';
  if CheckBox12.Checked then Parameters := Parameters+' --all-filters';
  if CheckBox13.Checked then Parameters := Parameters+' --all-methods';
  if CheckBox14.Checked then Parameters := Parameters+' --no-reloc';
  if CheckBox15.Checked then Parameters := Parameters+' --coff';
  if CheckBox16.Checked then Parameters := Parameters+' --force-execve';
  if CheckBox17.Checked then Parameters := Parameters+' --8-bit';
  if CheckBox18.Checked then Parameters := Parameters+' --le';
  if CheckBox19.Checked then Parameters := Parameters+' --no-align';

  ShellExecute(GetDesktopWindow, 'open', PChar(UPXPath),
              PChar('"'+UPXPath+'"'+ Parameters + ' ' + '"'  +LoaderString.Text+'"'),
              nil, SW_SHOWNORMAL);
  Memo1.Lines.Add(Parameters);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Parameters := ' -d';
 if CheckBox5.Checked then
  begin
   Parameters := Parameters+' --backup';
  end
  else
  Parameters := Parameters+' --no-backup';
  ShellExecute(GetDesktopWindow, 'open',
  PChar(UPXPath), PChar('"'+UPXPath+'"'+Parameters+' '+'"'+LoaderString.Text+'"'),
  nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if OpenExe.Execute then
  begin
    LoaderString.Text := OpenExe.FileName;
    Button2.Enabled := True;
    Button1.Enabled := True;
  end;
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
  CheckBox1.Checked := false;
  CheckBox2.Checked := false;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 CheckBox13.Checked := false;
 if CheckBox1.Checked  then
  CheckBox2.Checked := False;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  CheckBox13.Checked := false;
 if CheckBox2.Checked  then
  CheckBox1.Checked := False;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
 LabTauxCompression.Caption := IntToStr(TrackBar1.Position);
end;

procedure TForm1.FormActivate(Sender: TObject);
var INI : TIniFile;
begin
 INI := TIniFile.Create(INIPath+'UPX.ini');

 LoaderString.Text := INI.ReadString('Options','LastFile','');
 TrackBar1.Position := INI.ReadInteger('Options','Compression',7);
 CheckBox1.Checked := INI.ReadBool('Options','Brute',False);
 CheckBox2.Checked := INI.ReadBool('Options','UBrute',False);
 RessourcesBox.Checked := INI.ReadBool('Options','Ressources',True);
 ExportsBox.Checked := INI.ReadBool('Options','Exports',True);
 RelocsBox.Checked := INI.ReadBool('Options','Relocations',True);
 IconesBox.ItemIndex := INI.ReadInteger('Options','Icones',2);
 CheckBox3.Checked := INI.ReadBool('Options','Compatibilite',False);
 CheckBox4.Checked := INI.ReadBool('Options','Force',False);
 CheckBox5.Checked := INI.ReadBool('Options','Backup',False);
 CheckBox6.Checked := INI.ReadBool('Options','Warnings',False);
 CheckBox7.Checked := INI.ReadBool('Options','Errors',False);
 CheckBox8.Checked := INI.ReadBool('Options','LZMA',False);
 CheckBox9.Checked := INI.ReadBool('Options','OverlayStrip',False);
 CheckBox10.Checked := INI.ReadBool('Options','OverlayCopy',False);
 CheckBox11.Checked := INI.ReadBool('Options','OverlaySkip',False);
 CheckBox12.Checked := INI.ReadBool('Options','Filters',False);
 CheckBox13.Checked := INI.ReadBool('Options','Methods',False);
 CheckBox14.Checked := INI.ReadBool('Options','NoReloc',False);
 CheckBox15.Checked := INI.ReadBool('Options','Coff',False);
 CheckBox16.Checked := INI.ReadBool('Options','Linux',False);
 CheckBox17.Checked := INI.ReadBool('Options','8bit',False);
 CheckBox18.Checked := INI.ReadBool('Options','LE',False);
 CheckBox19.Checked := INI.ReadBool('Options','NoAlign',False);


 INI.Free;
 if LoaderString.Text <>'' then
   begin
    Button2.Enabled := True;
    Button1.Enabled := True;
   end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 INIPath := ExtractFilePath(Application.ExeName);
 UPXPath := INIPath + 'upx.exe';
 if not FileExists(UPXPath) then
  ShowMessage('Upx.exe is missing from the directory');
end;

procedure TForm1.FormDestroy(Sender: TObject);
var INI : TIniFile;
begin
 INI := TIniFile.Create(INIPath+'UPX.ini');
 INI.WriteString('Options','LastFile',LoaderString.Text);
 INI.WriteInteger('Options','Compression',TrackBar1.Position);
 INI.WriteBool('Options','Brute',CheckBox1.Checked);
 INI.WriteBool('Options','UBrute',CheckBox2.Checked);
 INI.WriteBool('Options','Ressources',RessourcesBox.Checked);
 INI.WriteBool('Options','Exports',ExportsBox.Checked);
 INI.WriteBool('Options','Relocations',RelocsBox.Checked);
 INI.WriteInteger('Options','Icones',IconesBox.ItemIndex);
 INI.WriteBool('Options','Compatibilite',CheckBox3.Checked);
 INI.WriteBool('Options','Force',CheckBox4.Checked);
 INI.WriteBool('Options','Backup',CheckBox5.Checked);
 INI.WriteBool('Options','Warnings',CheckBox6.Checked);
 INI.WriteBool('Options','Errors',CheckBox7.Checked);
 INI.WriteBool('Options','LZMA',CheckBox8.Checked);
 INI.WriteBool('Options','OverlayStrip',CheckBox9.Checked);
 INI.WriteBool('Options','OverlayCopy',CheckBox10.Checked);
 INI.WriteBool('Options','OverlaySkip',CheckBox11.Checked);
 INI.WriteBool('Options','Filters',CheckBox12.Checked);
 INI.WriteBool('Options','Methods',CheckBox13.Checked);
 INI.WriteBool('Options','NoReloc',CheckBox14.Checked);
 INI.WriteBool('Options','Coff',CheckBox15.Checked);
 INI.WriteBool('Options','Linux',CheckBox16.Checked);
 INI.WriteBool('Options','8bit',CheckBox17.Checked);
 INI.WriteBool('Options','LE',CheckBox18.Checked);
 INI.WriteBool('Options','NoAlign',CheckBox19.Checked);

 INI.Free;
end;

end.
