object DMConn: TDMConn
  Height = 480
  Width = 640
  object FDConn: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=product_db'
      'User_Name=postgres'
      'Password=1234'
      'DriverID=PG')
    Left = 248
    Top = 184
  end
end
