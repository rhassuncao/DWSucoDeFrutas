CREATE TABLE [dbo].[fato_004]
(
	[cod_cliente] NVARCHAR(50) NOT NULL , 
    [cod_produto] NVARCHAR(50) NOT NULL, 
    [cod_organizacional] NVARCHAR(50) NOT NULL,  
    [cod_dia] NVARCHAR(50) NOT NULL, 
    [meta_faturamento] FLOAT NULL, 
    PRIMARY KEY ([cod_cliente], [cod_produto], [cod_organizacional], [cod_dia]), 
    CONSTRAINT [FK_fato_004_dim_cliente] FOREIGN KEY ([cod_cliente]) REFERENCES [dim_cliente]([cod_cliente]), 
    CONSTRAINT [FK_fato_004_dim_produto] FOREIGN KEY ([cod_produto]) REFERENCES [dim_produto]([cod_produto]), 
    CONSTRAINT [FK_fato_004_dim_organizacional] FOREIGN KEY ([cod_organizacional]) REFERENCES [dim_organizacional]([cod_filho]), 
    CONSTRAINT [FK_fato_004_dim_dia] FOREIGN KEY ([cod_dia]) REFERENCES [dim_tempo]([cod_dia])
)
