object Principal: TPrincipal
  Left = 0
  Top = 0
  ActiveControl = Button2
  Caption = 'Principal'
  ClientHeight = 590
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 376
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 193
    Width = 731
    Height = 397
    Align = alClient
    ShowCaption = False
    TabOrder = 1
    object Label7: TLabel
      Left = 1
      Top = 383
      Width = 729
      Height = 13
      Align = alBottom
      ExplicitWidth = 3
    end
    object Strdatos: TStringGrid
      Left = 1
      Top = 1
      Width = 729
      Height = 382
      Align = alClient
      ColCount = 4
      DefaultColWidth = 181
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goEditing, goRowSelect, goFixedRowClick]
      ScrollBars = ssVertical
      TabOrder = 0
      OnDblClick = StrdatosDblClick
      RowHeights = (
        26)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 193
    Align = alTop
    ShowCaption = False
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 85
      Width = 37
      Height = 13
      Caption = 'Cedula:'
    end
    object Label2: TLabel
      Left = 268
      Top = 85
      Width = 41
      Height = 13
      Caption = 'Nombre:'
    end
    object Label3: TLabel
      Left = 262
      Top = 117
      Width = 47
      Height = 13
      Caption = 'Direccion:'
    end
    object Label4: TLabel
      Left = 23
      Top = 112
      Width = 46
      Height = 13
      Caption = 'Telefono:'
    end
    object Label5: TLabel
      Left = 200
      Top = 16
      Width = 308
      Height = 23
      Caption = 'Luis Guillermo Estrada Pepicano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 315
      Top = 45
      Width = 68
      Height = 13
      Caption = '19/11/2022'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 666
      Top = 157
      Width = 3
      Height = 13
    end
    object Label9: TLabel
      Left = 684
      Top = 157
      Width = 3
      Height = 13
    end
    object txtDireccion: TEdit
      Left = 315
      Top = 109
      Width = 382
      Height = 21
      Hint = 'Ingrese numero telefonico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TextHint = 'Ingrese direccion de residencia'
    end
    object txtTelefono: TEdit
      Left = 75
      Top = 109
      Width = 166
      Height = 21
      Hint = 'Ingrese numero telefonico'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TextHint = 'Ingrese direccion de residencia'
    end
    object txtNombre: TEdit
      Left = 313
      Top = 82
      Width = 382
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = 'Ingrese nombre completo'
    end
    object txtCedula: TEdit
      Left = 75
      Top = 82
      Width = 166
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Ingrese numero de cedula'
    end
    object btnEliminar: TButton
      Left = 167
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 4
      OnClick = btnEliminarClick
    end
    object btnActualizar: TButton
      Left = 292
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 5
      OnClick = btnActualizarClick
    end
    object btnInsertar: TButton
      Left = 412
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 6
      OnClick = btnInsertarClick
    end
  end
end
