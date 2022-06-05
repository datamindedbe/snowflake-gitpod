#!/bin/bash
vars=("SNOWFLAKE_ACCOUNT_NAME" "SNOWFLAKE_REGION" "SNOWFLAKE_USER" "SNOWFLAKE_PASSWORD" "SNOWFLAKE_DEFAULT_ROLE" "SNOWFLAKE_DEFAULT_WAREHOUSE" "SNOWFLAKE_DEFAULT_DB" "SNOWFLAKE_DEFAULT_SCHEMA")

for var in ${vars[@]}; do
    if [ -z ${!var} ]; then
        read -p "Please provide a value for ${var}: " myval
        declare -x "${var}=${myval}"
        gp env "${var}=${myval}" > /dev/null
    fi
done