object frmClienteCadastro: TfrmClienteCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Novo cliente'
  ClientHeight = 300
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 24
    Top = 20
    Width = 112
    Height = 25
    Caption = 'Novo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNome: TLabel
    Left = 24
    Top = 64
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object lblDocumento: TLabel
    Left = 244
    Top = 64
    Width = 65
    Height = 15
    Caption = 'Documento'
  end
  object lblEmail: TLabel
    Left = 24
    Top = 124
    Width = 29
    Height = 15
    Caption = 'Email'
  end
  object lblTelefone: TLabel
    Left = 244
    Top = 124
    Width = 46
    Height = 15
    Caption = 'Telefone'
  end
  object edtNome: TEdit
    Left = 24
    Top = 84
    Width = 200
    Height = 23
    TabOrder = 0
  end
  object edtDocumento: TEdit
    Left = 244
    Top = 84
    Width = 200
    Height = 23
    TabOrder = 1
  end
  object edtEmail: TEdit
    Left = 24
    Top = 144
    Width = 200
    Height = 23
    TabOrder = 2
  end
  object edtTelefone: TEdit
    Left = 244
    Top = 144
    Width = 200
    Height = 23
    TabOrder = 3
  end
  object chkAtivo: TCheckBox
    Left = 24
    Top = 188
    Width = 121
    Height = 17
    Caption = 'Cliente ativo'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object btnCancelar: TButton
    Left = 244
    Top = 236
    Width = 95
    Height = 32
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object btnSalvar: TButton
    Left = 349
    Top = 236
    Width = 95
    Height = 32
    Caption = 'Salvar'
    Default = True
    TabOrder = 6
    OnClick = btnSalvarClick
  end
end
