from prefect import Flow, task
import subprocess

@task
def run_dbt():
    # Replace 'dbt run' with the appropriate dbt command for your environment
    subprocess.run(['dbt', 'run'])

# Create Prefect Flow
with Flow('dbt_run_flow') as flow:
    dbt_task = run_dbt()


# Run the Prefect Flow
flow.run()

