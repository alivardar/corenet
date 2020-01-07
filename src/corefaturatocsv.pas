unit corefaturatocsv;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcsvexport, FileUtil, LResources, Forms, Controls,
  Graphics, Dialogs, EditBtn, StdCtrls, Buttons, ZConnection, ZDataset, fpDBExport,
  functionconfig;

type

  { Tfaturahareketlericsvaktar }

  Tfaturahareketlericsvaktar = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CSVExporter1: TCSVExporter;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DirectoryEdit1: TDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  faturahareketlericsvaktar: Tfaturahareketlericsvaktar;

implementation

{ Tfaturahareketlericsvaktar }



procedure Tfaturahareketlericsvaktar.BitBtn1Click(Sender: TObject);
begin

try
//SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

ZReadOnlyQuery1.SQL.Text:='SELECT carihesapid, faturano, tarih, hareketturu, borcalacak, tutar FROM corecarihareket where tarih between '+
' "'+SQLTarih(DateEdit1.Date)+ '" and "'+ SQLTarih(DateEdit2.Date)+'"';

//inputbox('','',ZReadOnlyQuery1.SQL.Text);
ZReadOnlyQuery1.Active:=True;

CSVExporter1.FileName:=DirectoryEdit1.Text+'faturalartotext.csv';
CSVExporter1.Execute;
finally
ShowMessage('Dosya belirtilen dizin içine oluşturulmuştur.');
end;

end;

procedure Tfaturahareketlericsvaktar.BitBtn2Click(Sender: TObject);
begin
  Self.Free;
end;



initialization
  {$I corefaturatocsv.lrs}

end.

