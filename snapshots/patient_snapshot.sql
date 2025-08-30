{% snapshot patient_snapshot%}
{{
    config
    (
        strategy ='check',
        unique_key = 'patient_id',
        check_cols=["PATIENT_NAME" ,"PATIENT_CONTACT_NUMBER", "PATIENT_EMAIL_ID", "PATIENT_ADDRESS"]
    )
}}

select * from {{source ('patient',"patient_src")}}

{%endsnapshot%}