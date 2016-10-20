#!/usr/bin/env bash

docker pull d3v0x/gentoo

docker run \
    -v /usr/portage/:/usr/portage/ \
    -v $(pwd)/portageConfig/make.conf:/etc/portage/make.conf \
    -v $(pwd)/portageConfig/package.accept_keywords:/etc/portage/package.accept_keywords \
    -v $(pwd)/portageConfig/package.use:/etc/portage/package.use \
    --rm \
    d3v0x/gentoo \
    /bin/bash -c "\
    echo 'MAKEOPTS=\"-j$(cat /proc/cpuinfo | grep processor | wc -l)\"' >> /etc/portage/make.conf && \
    emerge -uDN @world && \
    emerge $(cat world)"
