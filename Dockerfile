FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install the necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        git \
        python3 \
        python3-pip

RUN pip install jinja2

# Clone Dawn

RUN git clone https://dawn.googlesource.com/dawn dawn

WORKDIR /dawn

# Skia m117 DEPS
RUN git checkout beaf20f90f1bf21d235c99d5b49b8bb507b722b2

RUN python3 generator/dawn_json_generator.py --dawn-json dawn.json --wire-json dawn_wire.json --template-dir generator/templates --targets headers,cpp_headers --output-dir .
