unit coreloginscreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ZConnection, ZDataset, functionconfig;

type

  { Tcoreloginscreen }

  Tcoreloginscreen = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ZConnection1: TZConnection;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 



implementation
{ Tcoreloginscreen }

procedure Tcoreloginscreen.BitBtn1Click(Sender: TObject);
var
sayi :integer;
begin

  passwordgecerli:=False;
  ZReadOnlyQuery1.SQL.Text:='select count(*) from coreusers where username="'+Edit1.Text+'" and password=md5("'+ Edit2.Text +'");';
  ZReadOnlyQuery1.Active:=True;
  sayi:=ZReadOnlyQuery1.FieldByName('count(*)').AsInteger;
  ZReadOnlyQuery1.Active:=False;

  if sayi = 1 then
  begin
    passwordgecerli:=True;
    corekullaniciadi:=Edit1.Text;
    Self.close;
  end
   else
  begin
    Label4.Caption:='User name or password error!';
  end;

end;

procedure Tcoreloginscreen.BitBtn2Click(Sender: TObject);
begin

end;

procedure Tcoreloginscreen.Edit1KeyPress(Sender: TObject; var Key: char);
begin
    If Key = #13 Then Begin
     SelectNext(Sender as TWinControl,True,True);
     Key:=#0;
   end;
end;

procedure Tcoreloginscreen.Edit2KeyPress(Sender: TObject; var Key: char);
begin
    If Key = #13 Then Begin
     SelectNext(Sender as TWinControl,True,True) ;
     Key:=#0;
   end;
end;

procedure Tcoreloginscreen.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if passwordgecerli=False then application.terminate;
end;

procedure Tcoreloginscreen.FormShow(Sender: TObject);
begin
  //SQL Connection bu alandan ayarlanacak
  ZConnection1.HostName:=mysqlserver;
  ZConnection1.Database:=mysqldbname;
  ZConnection1.User:=mysqlusername;
  ZConnection1.Password:=mysqlpassword;
  ZConnection1.Connected:=True;
end;



initialization
  {$I coreloginscreen.lrs}

end.

