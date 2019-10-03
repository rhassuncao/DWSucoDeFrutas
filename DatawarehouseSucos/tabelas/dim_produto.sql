CREATE TABLE [dbo].[dim_produto]
(
	[cod_produto] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_produto] NVARCHAR(200) NULL, 
    [atr_tamanho] NVARCHAR(200) NULL, 
    [atr_sabor] NVARCHAR(200) NULL, 
    [cod_marca] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_dim_produto_ToTable] FOREIGN KEY ([cod_marca]) REFERENCES [dim_marca]([cod_marca])
)
