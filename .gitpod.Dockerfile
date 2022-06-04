FROM gitpod/workspace-full:2022-06-03-16-28-21

# Rather no browser than one that does not work
RUN sudo apt autoremove lynx --yes

# Install python version
ADD ./.python-version .
RUN PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install --skip-existing
