# Analytics playground

The purpose of this image is to have a platform for explorative analytics with Python. Python version is currently 3.5.2. A number of Python packages are included that you might need when doing analyses. Feel free to request any you might want to have added, or even do PRs if you feel like it.

## Packages installed:

- scipy
- numpy
- pandas
- scikit-learn
- pystan
- jupyter
- matplotlib
- seaborn
- psycopg2
- tensorflow
- boto3

## Building the image

Use build-arg UID to set the UID that is assigned to the the user analytics within the container.

When running on linux this UID is mapped directly to the user on the host which has direct consequences on the file and directory ownerships. If you hit any problems with these, remember to revisit the UID build-arg and rebuild the image.

Example command for building the image:

```
docker build --rm --build-arg UID=1000 -t peltikalle/analytics-playground .
```

### Setting password for notebooks

If you want to user password instead of the token displayed on notebook startup (or disable both), modify the start_notebook.sh file and rebuild the image.

Add your hashed password to scripts/start_notebook.sh in the place of xxx. See http://jupyter-notebook.readthedocs.io/en/latest/public_server.html for instructions on how to obtain the password.

```
echo "c.NotebookApp.password = 'xxx'" >> /home/analytics/.jupyter/jupyter_notebook_config.py
```

### Self-signed certificate

The image includes a self-signed certificate. You can add your own by modifying the Dockerfile lines

```
RUN mkdir -p /home/analytics/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -batch -keyout /home/analytics/certs/mykey.key -out /home/analytics/certs/mycert.pem
```

And pointing the start_notebook.sh to use the correct files.

To disable the https, just comment out c.NotebookApp.certfile and c.NotebookApp.keyfile lines from scripts/start_notebook.sh

Remember to rebuild the image after modifying scripts/start_notebook.sh.

## Starting a container

You can start the the container by running scripts/start_container.sh. This script launches the notebook on port 8888, accepting connections only from the localhost and mounts the current directory to the container home directory.

The notebook is now accessible at https://localhost:8888/?token=xxxx

The token is displayed on the container startup. If you have set the password you do not have to use the token

You can also run the container with

```
docker run --rm -it -v /path/to/host/directory:/home/analytics/work/ -p 127.0.0.1:8888:8888 peltikalle/analytics-playground
```

Setting /path/to/host/directory to $(pwd) to mount the current working directory. 

## TODO

- Option to include cuda and tensorflow with gpu support. Will do after I get my new machine.
- Look into switching into a better, docker optimized, base-image. There are a few available for ubuntu.
