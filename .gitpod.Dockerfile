FROM gitpod/workspace-full:2022-06-03-16-28-21

RUN sudo apt-get autoremove lynx -y

RUN brew install coursier/formulas/coursier scalaenv sbt && \
    scalaenv install scala-2.12.12 && \
    scalaenv global scala-2.12.12 && \
    coursier launch --fork almond:0.11.1 --scala 2.12.11 -- --install && \
    echo 'export PATH="${HOME}/.scalaenv/shims:${PATH}"' >> ~/.bashrc

RUN tmpdir=$(mktemp -d) && \
    cd $tmpdir && \
    curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash && \
    curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash.sig && \
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 37C7086698CB005C && \
    gpg --verify snowsql-1.2.21-linux_x86_64.bash.sig snowsql-1.2.21-linux_x86_64.bash && \
    touch dummy && \
    export SNOWSQL_LOGIN_SHELL=`pwd`/dummy && \
    export SNOWSQL_DEST=$HOME/.local/bin && \
    bash snowsql-1.2.21-linux_x86_64.bash && \
    cd && rm -r $tmpdir && \
    snowsql -v # this will create a default config file
