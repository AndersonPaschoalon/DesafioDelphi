unit Backend.Model.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TDMConn = class(TDataModule)
    FDConn: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
