USE PORTFOLIO_GESTAO
GO

IF NOT EXISTS (
    SELECT 1
    FROM USUARIO
    WHERE LOGIN = 'admin'
)
BEGIN
    INSERT INTO USUARIO
    (
        NOME,
        LOGIN,
        SENHA_HASH,
        ATIVO
    )
    VALUES
    (
        'Administrador',
        'admin',
        '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92',
        1
    )
END
GO
