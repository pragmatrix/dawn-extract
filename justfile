tag := "dawn-extract:latest"

extract:
    docker build . --tag {{tag}}
    docker run {{tag}} tar cz include/ > /tmp/dawn-include.tar.gz
