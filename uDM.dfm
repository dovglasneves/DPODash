object DM: TDM
  OldCreateOrder = False
  Height = 304
  Width = 398
  object QueryCli: TFDQuery
    Active = True
    Connection = FDConn
    SQL.Strings = (
      'select * from clientes;')
    Left = 32
    Top = 128
    object QueryCliid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryClinome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
    object QueryClisexo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 2
    end
    object QueryCliendereco: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 40
    end
    object QueryClibairro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 10
    end
    object QueryClicidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
    end
    object QueryCliuf: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object QueryCliemail: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 80
    end
    object QueryClitelefone: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object QueryClicelular: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      Size = 14
    end
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=dpo'
      'User_Name=root'
      'Server=localhost'
      'CharacterSet=utf8'
      'Password=615147Dnb*'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object MySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\Embarcadero\Studio\20.0\bin\libmysql.dll'
    Left = 32
    Top = 72
  end
end
