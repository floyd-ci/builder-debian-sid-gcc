FROM floydci/debian:unstable

ARG GCC_VERSION=8
ARG EXPERIMENTAL

RUN if [ $EXPERIMENTAL ]; then \
        echo 'deb http://ftp.debian.org/debian experimental main' >> /etc/apt/sources.list; \
    fi \
    && apt-get -qq update \
    && apt-get -qq install ${EXPERIMENTAL:+-t experimental} -y --no-install-recommends \
        g++-${GCC_VERSION} \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-${GCC_VERSION}" \
    CXX="/usr/bin/g++-${GCC_VERSION}" \
    COVERAGE_COMMAND="/usr/bin/gcov-${GCC_VERSION}" \
    COVERAGE_FLAGS="--coverage"
