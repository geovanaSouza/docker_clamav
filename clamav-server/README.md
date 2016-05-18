# DOCKER

docker build --rm -t geovanasouza/clamav-server:latest .

docker push geovanasouza/clamav-server:latest

docker run -d --name clamav-server -p 3310:3310 -e HTTP_PROXY=myproxy.com geovanasouza/clamav-server

# OPENSHIFT

oadm policy add-scc-to-group privileged system:serviceaccounts:geovana

oc create -f pvc.json

oc new-app --name clamav-server -e HTTP_PROXY=myproxy.com geovanasouza/clamav-server:latest -l app=clamav-server

oc volume dc/clamav-server --add --overwrite -t persistentVolumeClaim --claim-name=clamav-server-claim --name=clamav-server-storage -m /var/lib/clamav

oc edit -o json dc clamav-server

Acrescentar o securityContext conforme estrutura abaixo:
```
                        "securityContext": {
                            "privileged": true
                        }
```

Inserir na seguinte estrutura:
```
            "spec": {
                "containers": [
                    {
                        "name": "xyz",
                        "image": "xyz",
                        "ports": [
                            {
				...
                            }
                        ],
                        "imagePullPolicy": "IfNotPresent",
                        "securityContext": {
                            "privileged": true
                        }
                    }
                ],
                "restartPolicy": "Always",
                "terminationGracePeriodSeconds": 30,
                "dnsPolicy": "ClusterFirst",
                "securityContext": {}
            }
```
