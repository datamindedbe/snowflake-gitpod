FROM gitpod/workspace-full:2022-06-03-16-28-21

RUN sudo apt-get uninstall lynx
RUN brew install coursier/formulas/coursier scalaenv sbt && \
    scalaenv install scala-2.12.12 && \
    scalaenv global scala-2.12.12 && \
    coursier launch --fork almond:0.11.1 --scala 2.12.11 -- --install && \
    echo 'export PATH="${HOME}/.scalaenv/shims:${PATH}"' >> ~/.bashrc
