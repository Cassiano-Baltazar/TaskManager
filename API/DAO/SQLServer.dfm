object SqlServerDAO: TSqlServerDAO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 329
  Width = 513
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=master'
      'User_Name=sa'
      'Password=SqlServer2022!'
      'Server=localhost'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 144
    Top = 76
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 268
    Top = 72
  end
end
