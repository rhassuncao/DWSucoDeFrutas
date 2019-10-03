CREATE TABLE [dbo].[fato_005]
( 
    [cod_produto] NVARCHAR(50) NOT NULL,  
    [cod_fabrica] NVARCHAR(50) NOT NULL, 
    [cod_dia] NVARCHAR(50) NOT NULL, 
    [meta_custo] FLOAT NULL, 
    PRIMARY KEY ([cod_produto], [cod_fabrica], [cod_dia]), 
    CONSTRAINT [FK_fato_005_dim_produto] FOREIGN KEY ([cod_produto]) REFERENCES [dim_produto]([cod_produto]), 
    CONSTRAINT [FK_fato_005_dim_fabrica] FOREIGN KEY ([cod_fabrica]) REFERENCES [dim_fabrica]([cod_fabrica]), 
    CONSTRAINT [FK_fato_005_dim_dia] FOREIGN KEY ([cod_dia]) REFERENCES [dim_tempo]([cod_dia])
)
