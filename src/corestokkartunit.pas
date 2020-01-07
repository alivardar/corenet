unit corestokkartunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, ZConnection, ZDataset,functionconfig;

type

  { Tstokkart }

  Tstokkart = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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
  stokkart: Tstokkart;

implementation

{ Tstokkart }

procedure Tstokkart.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

procedure Tstokkart.FormShow(Sender: TObject);
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
  {$I corestokkartunit.lrs}

end.

