-- models/hub_sales.sql

{{ config(materialized='incremental') }}

{% set source_model = "v_stg_sales" %}
{% set src_pk = "SALE_PK" %}
{% set src_nk = "SALE_ID" %}
{% set src_ldts = "LOAD_DATE" %}
{% set src_source = "RECORD_SOURCE" %}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
