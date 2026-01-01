CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;

    BEGIN TRY
        PRINT '======='
        PRINT 'Loading Bronze Layer '
        PRINT '======='

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\Shivam\OneDrive\Documents\crm_cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
);
SET @end_time = GETDATE();
PRINT '>>Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' SECONDS '; 
PRINT '======='
PRINT 'Loading Bronze Layer '
PRINT '======='


truncate table bronze.crm_prd_info
bulk insert bronze.crm_prd_info
from 'C:\Users\Shivam\OneDrive\Documents\crm_prd_info.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
select * from bronze.crm_prd_info

truncate table bronze.crm_sales_details
bulk insert bronze.crm_sales_details
from 'C:\Users\Shivam\OneDrive\Documents\crm_sales_details.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
select * from bronze.crm_sales_details


truncate table bronze.erp_cust_az12
bulk insert bronze.erp_cust_az12
from 'C:\Users\Shivam\OneDrive\Documents\erp_cust_az12.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
select * from bronze.erp_cust_az12



truncate table bronze.erp_loc_a101
bulk insert bronze.erp_loc_a101
from 'C:\Users\Shivam\OneDrive\Documents\erp_loc_a101.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
select * from bronze.erp_loc_a101


truncate table bronze.erp_px_cat_g1v2
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\Shivam\OneDrive\Documents\erp_px_cat_g1v2.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
select * from bronze.erp_px_cat_g1v2


truncate table bronze.erp_cust_az12
bulk insert bronze.erp_cust_az12
from 'C:\Users\Shivam\OneDrive\Documents\erp_cust_az12.csv'
with (
firstrow = 2,
FIELDTERMINATOR = ',',
tablock
);
END TRY
BEGIN CATCH
PRINT '========================================================================'
PRINT 'Error Message'+ERROR_MESSAGE();
PRINT 'Error Message'+cast(ERROR_number() as nvarchar);
PRINT 'Error Message'+cast(ERROR_state() as nvarchar);
END CATCH
END


