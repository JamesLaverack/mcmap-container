FROM ubuntu:20.10 AS builder

RUN apt-get update && apt-get install -y \
    g++ \
    git \
    libpng-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN git clone http://github.com/spoutn1k/mcmap /mcmap
WORKDIR /mcmap

RUN make -j

WORKDIR /
RUN mv /mcmap/mcmap /bin/mcmap && rm -rf /mcmap

ENTRYPOINT ["/bin/mcmap"]
