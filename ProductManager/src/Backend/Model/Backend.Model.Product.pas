unit Backend.Model.Product;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Data.DB;

type
  TProduct = class
  private
    FId: Integer;
    FName: string;
    FPrice: Double;
    FDescription: string;
    FManufacturer: string;
  public
    // Propriedades
    property Id: Integer read FId write FId;
    property Name: string read FName write FName;
    property Price: Double read FPrice write FPrice;
    property Description: string read FDescription write FDescription;
    property Manufacturer: string read FManufacturer write FManufacturer;
  end;

implementation

end.
