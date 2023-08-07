{{ config(
    tags=["stage"]
) }}
{%- set yaml_metadata -%}
source_model: 'raw_sales'
derived_columns:
  RECORD_SOURCE: '!RAW_SALES'
  LOAD_DATE: SALE_DATE + INTERVAL '1 day'
  EFFECTIVE_FROM: 'SALE_DATE'
hashed_columns:
  SALE_PK:
    - 'SALE_ID'
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
