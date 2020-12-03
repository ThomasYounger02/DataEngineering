## Summary
It's time to move Sparkify’s date warehouse to a data lake. We need to bulid an ETF pipline to extract  data from S3 and processes data using Spark. Then load the data into a new S3 as a set of dimensional tables. So the analytics team can do analysising jobs to find out insights.

## Dataset
- Fact Table
songplays - records in event data associated with song plays i.e. records with page NextSong
- Dimension Tables
users - users in the app
songs - songs in music database
artists - artists in music database
time - timestamps of records in songplays broken down into specific units

## Spark Process
- The ETL job will process the song files and the log files. 
- The song files are listed and iterated over entering relevant information in the artists and the song folders in parquet. 
- The log files are filtered by the NextSong action. The subsequent dataset is then processed to extract the date, time, year

## Files
etl.py - ETL to read data from S3, process data using Spark, and write them to a new S3;
dl.cfg - AWS credentials


## How to run?
- Run python etl.py. 
    - Start pipeline which will read the data from files in the s3 bucket;
    - Create tables in the form of parquet files in the new bucket;