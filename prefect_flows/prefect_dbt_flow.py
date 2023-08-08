from prefect import flow, task
import subprocess

@task
def run_dbt():
    subprocess.run(['dbt', 'run'])

@flow(name="dbt_run_flow")
def run_flow():
    dbt_task = run_dbt()


