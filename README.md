#UPDATES

### 28-7-2019
Add Collem 'barcode' in product table with nchar 255

### Views 


###Replace ProductViewForSales (if error occured on product add button in sale invoice) with following.
```sql
SELECT        dbo.Products.ProductId, RTRIM(dbo.Products.ProductName) AS ProductName, dbo.Stock.Stock, dbo.Stock.SalePrice, dbo.Stock.PurchasesPrice , dbo.Stock.SaleDiscount, CASE WHEN dbo.Products.Service IS NULL THEN 0 ELSE dbo.Products.Service END AS Service
FROM            dbo.Products INNER JOIN
                         dbo.Stock ON dbo.Products.ProductId = dbo.Stock.ProductId
WHERE        (dbo.Products.Active = 1)
```

### Remove Database
```shell
   sqlcmd -S .
```
```sql
drop database DDPOSDB
go
```

### Database Managment Tool
(Downloding Link)[https://fishcodelib.com/Database.htm]

### Microsoft® SQL Server® 2014 Express
(Downloding Link Express 32BIT\SQLEXPR_x86_ENU.exe) [https://www.microsoft.com/en-pk/download/details.aspx?id=42299]

### Microsoft .NET Framework 4.5 (Windows 7)
(Downloding Link) [https://www.microsoft.com/en-pk/download/details.aspx?id=30653]

### Microsoft .NET Framework 3.5 (Windows 8,8.1,10)
(Tutorial Link) [https://docs.microsoft.com/en-us/dotnet/framework/install/dotnet-35-windows-10]