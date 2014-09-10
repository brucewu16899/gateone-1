docker stop gateone; docker rm gateone

SRC=$HOME/data/docker/gateone
docker run -d --name gateone -v $SRC/data -p 127.0.1.1:8002:443 hansd/gateone gateone --origins="http://127.0.0.1:8001;http://127.0.1.1:8001;http://data.aflitos.net:8001" --disable_ssl

#watch docker logs gateone
