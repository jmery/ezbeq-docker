# syntax=docker/dockerfile:1

FROM ubuntu:22.04
ENV MDSPRSV=v0.1.9
ENV EZBEQV=0.15.1
WORKDIR /tmp

# RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
# RUN sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update \
  && apt-get install --no-install-recommends -y libusb-1.0 python3 python3-pip python3-dev libffi-dev libyaml-dev build-essential \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/mrene/minidsp-rs/releases/download/${MDSPRSV}/minidsp.x86_64-unknown-linux-gnu.tar.gz /tmp/

RUN tar -xzf /tmp/minidsp.x86_64-unknown-linux-gnu.tar.gz && rm /tmp/minidsp.x86_64-unknown-linux-gnu.tar.gz

RUN mv /tmp/minidsp /usr/local/bin/

RUN pip install ezbeq==${EZBEQV}

CMD ["ezbeq"]
