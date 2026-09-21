object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 896
  ClientWidth = 1664
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 15
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1664
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object lblTitulo: TLabel
      Left = 24
      Top = 20
      Width = 90
      Height = 32
      Caption = 'Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 24
      Top = 54
      Width = 230
      Height = 15
      Caption = 'Gerencie os clientes cadastrados no sistema'
    end
    object btnNovo: TButton
      Left = 1394
      Top = 37
      Width = 140
      Height = 38
      Caption = '+ Novo cliente'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 1539
      Top = 37
      Width = 140
      Height = 38
      Caption = 'Editar cliente'
      TabOrder = 1
      OnClick = btnEditarClick
    end
  end
  object pnlLista: TPanel
    Left = 0
    Top = 110
    Width = 1664
    Height = 786
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object grdClientes: TDBGrid
      Left = 0
      Top = 0
      Width = 1664
      Height = 786
      Align = alClient
      DataSource = dsClientes
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Title.Caption = 'Documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'Email'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO_DESC'
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTH_CADASTRO'
          Title.Caption = 'Cadastro'
          Visible = True
        end>
    end
  end
  object dsClientes: TDataSource
    Left = 64
    Top = 144
  end
end
