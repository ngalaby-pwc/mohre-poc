{{ config(
    tags=["stage"]
) }}

{%- set yaml_metadata -%}
source_model: 'raw_customers'
derived_columns:
  RECORD_SOURCE: '!RAW_CUSTOMERS'
  LOAD_DATE: load_date 
  EFFECTIVE_FROM: dbt_utils.date()
hashed_columns:
  CUSTOMER_PK: 'CUSTOMER_ID'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     hashed_columns=hashed_columns,
                     ranked_columns=none) }}
