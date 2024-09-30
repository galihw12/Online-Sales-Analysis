SELECT *
FROM online_sales_data_cleaning
WHERE Units_Sold >= 10
ORDER BY Units_Sold;

-- Ignore the data outlier for this column because this transaction is possible considering the unit_price is only 9.99 dollars --

SELECT *
FROM online_sales_data_cleaning
WHERE Unit_Price >= 599
ORDER BY Unit_Price;

-- Ignore the data outlier because the price for these items are make possible --
