# Telepresense

Tool to ease local dev with K8s.

https://www.telepresence.io/

Building a docker image and trying it quickly without a deployment.

```
❯ make docker-build && telepresence --swap-deployment the-service-deployment-name --docker-run image-name-of-the-service:image-tag
```
