CREATE TABLE [dbo].[dim_organizacional]
(
	[cod_filho] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_filho] NVARCHAR(200) NULL, 
    [cod_pai] NVARCHAR(50) NULL, 
    [esquerda] INT NULL, 
    [direita] INT NULL, 
    [nivel] INT NULL, 
    CONSTRAINT [FK_dim_organizacional_dim_organizacional] FOREIGN KEY ([cod_pai]) REFERENCES [dim_organizacional]([cod_filho])
)
