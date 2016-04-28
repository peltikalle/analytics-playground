## Analytics playground

The purpose of this image is to have a platform for explorative analytics with Python and Octave. Python version is currently 3.4.3 but this might change as time passes. A number of Python packages are included that you might need when doing analyses. 

### Packages installed:

- scipy
- numpy
- pandas
- scikit-learn
- pystan
- jupyter
- matplotlib
- seaborn

## Starting a container

When running the either of the commands below a container is started with the current directory mounted and accessible from the Jupyter notebook running at port 8888.

```
docker run --rm -it -p 8888 -v $(pwd):/home/foobar/ peltikalle/analytics-playground
```

or

```
./start_container.sh
```

When creating new notebook you can select either Python3.4.3 or Octave kernels.


## Installation

Either build the image yourself by running

```
docker build --rm -t <name your image> .
```

or by pulling from dockerhub

```
docker pull peltikalle/analytics-playground
```
