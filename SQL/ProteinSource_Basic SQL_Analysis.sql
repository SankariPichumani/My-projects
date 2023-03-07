/****** Script for selecting all the records from ProteinCosts table  ******/
SELECT *  FROM [IntropracticeDB].[dbo].[Protein Costs];
/* what are the cheap vegan sources of protein with the cost */
SELECT *  FROM [IntropracticeDB].[dbo].[Protein Costs] where Vegan = 1;
/* what are the cheap vegetarian sources of protein with the cost */
SELECT *  FROM [IntropracticeDB].[dbo].[Protein Costs] where Vegetarian = 1;
/* what are the cheap meat sources of protein with the cost */
Select *
from [IntropracticeDB].[dbo].[Protein Costs]
where Vegetarian=0
order by 2;
/* which is the priciest protein source */
Select  Top 3 Protein_Source,Cost_per_package,Total_Protein_per_package_g
from [IntropracticeDB].[dbo].[Protein Costs]
order by 2 desc;

/* which source has the highest protein per package */
Select Protein_Source,Cost_per_package,Total_Protein_per_package_g
from [IntropracticeDB].[dbo].[Protein Costs]
order by 3 Desc;

