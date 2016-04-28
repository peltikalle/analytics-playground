#!/bin/bash
docker run --rm -it -v $(pwd):/home/foobar/work/ -p 8888:8888 peltikalle/analytics-playground
