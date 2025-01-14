# Seed Files

This directory contains seed files for our dbt project. These are static CSV files that are loaded into our data warehouse using the `dbt seed` command.  Please make separate folders for the various subject-matter areas seed files may fall under to keep things organized.

These seed files live in the FLEETIO_RAW schema.  In order to avoid double documentation you can find the definitions to these seed files in the staging schema .yml file as below.

seeds -> __sources.yml -> staging tables then call the sources and the definitions live in the staging schema.yml

## Updating Seeds

When updating seed files:
1. Ensure the CSV format is clean and free of extra commas or stray characters
2. Run `dbt seed --full-refresh` if column structures have changed

## Best Practices

- Use seeds for static data that changes infrequently
- Avoid storing sensitive information (e.g., PII, passwords) in seed 