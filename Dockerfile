FROM ubuntu AS BUILDER

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN set -e

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    make \
    git \
    build-essential \
    cmake \
    cython \
    doxygen \
    freeglut3-dev \
    git-core \
    git-core \
    graphviz \
    libxi-dev \
    libxmu-dev \
    pkg-config \
    openni-utils \
    libopenni-dev \
    freeglut3-dev \
    libusb-1.0-0-dev \
    libglfw3-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    python3.8-dev \
    python3.8 \
    python3-venv
    

RUN python3 -m venv /opt/venv
RUN . /opt/venv/bin/activate

COPY . . 
RUN . /opt/venv/bin/activate && pip install -r requirements.txt && make

# ----------------------------------------------------------------------------------------------------------------

FROM scratch AS export-stage
COPY --from=BUILDER /brokap_server .