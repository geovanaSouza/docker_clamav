# DOCKER

docker build --rm -t geovanasouza/clamav-rest:latest .

docker push geovanasouza/clamav-rest:latest

docker run -p 8080:8080 --link clamav-server:clamav-server --name clamav-rest -e host_clamav_server=clamav-server -e port_clamav_server=3310 geovanasouza/clamav-rest

# OPENSHIFT

oadm policy add-scc-to-group privileged system:serviceaccounts:geovana

oc new-app --name clamav-rest -e host_clamav_server=clamav-server port_clamav_server=3310 geovanasouza/clamav-rest:latest -l app=clamav-rest

oc expose service clamav-rest --hostname=clamav.10.2.2.2.xip.io

Expor via https:

oc patch route clamav-rest  -p '{"spec": {"tls": {"termination": "edge","insecureEdgeTerminationPolicy": "Redirect"}}}'
