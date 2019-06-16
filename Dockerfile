FROM debian:sid-slim

RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        cmake \
        ninja-build \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
        g++-8 \
    && rm -rf /var/lib/apt/lists/*

ENV CC="/usr/bin/gcc-8" \
    CXX="/usr/bin/g++-8" \
    COVERAGE_COMMAND="/usr/bin/gcov-8" \
    COVERAGE_FLAGS="--coverage"
