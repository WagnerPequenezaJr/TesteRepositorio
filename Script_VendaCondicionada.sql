/********************************************************************************
*********************************************************************************
*** ------------------------------------------------------------------------- ***
***            VENDA CONDICIONADA - INGRESSOS INFANTIL / GRATUIDADE           ***
*** ------------------------------------------------------------------------- ***
*********************************************************************************
********************************************************************************/
------------------------------------------
--- ALTERACAO TABELA - CATALOGOPRODUTO ---
------------------------------------------
ALTER TABLE CatalogoProduto ADD SNVendaCondicionada BIT DEFAULT ((0)) NOT NULL;
GO
---------------------------------------------------------
--- CRIACAO TABELA - CATALOGOPRODUTOVENDACONDICIONADA ---
---------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---           
IF OBJECT_ID('CatalogoProdutoVendaCondicionada') IS NOT NULL
   DROP TABLE CatalogoProdutoVendaCondicionada
GO
---
CREATE TABLE CatalogoProdutoVendaCondicionada	(
       CatProdVendaCondicionadaID     [INT]         IDENTITY(1,1),       
       CatalogoProdutoID              [INT]         NOT NULL,
       ProdutoID                      [INT]         NOT NULL,
       --- 
       ProdutoCondicionadoID          [INT]         NOT NULL,
       CorporacaoID                   [INT]         NOT NULL,
       Ativo                          BIT           NOT NULL,     
	     ---                            
       IDInclusao                     NVARCHAR(MAX) NOT NULL,
	     DTInclusao                     DATETIME2(7)  NOT NULL, 
	     IDAlteracao                    NVARCHAR(MAX) NOT NULL,
	     DTAlteracao                    DATETIME2(7)  NOT NULL      
)
GO	  
---
ALTER TABLE CatalogoProdutoVendaCondicionada
      ADD CONSTRAINT PK_CATPRODVENDCOND PRIMARY KEY CLUSTERED (
            CatProdVendaCondicionadaID ASC)      
      WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)       
GO
---
ALTER TABLE CatalogoProdutoVendaCondicionada
      ADD CONSTRAINT R_095
      FOREIGN KEY (CorporacaoID)      
      REFERENCES Corporacao (CorporacaoID)
      ON DELETE NO ACTION
	    ON UPDATE NO ACTION
GO	
---
ALTER TABLE CatalogoProdutoVendaCondicionada
      ADD CONSTRAINT R_096 
      FOREIGN KEY (ProdutoID)      
      REFERENCES Produto (ProdutoID)
      ON DELETE NO ACTION
	    ON UPDATE NO ACTION
GO	
ALTER TABLE CatalogoProdutoVendaCondicionada
      ADD CONSTRAINT R_097 
      FOREIGN KEY (ProdutoCondicionadoID)      
      REFERENCES Produto (ProdutoID)
      ON DELETE NO ACTION
	    ON UPDATE NO ACTION
GO	
---