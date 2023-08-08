
{{ config(materialized='incremental') }}

{%- set source_model = "v_stg_sales" -%}
{%- set src_pk = "SALE_PRODUCT_PK" -%}
{%- set src_fk = ["SALE_PK", "PRODUCT_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
