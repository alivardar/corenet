unit corenewcorenetusers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls, Buttons, ZConnection, ZDataset, functionconfig;

type

  { Tyenicorenetuser }

  Tyenicorenetuser = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  yenicorenetuser: Tyenicorenetuser;

implementation

{ Tyenicorenetuser }





procedure Tyenicorenetuser.BitBtn3Click(Sender: TObject);
begin
  try
  ZQuery1.SQL.Text:='insert into coreusers (username, password, fullname) values ( "'+ Edit2.Text + '", md5("'+
   Edit3.Text +'"), "'+ Edit1.Text +'" )';
  ZQuery1.ExecSQL;
  finally
  ShowMessage('Kullanıcı oluşturulmuştur.');
  end;
end;

procedure Tyenicorenetuser.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;

end;

procedure Tyenicorenetuser.BitBtn1Click(Sender: TObject);
begin
  Self.Free;
end;

initialization
  {$I corenewcorenetusers.lrs}

end.

