object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Acesso - Gest'#227'o Comercial'
  ClientHeight = 300
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  TextHeight = 17
  object pnlEsquerdo: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 300
    Align = alLeft
    BevelOuter = bvNone
    Color = 3877150
    ParentBackground = False
    TabOrder = 0
    object lblTituloSistema: TLabel
      Left = 28
      Top = 72
      Width = 199
      Height = 32
      Caption = 'Gest'#227'o Comercial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFrase: TLabel
      Left = 28
      Top = 149
      Width = 191
      Height = 34
      Alignment = taCenter
      Caption = 'Controle sua empresa de forma simples.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object pnlLogin: TPanel
    Left = 260
    Top = 0
    Width = 340
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblUsuario: TLabel
      Left = 18
      Top = 40
      Width = 71
      Height = 21
      Caption = 'USU'#193'RIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3877150
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 18
      Top = 128
      Width = 54
      Height = 21
      Caption = 'SENHA'
      Font.Charset = ANSI_CHARSET
      Font.Color = 3877150
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object shpLinhaUsuario: TShape
      Left = 18
      Top = 97
      Width = 297
      Height = 2
      Brush.Color = 3877150
      Pen.Style = psClear
    end
    object shpLinhaSenha: TShape
      Left = 18
      Top = 184
      Width = 297
      Height = 2
      Brush.Color = 3877150
      Pen.Style = psClear
    end
    object edtUsuario: TEdit
      Left = 18
      Top = 72
      Width = 297
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3877150
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Digite seu usu'#225'rio'
    end
    object edtSenha: TEdit
      Left = 18
      Top = 159
      Width = 297
      Height = 25
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3877150
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Digite sua senha'
    end
    object pnlEntrar: TPanel
      Left = 18
      Top = 224
      Width = 130
      Height = 36
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Entrar'
      Color = 3877150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = pnlEntrarClick
    end
  end
end
