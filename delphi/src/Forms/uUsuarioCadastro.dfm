object frmUsuarioCadastro: TfrmUsuarioCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Novo Usu'#225'rio'
  ClientHeight = 230
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 16
    Top = 8
    Width = 72
    Height = 15
    Caption = 'Novo Usu'#225'rio'
  end
  object lblNome: TLabel
    Left = 16
    Top = 51
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object lblLogin: TLabel
    Left = 192
    Top = 51
    Width = 30
    Height = 15
    Caption = 'Login'
  end
  object lblSenha: TLabel
    Left = 17
    Top = 116
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object edtNome: TEdit
    Left = 16
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtLogin: TEdit
    Left = 192
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtSenha: TEdit
    Left = 17
    Top = 137
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 2
  end
  object chkAtivo: TCheckBox
    Left = 192
    Top = 140
    Width = 97
    Height = 17
    Caption = 'Usu'#225'rio Ativo'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object btnCancelar: TButton
    Left = 157
    Top = 183
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object btnSalvar: TButton
    Left = 238
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Default = True
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnAlterarSenha: TButton
    Left = 17
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Alterar Senha'
    TabOrder = 6
    Visible = False
  end
end
