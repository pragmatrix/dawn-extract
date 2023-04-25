tag := "dawn-extract:latest"

extract:
    docker build . --tag {{tag}}
    docker run {{tag}} tar cz -C dawn include/ > /tmp/dawn-include.tar.gz
