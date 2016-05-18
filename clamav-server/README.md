# DOCKER

docker build --rm -t geovanasouza/clamav-server:latest .

docker push geovanasouza/clamav-server:latest

docker run -d --name clamav-server -p 3310:3310 -e HTTP_PROXY=myproxy.com geovanasouza/clamav-server

# OPENSHIFT

oc new-project clamav

oc create -f user.yaml

oadm policy add-scc-to-user system:serviceaccount:clamav:clamav

oc create -f pvc.json

oc new-app --name clamav-server -e HTTP_PROXY=myproxy.com geovanasouza/clamav-server:latest -l app=clamav-server

oc patch dc clamav-server --patch '{"spec":{"template":{"spec":{"serviceAccountName": "clamav"}}}}'

oc volume dc/clamav-server --add --overwrite -t persistentVolumeClaim --claim-name=clamav-server-claim --name=clamav-server-storage -m /var/lib/clamav
