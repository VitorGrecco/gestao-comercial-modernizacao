object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rios'
  ClientHeight = 935
  ClientWidth = 1710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 15
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1710
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 25
      Top = 20
      Width = 99
      Height = 32
      Caption = 'Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 25
      Top = 55
      Width = 252
      Height = 15
      Caption = 'Gerencie os usu'#225'rios que tem acesso ao sistema'
    end
    object btnNovo: TButton
      Left = 1394
      Top = 37
      Width = 140
      Height = 38
      Caption = '+ Novo usu'#225'rio'
      TabOrder = 0
      OnClick = pnlNovoClick
    end
  end
  object pnlLista: TPanel
    Left = 0
    Top = 110
    Width = 1710
    Height = 825
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object grdUsuarios: TDBGrid
      Left = 0
      Top = 0
      Width = 1710
      Height = 825
      Align = alClient
      DataSource = dsUsuarios
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Login'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO_DESC'
          Title.Caption = 'Ativo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTH_CADASTRO'
          Title.Caption = 'Cadastro'
          Width = 160
          Visible = True
        end>
    end
  end
  object btnEditar: TButton
    Left = 1539
    Top = 37
    Width = 140
    Height = 38
    Caption = 'Editar usu'#225'rio'
    TabOrder = 2
    OnClick = pnlEditarClick
  end
  object dsUsuarios: TDataSource
    Left = 8
    Top = 160
  end
end
