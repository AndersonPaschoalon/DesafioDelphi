object DMConn: TDMConn
  Height = 480
  Width = 640
  object Product_db_connectionConnection: TFDConnection
    ConnectionName = 'FDConn'
    Params.Strings = (
      'LoginTimeout=2'
      'ConnectionDef=product_db_connection')
    LoginPrompt = False
    Left = 143
    Top = 80
  end
  object ProductTable: TFDQuery
    SQL.Strings = (
      'SELECT * FROM product')
    Left = 143
    Top = 128
  end
end