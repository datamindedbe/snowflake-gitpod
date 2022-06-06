#!/usr/bin/env python
from configparser import ConfigParser
import os

config_dir = os.path.expanduser("~/.snowsql")
if not os.path.exists(config_dir):
    os.mkdir(config_dir)
config_path = os.path.expanduser("~/.snowsql/config")
config_config = ConfigParser()
config_config.read(config_path)  # if path does not exist, this is no-op


if "connections" not in config_config:
    config_config.add_section("connections")

config_config.set("connections", "accountname", f"{os.getenv('SNOWFLAKE_ORGANISATION_NAME')}-{os.getenv('SNOWFLAKE_ACCOUNT_NAME')}")
# region is not necessary when we use organisation + account name as the accountname
# (region is necessary when using account id as account name)
# config_config.set("connections", "region", os.getenv("SNOWFLAKE_REGION"))
config_config.set("connections", "username", os.getenv("SNOWFLAKE_USER"))
config_config.set("connections", "password", os.getenv("SNOWFLAKE_PASSWORD"))
config_config.set("connections", "dbname", os.getenv("SNOWFLAKE_DEFAULT_DB"))
config_config.set("connections", "schemaname", os.getenv("SNOWFLAKE_DEFAULT_SCHEMA"))
config_config.set("connections", "warehousename", os.getenv("SNOWFLAKE_DEFAULT_WAREHOUSE"))
config_config.set("connections", "rolename", os.getenv("SNOWFLAKE_DEFAULT_ROLE"))

with open(config_path, "w") as f:
    config_config.write(f)
