  /////////////////////////////////////////////
//       IP2Location Delphi Example           //
//                                            //
//    a sample that illustrates the major     //
//    functions of IP2Location library in     //
//                     a GUI                  //
//                                            //
//      Coded by:    DeadC0der                //
//              DeadC0der7@gmail.com          //
 /////////////////////////////////////////////

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ComCtrls, StdCtrls,IP2Location,IP2Loc_DBInterface, ExtCtrls;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    dlgOpen1: TOpenDialog;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    grp1: TGroupBox;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    rg1: TRadioGroup;
    grp2: TGroupBox;
    lv1: TListView;
    edt2: TEdit;
    lbl2: TLabel;
    stat1: TStatusBar;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure edt2Enter(Sender: TObject);
    procedure edt2Exit(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  IP2Loc:TIP2Location;
  SampleIp:string;
  KeysSet:set of char;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
 with dlgOpen1 do
  if Execute and (FileName<>'') then
   edt1.Text:=FileName;
end;

procedure TForm1.edt1Change(Sender: TObject);
begin
IP2Location_close(IP2Loc);
IP2Loc:=IP2Location_open(pchar(edt1.text));
rg1.Enabled:=(edt1.text<>'') and (Ip2Loc.filehandle<>-1) ;
begin
grp2.Enabled:=rg1.Enabled;
stat1.Panels[0].Text:=Format('Database Date:%0.2d/%0.2d/%0.2d',[Ip2Loc.databaseday,Ip2Loc.databasemonth,Ip2Loc.databaseyear]);
stat1.Panels[1].Text:=Format('Database Count:%d',[Ip2Loc.databasecount]);
if Ip2Loc.ipversion=0 then
begin
stat1.Panels[2].Text:='IP Version:IPV4';
edt2.Text:='127.0.0.1';
KeysSet:=['0'..'9','.',#13,#8];
end
else
begin
stat1.Panels[2].Text:='IP Version:IPV6';
edt2.Text:='0000:0000:0000::';
KeysSet:=['0'..'9','A'..'F','a'..'f',':','.',#13,#8];
end;
SampleIp:=edt2.Text;
end;
end;

procedure TForm1.rg1Click(Sender: TObject);
begin
 try
 if (Ip2Loc.filehandle<>-1) and (rg1.ItemIndex <>-1) then
  begin
   if IP2Location_open_mem(Ip2Loc,TIP2LOCATION_mem_Type(rg1.ItemIndex)) =-1 then
    MessageDlg('Failed to load file into memory or already opened',mtError,[mbok],0);

  end
  else
  MessageDlg('either you chose an invalid file or you didn''t pick up an option',mtWarning,[mbok],0);
  except
   MessageDlg('you must close the database before you choose another option',mtInformation,[mbok],0);
   grp2.Enabled:=False;
  end;
 end;

procedure TForm1.edt2Enter(Sender: TObject);
begin
edt2.Clear;
edt2.Font.Color:=clBlack;
end;

procedure TForm1.edt2Exit(Sender: TObject);
begin
edt2.text:=SampleIp;
edt2.Font.Color:=clSilver;
end;

procedure TForm1.edt2KeyPress(Sender: TObject; var Key: Char);
var Ip2LocRec:TIP2LocationRecord;
begin
if not( Key in KeysSet) then
 key:=#0;
 if Key=#13 then
  try
   Ip2LocRec:=IP2Location_get_country_all(Ip2Loc,pchar(edt2.Text));
    with lv1.Items.Add,Ip2LocRec do
      begin
       Caption:=edt2.Text;
       SubItems.Add(country_short);
       SubItems.Add(country_long);
       SubItems.Add(region);
       SubItems.Add(city);
       SubItems.Add(Format('%0.6f',[latitude]));
       SubItems.Add(Format('%0.6f',[longitude]));
       SubItems.Add(zipcode);
       SubItems.Add(timezone);
       SubItems.Add(isp);
       SubItems.Add(domain);
       SubItems.Add(netspeed);
       SubItems.Add(areacode);
       SubItems.Add(weatherstationname);
       SubItems.Add(mobilebrand);
       SubItems.Add(FloatToStr(elevation));
       SubItems.Add(usagetype);
      end;
   except

   end;
end;
procedure TForm1.tmr1Timer(Sender: TObject);
begin
 stat1.Panels[3].Text:=FormatDateTime('DD-MM-YYYY HH:NN:SS',now);
end;

end.
