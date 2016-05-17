# DOCKER

docker build --rm -t dreg-dev.nexxera.com/clamav/clamav-rest:latest .

docker push dreg-dev.nexxera.com/clamav/clamav-rest:latest

docker run -p 8080:8080 --link clamav-server:clamav-server --name clamav-rest -e host=clamav-server dreg-dev.nexxera.com/clamav/clamav-rest

# OPENSHIFT

oadm policy add-scc-to-group privileged system:serviceaccounts:geovana

oc new-app --name clamav-rest -e host=clamav-server dreg-dev.nexxera.com/clamav/clamav-rest:latest -l app=clamav-rest


oc edit -o json dc clamav-rest

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
