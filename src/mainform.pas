unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, INIFiles,
  Dialogs, Menus, ExtCtrls,  ComCtrls,  functionconfig,
  ZConnection, ZDataset, tariflerunit, coreusersunit, coreradiusserversunit,
  corevergioranlariunit, coreabout, corenewcustomerunit, coretekfaturakesunit,
  corekasaunit, corestokkartunit, corestokhareketunit, coreyenistokhareketiunit,
  coretahsilattediye, coredigertahsilattediye, corecarilistesi,
  corebankalarhesaplar, corebankatahsilattediye, corebankayatirmacekme,
  corebankadanparacekme, corehataturleri,
  coreyenihatakaydi, corekullanicihaklari, coreerisimradiusayarlari,
  coreerisimsonladirma ,coredesteksonlandirma, corebankahesaphareketleri,
  coreloginscreen, corenewcorenetusers, coreaktifdesteklistesi,
  corehizmetturleri, corefaturakesme, corefaturakesmemal,
  corefaturalistesi, coreindirimturleri, coreilaveturleri, abonelikbaslatma,
  aboneliksonladirma, coremusteriyetkilisitanimlama,corecarihesaphareketleri,
  corefaturatocsv, TAGraph
   ;

type

  { Tmainscreen }

  Tmainscreen = class(TForm)

    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem8: TMenuItem;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    Vergi: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem9: TMenuItem;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;





    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvNavigationPane1Change(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem48Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem53Click(Sender: TObject);
    procedure MenuItem54Click(Sender: TObject);
    procedure MenuItem55Click(Sender: TObject);
    procedure MenuItem56Click(Sender: TObject);
    procedure MenuItem57Click(Sender: TObject);
    procedure MenuItem58Click(Sender: TObject);

    procedure MenuItem59Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem60Click(Sender: TObject);
    procedure MenuItem63Click(Sender: TObject);
    procedure MenuItem65Click(Sender: TObject);
    procedure MenuItem67Click(Sender: TObject);
    procedure MenuItem69Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem70Click(Sender: TObject);
    procedure MenuItem71Click(Sender: TObject);
    procedure MenuItem72Click(Sender: TObject);
    procedure MenuItem73Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure Page1BeforeShow(ASender: TObject; ANewPage: TPage;
      ANewIndex: Integer);

    procedure plSideBar1Select(Sender: TObject; Index, SubIndex: Integer;
      aCaption: string);
    procedure Splitter1CanOffset(Sender: TObject; var NewOffset: Integer;
      var Accept: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure VergiClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  mainscreen: Tmainscreen;

implementation

{ Tmainscreen }


procedure Tmainscreen.MenuItem11Click(Sender: TObject);
begin
  Application.CreateForm(Tstokkart, stokkart);
  stokkart.ShowModal;
  stokkart.Free;
end;

procedure Tmainscreen.MenuItem10Click(Sender: TObject);
begin
Application.CreateForm(Tuserrights, userrights);
userrights.ShowModal;
userrights.Free;
end;

procedure Tmainscreen.FormShow(Sender: TObject);
var
bekleyen, cozulen  : integer;
//kullanıcı hakları
ccari, cerisim, cfatura, ckasa, cbanka, cstok, cdestek, cayarlar : string;
begin

//SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

//Version Numarası ve Uygulama başlığı yazılacak
 mainscreen.Caption :='CoreNet ISP Automatization Software '+versionnumber;

//barchat düzenleme
  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select count(*) from corehatalistesi where durum="Aktif";';
  ZReadOnlyQuery1.Active:=True;

  bekleyen:=ZReadOnlyQuery1.FieldByName('count(*)').AsInteger;

  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select count(*) from corehatalistesi where durum="Pasif";';
  ZReadOnlyQuery1.Active:=True;

  cozulen:=ZReadOnlyQuery1.FieldByName('count(*)').AsInteger;


  //Haklara göre menüyü düzenleme

  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select cari, fatura, kasa, banka, stok, sorun, ayarlar, erisim from coreusers where username="'+corekullaniciadi+'";';
  ZReadOnlyQuery1.Active:=True;

  ccari:=ZReadOnlyQuery1.FieldByName('cari').AsString;
  cerisim:=ZReadOnlyQuery1.FieldByName('erisim').AsString;
  cfatura:=ZReadOnlyQuery1.FieldByName('fatura').AsString;
  ckasa:=ZReadOnlyQuery1.FieldByName('kasa').AsString;
  cbanka:=ZReadOnlyQuery1.FieldByName('banka').AsString;
  cstok:=ZReadOnlyQuery1.FieldByName('stok').AsString;
  cdestek:=ZReadOnlyQuery1.FieldByName('sorun').AsString;
  cayarlar:=ZReadOnlyQuery1.FieldByName('ayarlar').AsString;

  if ccari='N' then MenuItem2.Visible:=False;
  if cerisim='N' then MenuItem45.Visible:=False;
  if cfatura='N' then MenuItem3.Visible:=False;
  if ckasa='N' then MenuItem26.Visible:=False;
  if cbanka='N' then MenuItem23.Visible:=False;
  if cstok='N' then MenuItem1.Visible:=False;
  if cdestek='N' then MenuItem20.Visible:=False;
  if cayarlar='N' then MenuItem4.Visible:=False;

  ZReadOnlyQuery1.Active:=False;

  //KDV ve oiv yüzdesi okunacak
  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='SELECT kdvorani, oivorani FROM corevergiler';
  ZReadOnlyQuery1.Active:=True;

  kdvyuzdesi:=ZReadOnlyQuery1.FieldByName('kdvorani').AsInteger;
  oivyuzdesi:=ZReadOnlyQuery1.FieldByName('oivorani').AsInteger;
  ZReadOnlyQuery1.Active:=False;
//Showmessage(inttostr(kdvyuzdesi)+'   :  '+inttostr(oivyuzdesi));

end;

procedure Tmainscreen.JvNavigationPane1Change(Sender: TObject);
begin

end;

//***************************************************

procedure Tmainscreen.FormCreate(Sender: TObject);
Var
 INI:TINIFile;
 Author,Pass,DBFile:String;
 PassEnter:String;
 ConfigFilePath:String;

begin

  //read config file
  {$ifdef win32}
   ConfigFilePath := ExtractFilePath(Application.EXEName) + 'corenet.conf';
  {$endif}
  {$ifdef Unix}
   ConfigFilePath := GetAppConfigFile(False) + '.conf';
  {$endif}

  INI := TINIFile.Create(ConfigFilePath);
  mysqlserver := INI.ReadString('General','mysqlserver','');
  mysqlusername := INI.ReadString('General','mysqlusername','');
  mysqlpassword := INI.ReadString('General','mysqlpassword','');
  mysqldbname := INI.ReadString('General','mysqldbname','');

  Ini.Free;

  //Application.CreateForm(Tcoreloginscreen, coreloginscreen);
  //coreloginscreen.showmodal;
  //coreloginscreen.Free;
end;

//***************************************************

procedure Tmainscreen.FormDestroy(Sender: TObject);
begin
  ZConnection1.Connected:=False;
  Application.Terminate;
end;

procedure Tmainscreen.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    ZConnection1.Connected:=False;
    Application.Terminate;
end;


procedure Tmainscreen.MenuItem12Click(Sender: TObject);
begin
  Application.CreateForm(Tdigertahsilattediye, digertahsilattediye);
  digertahsilattediye.ShowModal;
  digertahsilattediye.Free;
end;


procedure Tmainscreen.MenuItem14Click(Sender: TObject);
begin
  Application.CreateForm(Tradiuservers, radiuservers);
  radiuservers.ShowModal;
  radiuservers.Free;
end;

procedure Tmainscreen.MenuItem16Click(Sender: TObject);
begin
  Application.CreateForm(Tabout, about);
  about.ShowModal;
  about.Free;
end;

procedure Tmainscreen.MenuItem17Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem18Click(Sender: TObject);
begin
  Application.CreateForm(Tnewstockrecord, newstockrecord);
  newstockrecord.showmodal;
  newstockrecord.Free;
end;

procedure Tmainscreen.MenuItem19Click(Sender: TObject);
begin
    Application.CreateForm(Tfaturalistesi, faturalistesi);
    faturalistesi.ShowModal;
    faturalistesi.Free;
end;

procedure Tmainscreen.MenuItem21Click(Sender: TObject);
begin
    Application.CreateForm(Tyenihatakaydi, yenihatakaydi);
    yenihatakaydi.ShowModal;
    yenihatakaydi.Free;
end;

procedure Tmainscreen.MenuItem22Click(Sender: TObject);
begin
    Application.CreateForm(Tyenicorenetuser, yenicorenetuser);
    yenicorenetuser.showmodal;
    yenicorenetuser.Free;
end;

procedure Tmainscreen.MenuItem24Click(Sender: TObject);
begin
    Application.CreateForm(Tbankatahsilattediye, bankatahsilattediye);
    bankatahsilattediye.ShowModal;
    bankatahsilattediye.Free;
end;

procedure Tmainscreen.MenuItem25Click(Sender: TObject);
begin
    Application.CreateForm(Tbankalarhesaplar, bankalarhesaplar);
    bankalarhesaplar.showmodal;
    bankalarhesaplar.Free;
end;

procedure Tmainscreen.MenuItem27Click(Sender: TObject);
begin
  Application.CreateForm(Tcorekasa, corekasa);
  corekasa.showmodal;
  corekasa.Free;
end;

procedure Tmainscreen.MenuItem28Click(Sender: TObject);
begin
   Application.CreateForm(Tbankayaparayatirma, bankayaparayatirma);
   bankayaparayatirma.ShowModal;
   bankayaparayatirma.Free;
end;

procedure Tmainscreen.MenuItem30Click(Sender: TObject);
begin
    Application.CreateForm(Tbankadanparacekme, bankadanparacekme);
    bankadanparacekme.ShowModal;
    bankadanparacekme.Free;
end;

procedure Tmainscreen.MenuItem31Click(Sender: TObject);
begin
    Application.CreateForm(Taktifdesteklistesi, aktifdesteklistesi);
    aktifdesteklistesi.showmodal;
    aktifdesteklistesi.Free;
end;

procedure Tmainscreen.MenuItem33Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem34Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem35Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem36Click(Sender: TObject);
begin
    Application.CreateForm(Tfaturakesmehizmet, faturakesmehizmet);
    faturakesmehizmet.showmodal;
    faturakesmehizmet.Free;
end;

procedure Tmainscreen.MenuItem37Click(Sender: TObject);
begin
    Application.CreateForm(Tbankahesaphareketleri, bankahesaphareketleri);
    bankahesaphareketleri.ShowModal;
    bankahesaphareketleri.Free;
end;

procedure Tmainscreen.MenuItem38Click(Sender: TObject);
begin
    Application.CreateForm(Tcaritahsilattediye, caritahsilattediye);
    caritahsilattediye.showmodal;
    caritahsilattediye.Free;
end;

procedure Tmainscreen.MenuItem39Click(Sender: TObject);
begin
  Application.CreateForm(Tfaturakesmemal, faturakesmemal);
  faturakesmemal.showmodal;
  faturakesmemal.Free;
end;

procedure Tmainscreen.MenuItem41Click(Sender: TObject);
begin
    Application.CreateForm(Tdesteksonlandirma, desteksonlandirma);
    desteksonlandirma.ShowModal;
    desteksonlandirma.Free;
end;

procedure Tmainscreen.MenuItem42Click(Sender: TObject);
begin
  Application.CreateForm(Tcarilistesi, carilistesi);
  carilistesi.showmodal;
  carilistesi.Free;
end;

procedure Tmainscreen.MenuItem43Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure Tmainscreen.MenuItem44Click(Sender: TObject);
begin
    Application.CreateForm(Thataturleri, hataturleri);
    hataturleri.ShowModal;
    hataturleri.Free;
end;

procedure Tmainscreen.MenuItem46Click(Sender: TObject);
begin
    Application.CreateForm(Terisimsonladirma, erisimsonladirma);
    erisimsonladirma.showmodal;
    erisimsonladirma.Free;
end;

procedure Tmainscreen.MenuItem47Click(Sender: TObject);
begin
    Application.CreateForm(Terisimradiusayarlari, erisimradiusayarlari);
    erisimradiusayarlari.ShowModal;
    erisimradiusayarlari.Free;
end;

procedure Tmainscreen.MenuItem48Click(Sender: TObject);
begin
    Application.CreateForm(Thizmetturleri, hizmetturleri);
    hizmetturleri.ShowModal;
    hizmetturleri.Free;
end;

procedure Tmainscreen.MenuItem49Click(Sender: TObject);
begin
    Application.CreateForm(Tfaturahareketlericsvaktar, faturahareketlericsvaktar);
    faturahareketlericsvaktar.ShowModal;
    faturahareketlericsvaktar.Free;
end;

procedure Tmainscreen.MenuItem53Click(Sender: TObject);
begin
    Application.CreateForm(Tindirimturleri, indirimturleri);
    indirimturleri.showmodal;
    indirimturleri.Free;
end;

procedure Tmainscreen.MenuItem54Click(Sender: TObject);
begin
    Application.CreateForm(Tilaveturleri, ilaveturleri);
    ilaveturleri.showmodal;
    ilaveturleri.free;
end;

procedure Tmainscreen.MenuItem55Click(Sender: TObject);
begin
    Application.CreateForm(Tabonelikbaslatmaform, abonelikbaslatmaform);
    abonelikbaslatmaform.ShowModal;
    abonelikbaslatmaform.Free;
end;

procedure Tmainscreen.MenuItem56Click(Sender: TObject);
begin
    Application.CreateForm(Tmusteriyetkilisitanimlama, musteriyetkilisitanimlama);
    musteriyetkilisitanimlama.ShowModal;
    musteriyetkilisitanimlama.Free;
end;

procedure Tmainscreen.MenuItem57Click(Sender: TObject);
begin
    Application.CreateForm(Taboneliksonlandirmaform, aboneliksonlandirmaform);
    aboneliksonlandirmaform.ShowModal;
    aboneliksonlandirmaform.Free;
end;

procedure Tmainscreen.MenuItem58Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem59Click(Sender: TObject);
begin

end;



procedure Tmainscreen.MenuItem5Click(Sender: TObject);
begin
  Application.CreateForm(Tcoreusers, coreusers);
  coreusers.showmodal;
  coreusers.Free;
end;

procedure Tmainscreen.MenuItem60Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem63Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem65Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem67Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem69Click(Sender: TObject);
begin

end;


procedure Tmainscreen.MenuItem6Click(Sender: TObject);
begin
  Application.CreateForm(Tstokhareketleri, stokhareketleri);
  stokhareketleri.showmodal;
  stokhareketleri.Free;
end;

procedure Tmainscreen.MenuItem70Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem71Click(Sender: TObject);
begin

end;


procedure Tmainscreen.MenuItem72Click(Sender: TObject);
begin
    Application.CreateForm(Tcarihesaphareketleri, carihesaphareketleri);
    carihesaphareketleri.ShowModal;
    carihesaphareketleri.Free;
end;

procedure Tmainscreen.MenuItem73Click(Sender: TObject);
begin

end;

procedure Tmainscreen.MenuItem7Click(Sender: TObject);
begin
  Application.CreateForm(Tyenimusteri, yenimusteri);
  yenimusteri.ShowModal;
  yenimusteri.Free;
end;

procedure Tmainscreen.MenuItem9Click(Sender: TObject);
begin
  Application.CreateForm(Ttarifeler, tarifeler);
  tarifeler.showmodal;
  tarifeler.Free;
end;

procedure Tmainscreen.Page1BeforeShow(ASender: TObject; ANewPage: TPage;
  ANewIndex: Integer);
begin

end;



procedure Tmainscreen.plSideBar1Select(Sender: TObject; Index,
  SubIndex: Integer; aCaption: string);
begin

end;

procedure Tmainscreen.Splitter1CanOffset(Sender: TObject;
  var NewOffset: Integer; var Accept: Boolean);
begin

end;



procedure Tmainscreen.Timer1Timer(Sender: TObject);
var
bekleyen, cozulen : integer;
begin
  ZConnection1.Connected:=True;

  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select count(*) from corehatalistesi where durum="Aktif";';
  ZReadOnlyQuery1.Active:=True;

  bekleyen:=ZReadOnlyQuery1.FieldByName('count(*)').AsInteger;

  ZReadOnlyQuery1.Active:=False;
  ZReadOnlyQuery1.SQL.Text:='select count(*) from corehatalistesi where durum="Pasif";';
  ZReadOnlyQuery1.Active:=True;

  cozulen:=ZReadOnlyQuery1.FieldByName('count(*)').AsInteger;


  ZConnection1.Connected:=False;
end;

procedure Tmainscreen.ToolButton6Click(Sender: TObject);
begin

end;


procedure Tmainscreen.VergiClick(Sender: TObject);
begin
  Application.CreateForm(Tvergioranlari, vergioranlari);
  vergioranlari.showmodal;
  vergioranlari.Free;
end;

initialization
  {$I mainform.lrs}

end.

