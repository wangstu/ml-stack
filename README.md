# ml-stack

## ml-stack-dev
```
helm install ubuntu2204 charts/ml-stack-dev --set ssh.pubkey="$(cat ~/.ssh/id_rsa.pub)" --set image.repository=ubuntu --set image.tag=22.04
```