#UPDATES

##June 24,2019

### Views
Replace (ProductViewForSales)[#] with following.
```sql
SELECT        dbo.Products.ProductId, RTRIM(dbo.Products.ProductName) AS ProductName, dbo.Stock.Stock, dbo.Stock.SalePrice, dbo.Stock.PurchasesPrice
FROM            dbo.Products INNER JOIN
                         dbo.Stock ON dbo.Products.ProductId = dbo.Stock.ProductId
WHERE        (dbo.Products.Active = 1)
```