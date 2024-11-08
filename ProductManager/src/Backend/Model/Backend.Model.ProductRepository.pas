unit Backend.Model.ProductRepository;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  Data.DB,
  Backend.Model.Product,
  Backend.Model.DataModule,
  Backend.Data.vo.v1.ProductVO;


type
  TProductRepository = class
      public
        function GetAll(): TObjectList<TProduct>;
        function GetById(pId: Integer): TProduct;
        function CreateProduct(const AProduct: TProduct): Boolean;
        function UpdateProduct(const AProduct: TProduct): Boolean;
        function DeleteProduct(pId: Integer): Boolean;
  end;


implementation

function TProductRepository.GetAll(): TObjectList<TProduct>;
const
  SELECT_ALL = 'SELECT * FROM Product ORDER BY id';
var
  lProduct: TProduct;
  lListProducts: TObjectList<TProduct>;
  lDM: TDMConn;
  lDataSet: TDataSet;
begin
  lDM := TDMConn.Create(nil);

  try
    lListProducts := TObjectList<TProduct>.Create;
    lDM.FDConn.ExecSQL(SELECT_ALL, lDataSet);

    while not lDataSet.Eof do
    begin
       lProduct := TProduct.Create;

       lProduct.Id           := lDataSet.FieldByName('id').AsInteger;
       lProduct.Name         := lDataSet.FieldByName('name').AsString;
       lProduct.Manufacturer := lDataSet.FieldByName('manufacturer').AsString;
       lProduct.Price        := lDataSet.FieldByName('price').AsFloat;
       lProduct.Description  := lDataSet.FieldByName('description').AsString;

       lListProducts.Add(lProduct);
       lDataSet.Next;
    end;

    Result := lListProducts;
  finally
    lDM.Free;
    lDataSet.Free;
  end;
end;

function TProductRepository.GetById(pId: Integer): TProduct;
const
  SELECT_BY_ID = 'SELECT * FROM Product WHERE id = :id';
var
  lProduct: TProduct;
  lQuery: TFDQuery;
  lDM: TDMConn;
begin
  lDM := TDMConn.Create(nil);
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := lDM.FDConn;
    lQuery.SQL.Text := SELECT_BY_ID;
    lQuery.ParamByName('id').AsInteger := pId;
    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      lProduct := TProduct.Create;
      lProduct.Id           := lQuery.FieldByName('id').AsInteger;
      lProduct.Name         := lQuery.FieldByName('name').AsString;
      lProduct.Manufacturer := lQuery.FieldByName('manufacturer').AsString;
      lProduct.Price        := lQuery.FieldByName('price').AsFloat;
      lProduct.Description  := lQuery.FieldByName('description').AsString;
    end
    else
      lProduct := nil;

    Result := lProduct;
  finally
    lQuery.Free;
    lDM.Free;
  end;
end;

function TProductRepository.CreateProduct(const AProduct: TProduct): Boolean;
const
  INSERT_SQL = 'INSERT INTO Product (name, price, description, manufacturer) ' +
               'VALUES (:name, :price, :description, :manufacturer)';
var
  lDM: TDMConn;
begin
  lDM := TDMConn.Create(nil);
  try
    Result := lDM.FDConn.ExecSQL(INSERT_SQL, [AProduct.Name,
                                              AProduct.Price,
                                              AProduct.Description,
                                              AProduct.Manufacturer]) > 0;
  finally
    lDM.Free;
  end;
end;

function TProductRepository.UpdateProduct(const AProduct: TProduct): Boolean;
const
  UPDATE_SQL = 'UPDATE Product SET name = :name, price = :price, ' +
               'description = :description, manufacturer = :manufacturer WHERE id = :id';
var
  lDM: TDMConn;
begin
  lDM := TDMConn.Create(nil);
  try
    Result := lDM.FDConn.ExecSQL(UPDATE_SQL, [AProduct.Name,
                                              AProduct.Price,
                                              AProduct.Description,
                                              AProduct.Manufacturer,
                                              AProduct.Id]) > 0;
  finally
    lDM.Free;
  end;
end;

function TProductRepository.DeleteProduct(pId: Integer): Boolean;
const
  DELETE_SQL = 'DELETE FROM Product WHERE id = :id';
var
  lDM: TDMConn;
begin
  lDM := TDMConn.Create(nil);
  try
    Result := lDM.FDConn.ExecSQL(DELETE_SQL, [pId]) > 0;
  finally
    lDM.Free;
  end;
end;



end.

