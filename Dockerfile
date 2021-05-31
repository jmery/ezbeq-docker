# syntax=docker/dockerfile:1

FROM ubuntu:21.04
ENV MDSPRSV=v0.0.8
ENV EZBEQV=0.6.5
WORKDIR /tmp

RUN apt-get update \
  && apt-get install --no-install-recommends -y libusb-1.0 python3 python3-pip libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mrene/minidsp-rs/releases/download/${MDSPRSV}/minidsp.x86_64-unknown-linux-gnu.tar.gz /tmp/

RUN tar -xzf /tmp/minidsp.x86_64-unknown-linux-gnu.tar.gz && rm /tmp/minidsp.x86_64-unknown-linux-gnu.tar.gz

RUN mv /tmp/minidsp /usr/local/bin/

RUN pip install ezbeq==${EZBEQV}

CMD ["ezbeq"]
