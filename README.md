docker build --rm -t dreg-dev.nexxera.com/clamav/clamav-server:latest .

docker push dreg-dev.nexxera.com/clamav/clamav-server:latest

docker run -d --name clamav-server -p 3310:3310 -e HTTP_PROXY=pxdev.nexxera.com dreg-dev.nexxera.com/clamav/clamav-server
