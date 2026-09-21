object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o Comercial'
  ClientHeight = 1000
  ClientWidth = 1900
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object pnlAreaPrincipal: TPanel
    Left = 220
    Top = 0
    Width = 1680
    Height = 1000
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 1680
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object pnlConteudo: TPanel
      Left = 0
      Top = 65
      Width = 1680
      Height = 935
      Align = alClient
      BevelOuter = bvNone
      Color = 15329769
      ParentBackground = False
      TabOrder = 1
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 220
    Height = 1000
    Align = alLeft
    BevelOuter = bvNone
    Color = 3877150
    ParentBackground = False
    TabOrder = 0
    object pnlLogo: TPanel
      Left = 0
      Top = 0
      Width = 220
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      Color = 3877150
      ParentBackground = False
      TabOrder = 0
      object lblSistema: TLabel
        Left = 28
        Top = 28
        Width = 165
        Height = 28
        Alignment = taCenter
        Caption = 'Gest'#227'o Comercial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlUsuarios: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 93
      Width = 214
      Height = 50
      Cursor = crHandPoint
      Align = alTop
      BevelOuter = bvNone
      Color = 8404992
      ParentBackground = False
      TabOrder = 1
      OnClick = pnlUsuariosClick
      OnMouseEnter = MenuMouseEnter
      OnMouseLeave = MenuMouseLeave
      ExplicitLeft = 0
      ExplicitTop = 90
      ExplicitWidth = 220
      object lblUsuarios: TLabel
        Left = 20
        Top = 15
        Width = 53
        Height = 17
        Cursor = crHandPoint
        AutoSize = False
        Caption = 'Usu'#225'rios'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = pnlUsuariosClick
        OnMouseEnter = MenuMouseEnter
        OnMouseLeave = MenuMouseLeave
      end
    end
    object pnlClientes: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 149
      Width = 214
      Height = 50
      Cursor = crHandPoint
      Align = alTop
      BevelOuter = bvNone
      Color = 8404992
      ParentBackground = False
      TabOrder = 2
      OnClick = pnlClientesClick
      OnMouseEnter = MenuMouseEnter
      OnMouseLeave = MenuMouseLeave
      ExplicitLeft = 0
      ExplicitTop = 140
      ExplicitWidth = 220
      object lblClientes: TLabel
        Left = 20
        Top = 15
        Width = 53
        Height = 17
        Cursor = crHandPoint
        AutoSize = False
        Caption = 'Clientes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnClick = pnlClientesClick
        OnMouseEnter = MenuMouseEnter
        OnMouseLeave = MenuMouseLeave
      end
    end
  end
end
