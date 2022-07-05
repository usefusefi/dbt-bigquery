
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
--   {%- for i in range(1, 10) %}
--       select {{ i }} as my_column
  
--       {%- if not loop.last %}
--           union all 
--       {% endif %}
  
--   {%- endfor %}

{{ config(materialized='table') }}

with source_data as (

    {%- for i in range(1,11) %}
        select {{ i }} as id, cast(current_date() as string format 'dd-Mon-YYYY') as c_date
        union all
    {%- endfor %}
        select null,null as id
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
