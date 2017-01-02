#!/bin/bash

mkdir /home/analytics/.jupyter
echo "c.NotebookApp.port = 8888" >> /home/analytics/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.certfile = '/home/analytics/certs/mycert.pem'" >> /home/analytics/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.keyfile = '/home/analytics/certs/mykey.key'" >> /home/analytics/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /home/analytics/.jupyter/jupyter_notebook_config.py
# echo "c.NotebookApp.password = 'xxxxx'" >> /home/analytics/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.notebook_dir = '/home/analytics/work'" >> /home/analytics/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/analytics/.jupyter/jupyter_notebook_config.py

/usr/local/bin/jupyter notebook
