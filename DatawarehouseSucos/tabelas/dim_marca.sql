CREATE TABLE [dbo].[dim_marca]
(
	[cod_marca] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_marca] NVARCHAR(200) NULL, 
    [cod_categoria] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_dim_marca_dim_categoria] FOREIGN KEY ([cod_categoria]) REFERENCES [dim_categoria]([cod_categoria]) 
)
