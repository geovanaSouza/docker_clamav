# DOCKER

docker build --rm -t dreg-dev.nexxera.com/clamav/clamav-server:latest .

docker push dreg-dev.nexxera.com/clamav/clamav-server:latest

docker run -d --name clamav-server -p 3310:3310 -e HTTP_PROXY=pxdev.nexxera.com dreg-dev.nexxera.com/clamav/clamav-server

# OPENSHIFT

oadm policy add-scc-to-group privileged system:serviceaccounts:geovana

oc create -f pvc.json

oc new-app --name clamav-server -e HTTP_PROXY=pxdev.nexxera.com dreg-dev.nexxera.com/clamav/clamav-server:latest -l app=clamav-server

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
