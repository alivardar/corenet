unit corekullanicihaklari;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, ZConnection, ZDataset,functionconfig;

type

  { Tuserrights }

  Tuserrights = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  userrights: Tuserrights;

implementation

{ Tuserrights }

procedure Tuserrights.BitBtn1Click(Sender: TObject);
begin
  self.Free;
end;

procedure Tuserrights.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

  ZTable1.Active:=True;
end;



initialization
  {$I corekullanicihaklari.lrs}

end.

