#!/bin/sh

# Install python and pip

# Install libraries
sudo apt install autoconf libtool automake bison python-dev swig libpulse-dev

# Clone repos
mkdir sphinx
cd sphinx
git clone https://github.com/cmusphinx/sphinxbase
git clone https://github.com/cmusphinx/pocketsphinx

# Install sphinxbase
cd sphinxbase
./autogen.sh
make
sudo make install

# Install pocketsphinx
cd ../pocketsphinx
./autogen.sh
make
sudo make install

# Install sound library for prevent alsa error installing pocketsphinx
sudo apt-get install libasound2-dev

# Install pocketsphinx interface for Python
sudo pip install --upgrade pip setuptools wheel
sudo pip install --upgrade pocketsphinx

# Ver como llenar variable
# export POCKETSPHINX_PATH = python -c "from pocketsphinx import get_model_path; print(get_model_path())"
# python -c "from pocketsphinx import get_model_path; print(get_model_path())"

# Hacer copia usando la variable
# sudo cp .... "echo ${POCKETSPHINX_PATH}"
#sudo cp es-20k.lm.bin /usr/local/lib/python2.7/dist-packages/pocketsphinx/model
#sudo cp -R es-es/ /usr/local/lib/python2.7/dist-packages/pocketsphinx/model
#sudo cp es.dict /usr/local/lib/python2.7/dist-packages/pocketsphinx/model

# Run speech to text
#python speech.py
