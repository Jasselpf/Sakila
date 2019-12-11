#! /bin/bash


pyenv virtualenv 3.7.3 sakila
echo 'sakila' > .python-version
pip install poetry
poetry install
sudo -u postgres createuser sakila
sudo -u postgres createdb -O sakila sakila
sudo -u postgres psql  -c "Alter user sakila password 'some_password';"
sudo -u postgres psql  -c "Grant all on DATABASE sakila to sakila;"

