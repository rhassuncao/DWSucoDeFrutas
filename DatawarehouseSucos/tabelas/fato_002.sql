CREATE TABLE [dbo].[fato_002]
(
	[cod_cliente] NVARCHAR(50) NOT NULL , 
    [cod_produto] NVARCHAR(50) NOT NULL, 
    [cod_fabrica] NVARCHAR(50) NOT NULL, 
    [cod_dia] NVARCHAR(50) NOT NULL, 
    [frete] FLOAT NULL,
    CONSTRAINT [FK_fato_002_dim_cliente] FOREIGN KEY ([cod_cliente]) REFERENCES [dim_cliente]([cod_cliente]), 
    CONSTRAINT [FK_fato_002_dim_produto] FOREIGN KEY ([cod_produto]) REFERENCES [dim_produto]([cod_produto]), 
    CONSTRAINT [FK_fato_002_dim_fabrica] FOREIGN KEY ([cod_fabrica]) REFERENCES [dim_fabrica]([cod_fabrica]), 
    CONSTRAINT [FK_fato_002_dim_dia] FOREIGN KEY ([cod_dia]) REFERENCES [dim_tempo]([cod_dia]), 
    CONSTRAINT [PK_fato_002] PRIMARY KEY ([cod_dia], [cod_fabrica], [cod_produto], [cod_cliente])
)