{{ config(materialized='view') }}

{%- set yaml_metadata -%}

[source_model]: 'raw_products'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}



{% set source_model = metadata_dict["source_model"] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=none,
                     null_columns=none,
                     hashed_columns=none,
                     ranked_columns=none) }}
