#!/bin/bash

# docker run --gpus all --rm -v ./:/root/PIP -it suminmin/pip-rbdl-dev /bin/bash
# docker run --rm --runtime=nvidia -v ./:/root/PIP -it suminmin/pip-rbdl-dev /bin/bash
# docker run --rm --runtime=nvidia -v ./:/root/PIP -it rbdl-pip4 /bin/bash

PORT=31011
docker run --rm --runtime=nvidia -v ./:/root/PIP -p $PORT:$PORT -it suminmin/pip-rbdl-dev /bin/bash
