CREATE TABLE [dbo].[fato_003]
(
    [cod_fabrica] NVARCHAR(50) NOT NULL, 
    [cod_dia] NVARCHAR(50) NOT NULL, 
    [custo_fixo] FLOAT NULL,
    CONSTRAINT [FK_fato_003_dim_fabrica] FOREIGN KEY ([cod_fabrica]) REFERENCES [dim_fabrica]([cod_fabrica]), 
    CONSTRAINT [FK_fato_003_dim_dia] FOREIGN KEY ([cod_dia]) REFERENCES [dim_tempo]([cod_dia]), 
    CONSTRAINT [PK_fato_003] PRIMARY KEY ([cod_dia], [cod_fabrica])
)