#!/bin/bash
docker run --rm -it -v $(pwd):/home/analytics/work/ -p 127.0.0.1:8888:8888 peltikalle/analytics-playground