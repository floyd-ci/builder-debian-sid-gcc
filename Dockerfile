FROM debian:sid-slim

RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        cmake \
        ninja-build \
    && rm -rf /var/lib/apt/lists/*

ARG GCC_VERSION

RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
        g++-${GCC_VERSION} \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-${GCC_VERSION}" \
    CXX="/usr/bin/g++-${GCC_VERSION}" \
    COVERAGE_COMMAND="/usr/bin/gcov-${GCC_VERSION}" \
    COVERAGE_FLAGS="--coverage"
