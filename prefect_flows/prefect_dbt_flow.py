from prefect import flow
from prefect_dbt.cli import DbtCliProfile, DbtCoreOperation

@flow
def trigger_dbt_flow():
    dbt_cli_profile = DbtCliProfile.load("DBT-CORE-OPERATION-BLOCK-NAME-PLACEHOLDER")
    with DbtCoreOperation(
        commands=["dbt debug", "dbt run"],
        project_dir="/home/azureuser/mohre-poc",
        profiles_dir="/home/azureuser/.dbt",
        dbt_cli_profile=dbt_cli_profile,
    ) as dbt_operation:
        dbt_process = dbt_op.trigger()
        # do other things before waiting for completion
        dbt_process.wait_for_completion()
        result = dbt_process.fetch_result()
    return result

trigger_dbt_flow()
