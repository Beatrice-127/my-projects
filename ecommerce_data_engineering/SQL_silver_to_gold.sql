create schema gold;

create view gold.final 
as 
SELECT
     *
FROM
    OPENROWSET(
        BULK 'https://olistdatastoragelibei.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result1;



select * from gold.final;




CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://olistdatastoragelibei.dfs.core.windows.net/olistdata/gold/',
    CREDENTIAL = libeikadmin
);


CREATE EXTERNAL TABLE gold.finaltable WITH (
        LOCATION = 'Serving',
        DATA_SOURCE = goldlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;



select * from gold.finaltable;

select * from gold.final2