#!/bin/bash
vars=("SNOWFLAKE_ORGANISATION_NAME" "SNOWFLAKE_ACCOUNT_NAME" "SNOWFLAKE_USER" "SNOWFLAKE_PASSWORD" "SNOWFLAKE_DEFAULT_ROLE" "SNOWFLAKE_DEFAULT_WAREHOUSE" "SNOWFLAKE_DEFAULT_DB" "SNOWFLAKE_DEFAULT_SCHEMA")
vars=(\
    "SNOWSQL_ACCOUNT" \
    "SNOWSQL_USER" \
    "SNOWSQL_PWD"
)

read -r -p "Press enter to configure snowsql"
for var in "${vars[@]}"; do
    if [ -z "${!var}" ]; then
        [ "$has_slept" ] || { read -r -p "Press enter to continue"; has_slept=1; }
        read -r -p "Please provide a value for ${var} [default:${var:-none}]: " myval
        # Ensure that variables are exported in this shell
        declare -x "${var}=${myval}"
        # Ensure that variables will be persisted in future Gitpod workspaces
        gp env "${var}=${myval}" > /dev/null
        # Ensure that variables will be available in other shells in this workspace
        echo "export ${var}=${myval}" >> ~/.bashrc
    fi
done