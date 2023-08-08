from prefect import flow
from prefect_dbt.cli.commands import DbtCoreOperation

@flow
def trigger_dbt_flow() -> str:
    result = DbtCoreOperation(
        commands=["pwd", "dbt debug", "dbt run"],
        project_dir="/home/azureuser/mohre-poc",
        profiles_dir="/home/azureuser/.dbt",
    ).run()
    return result

trigger_dbt_flow()
