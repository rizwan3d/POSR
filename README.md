#UPDATES

##June 24,2019

### Views
Replace (ProductViewForSales)[http://www/rizwan3d.com/] with following.
```sql
SELECT        dbo.Products.ProductId, RTRIM(dbo.Products.ProductName) AS ProductName, dbo.Stock.Stock, dbo.Stock.SalePrice, dbo.Stock.PurchasesPrice , dbo.Stock.SaleDiscount, CASE WHEN dbo.Products.Service IS NULL THEN 0 ELSE dbo.Products.Service END AS Service
FROM            dbo.Products INNER JOIN
                         dbo.Stock ON dbo.Products.ProductId = dbo.Stock.ProductId
WHERE        (dbo.Products.Active = 1)
```