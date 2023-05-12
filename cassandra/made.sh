go mod init go
go mod tidy
docker build --no-cache --progress=plain -f build-golang.docker -t build-golang .
docker run --rm --name go-builder docker.io/library/build-golang
docker cp go-builder:/app/image/files/cassandra-seed.so ./image/files
docker stop go-builder

##
## Execute the following on your own, if needed.
## 

# make all

# Tag the image, push.
#docker image tag gcr.io/google_samples/cassandra:v151 localhost:5001/cassandra:v15
#docker image push localhost:5001/cassandra:v15

# Apply local-path provisioner if not available already!
#kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.24/deploy/local-path-storage.yaml
