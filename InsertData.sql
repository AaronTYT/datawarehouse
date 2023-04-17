BULK INSERT DimType 
FROM 'D:\UWA\Data Science\Semester 1\data_warehousing\Project 1\Scripts\DimCrime.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);