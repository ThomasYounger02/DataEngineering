from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators import LoadDimensionOperator
from helpers import SqlQueries
from airflow.hooks.postgres_hook import PostgresHook
from airflow.models import BaseOperator
from airflow.utils.decorators import apply_defaults


class CreateTableOperator(BaseOperator):
    ui_color = '#358140'

    @apply_defaults
    def __init__(self, redshift_conn_id = "", *args, **kwargs):
        
        super(CreateTableOperator, self).__init__(*args, **kwargs)
        self.redshift_conn_id = redshift_conn_id
        
    def execute(self, context):
        self.log.info('Creating Postgres SQL Hook')
        redshift = PostgresHook(postgres_conn_id = self.redshift_conn_id)

        self.log.info('Executing creating tables in Redshift.')
        queries =  open('/home/workspace/airflow/create_tables.sql', 'r').read()
        redshift.run(queries)
        
        self.log.info("Tables created ")

def load_dimension_subdag(
    parent_dag_name,
    task_id,
    redshift_conn_id,
    sql_statement,
    delete_load,
    table_name,
    *args, **kwargs):
    
    dag = DAG(f"{parent_dag_name}.{task_id}", **kwargs)
    
    load_dimension_table = LoadDimensionOperator(
        task_id=task_id,
        dag=dag,
        redshift_conn_id=redshift_conn_id,
        sql_query = sql_statement,
        delete_load = delete_load,
        table_name = table_name,
    )    
    
    load_dimension_table
    
    return dag