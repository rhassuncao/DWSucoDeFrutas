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
PRINT N'Rename refactoring operation with key 96811e9e-ebf3-4040-946f-bf5f6c646a0c is skipped, element [dbo].[dim_organizacional].[Id] (SqlSimpleColumn) will not be renamed to cod_filho';


GO
PRINT N'Creating [dbo].[dim_organizacional]...';


GO
CREATE TABLE [dbo].[dim_organizacional] (
    [cod_filho]  NVARCHAR (50)  NOT NULL,
    [desc_filho] NVARCHAR (200) NULL,
    [cod_pai]    NVARCHAR (50)  NULL,
    [esquerda]   INT            NULL,
    [direita]    INT            NULL,
    [nivel]      INT            NULL,
    PRIMARY KEY CLUSTERED ([cod_filho] ASC)
);


GO
PRINT N'Creating [dbo].[FK_dim_organizacional_dim_organizacional]...';


GO
ALTER TABLE [dbo].[dim_organizacional] WITH NOCHECK
    ADD CONSTRAINT [FK_dim_organizacional_dim_organizacional] FOREIGN KEY ([cod_pai]) REFERENCES [dbo].[dim_organizacional] ([cod_filho]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '96811e9e-ebf3-4040-946f-bf5f6c646a0c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('96811e9e-ebf3-4040-946f-bf5f6c646a0c')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[dim_organizacional] WITH CHECK CHECK CONSTRAINT [FK_dim_organizacional_dim_organizacional];


GO
PRINT N'Update complete.';


GO