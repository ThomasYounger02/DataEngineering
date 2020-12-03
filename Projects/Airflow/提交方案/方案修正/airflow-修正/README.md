# Airflow in Sparkify
## Introduction
A music streaming company, Sparkify, has decided that it is time to introduce more automation and monitoring to their data warehouse ETL pipelines and come to the conclusion that the best tool to achieve this is Apache Airflow.

The source data resides in S3 and needs to be processed in Sparkify's data warehouse in Amazon Redshift. The source datasets consist of JSON logs that tell about user activity in the application and JSON metadata about the songs the users listen to.

## Files
airflow
│   README.md                           # Project description
|   dag.png                             # Pipeline DAG image
│   
└───airflow                             # Airflow home
|   |               
│   └───dags                            # Jupyter notebooks
│   |   │ sparkify_dimension_subdag.py  # DAG definition helper
│   |   │ udac_example_dag.py           # DAG definition
|   |   |
|   └───plugins
│       │  
|       └───helpers
|       |   | sql_queries.py            # All sql queries needed
|       |
|       └───operators
|       |   | create_table.py           # CreateTableOperator
|       |   | data_quality.py           # DataQualityOperator
|       |   | load_dimension.py         # LoadDimensionOperator
|       |   | load_fact.py              # LoadFactOperator
|       |   | stage_redshift.py         # StageToRedshiftOperator

## Connect Airflow to AWS
- Click on the Admin tab and select Connections.
- Under Connections, select Create.
- On the create connection page, enter the following values:
 - Conn Id: Enter **aws_credentials**.
 - Conn Type: Enter **Amazon Web Services**.
 - Login: Enter your **Access key ID** from the IAM User credentials.
 - Password: Enter your **Secret access** key from the IAM User credentials.
- On the next create connection page, enter the following values:
 - Conn Id: Enter **redshift**.
 - Conn Type: Enter **Postgres**.
 - Host: Enter the endpoint of your Redshift cluster, excluding the port at the end.
 - Schema: Enter dev. This is the Redshift database you want to connect to.
 - Login: Enter **<>**.
 - Password: Enter the password you created when launching your Redshift cluster.
 - Port: Enter **5439**.

## Start the DAG
- Type in "/opt/airflow/start.sh" in the terminal.
- Activate Airflow.