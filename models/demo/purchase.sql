{{
    config
    (
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key='PURCHASE_ID',
        merge_exclude_columns=['INSERT_DTS']
    )
}}
with purchase_src as
(   select
    PURCHASE_ID,
    PURCHASE_DATE,
    PURCHASE_STATUS,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS,
    CURRENT_TIMESTAMP AS UPDATE_DTS
    from {{source('purchase', 'purchase_src')}}

    {% if is_incremental()%}
    where CREATED_AT > (select max(INSERT_DTS) from {{this}})
    {%endif%}
)

SELECT * FROM purchase_src