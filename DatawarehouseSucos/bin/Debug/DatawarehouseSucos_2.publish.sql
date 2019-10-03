﻿/*
Deployment script for DW_SUCOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 72d0467d-7eae-454c-a7b5-ecd45badea34 is skipped, element [dbo].[dim_categoria].[Id] (SqlSimpleColumn) will not be renamed to cod_categoria';


GO
PRINT N'Rename refactoring operation with key 6b9ffa46-3d83-436d-96c5-55ed1c729a07, fc698601-6ab7-435a-ac4f-d1824b61725a is skipped, element [dbo].[dim_marcar].[Id] (SqlSimpleColumn) will not be renamed to cod_marca';


GO
PRINT N'Rename refactoring operation with key 5d35e439-ec4d-4614-8bbc-470751ba3990 is skipped, element [dbo].[dim_marcar].[cod_marcar] (SqlSimpleColumn) will not be renamed to cod_categoria';


GO
PRINT N'Rename refactoring operation with key f0d723a6-4d26-4699-93c0-98410b52b41f is skipped, element [dbo].[FK_dim_marcar_ToTable] (SqlForeignKeyConstraint) will not be renamed to [FK_dim_marca_dim_categoria]';


GO
PRINT N'Rename refactoring operation with key db219a04-c9b9-4d2c-84e7-37a250742ff2 is skipped, element [dbo].[dim_produto].[Id] (SqlSimpleColumn) will not be renamed to cod_produto';


GO
PRINT N'Creating [dbo].[dim_categoria]...';


GO
CREATE TABLE [dbo].[dim_categoria] (
    [cod_categoria]  NVARCHAR (50)  NOT NULL,
    [desc_categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([cod_categoria] ASC)
);


GO
PRINT N'Creating [dbo].[dim_marca]...';


GO
CREATE TABLE [dbo].[dim_marca] (
    [cod_marca]     NVARCHAR (50)  NOT NULL,
    [desc_marca]    NVARCHAR (200) NULL,
    [cod_categoria] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([cod_marca] ASC)
);


GO
PRINT N'Creating [dbo].[dim_produto]...';


GO
CREATE TABLE [dbo].[dim_produto] (
    [cod_produto]  NVARCHAR (50)  NOT NULL,
    [desc_produto] NVARCHAR (200) NULL,
    [atr_tamanho]  NVARCHAR (200) NULL,
    [atr_sabor]    NVARCHAR (200) NULL,
    [cod_marca]    NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([cod_produto] ASC)
);


GO
PRINT N'Creating [dbo].[FK_dim_marca_dim_categoria]...';


GO
ALTER TABLE [dbo].[dim_marca] WITH NOCHECK
    ADD CONSTRAINT [FK_dim_marca_dim_categoria] FOREIGN KEY ([cod_categoria]) REFERENCES [dbo].[dim_categoria] ([cod_categoria]);


GO
PRINT N'Creating [dbo].[FK_dim_produto_ToTable]...';


GO
ALTER TABLE [dbo].[dim_produto] WITH NOCHECK
    ADD CONSTRAINT [FK_dim_produto_ToTable] FOREIGN KEY ([cod_marca]) REFERENCES [dbo].[dim_marca] ([cod_marca]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '72d0467d-7eae-454c-a7b5-ecd45badea34')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('72d0467d-7eae-454c-a7b5-ecd45badea34')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6b9ffa46-3d83-436d-96c5-55ed1c729a07')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6b9ffa46-3d83-436d-96c5-55ed1c729a07')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fc698601-6ab7-435a-ac4f-d1824b61725a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fc698601-6ab7-435a-ac4f-d1824b61725a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5d35e439-ec4d-4614-8bbc-470751ba3990')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5d35e439-ec4d-4614-8bbc-470751ba3990')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f0d723a6-4d26-4699-93c0-98410b52b41f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f0d723a6-4d26-4699-93c0-98410b52b41f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'db219a04-c9b9-4d2c-84e7-37a250742ff2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('db219a04-c9b9-4d2c-84e7-37a250742ff2')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[dim_marca] WITH CHECK CHECK CONSTRAINT [FK_dim_marca_dim_categoria];

ALTER TABLE [dbo].[dim_produto] WITH CHECK CHECK CONSTRAINT [FK_dim_produto_ToTable];


GO
PRINT N'Update complete.';


GO
