select id as account_id,
       company,
       primary_contact_id
from {{ source('marketing_and_sales', 'raw_accounts') }}