go mod init go
go mod tidy
docker build --no-cache --progress=plain -f build-golang.docker -t build-golang .
docker run --name go-builder docker.io/library/build-golang
docker cp go-builder:/app/image/files/cassandra-seed.so ./image/files
