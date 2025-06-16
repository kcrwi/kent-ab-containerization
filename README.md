# Purpose
This repo contains a containerized version of the 'node-hostname' application, which displays host information. Currently built to be hosted using ``minikube``, it also contains a template to allow it to run on some cloud service provider of choice.

## Required software
- Docker: https://docs.docker.com/get-started/get-docker/
- Minikube: https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Fx86-64%2Fstable%2Fbinary+download

## Installation and local deployment
### 1. Clone the git repo to get all the files locally:
```bash
git clone git@github.com:kcrwi/kent-ab-containerization.git
```

### 2. Start 'minikube'
```bash
minikube start
```

### 3. Build the Docker Image
```bash
docker build -t node_hostname:latest .
```

### 4. Load Image into Minikube
```bash
minikube image load node_hostname:latest
```
### 5. Deploy to the local Kubernetes cluster

```bash
kubectl apply -f deploy-local.yaml
```
### 6. Access the Application
We can get a URL to the app via our deployed service

```bash
minikube service node-hostname --url
```
Visit the URL in your browser or test with ``curl``:
```bash
curl <HTTP URL from previous command>
```

## To host the app on some cloud provider one has to
- Upload the docker image to a repository of choice
- Edit ``deploy-cloud.yaml`` with a link to the remote image
- Setup a cloud Kubernetes cluster
- Apply the cloud manifest: `kubectl apply -f deploy-cloud.yaml`


## TODOs, what features to work on next
- Automate the deployment using Helm. A simple chart could negate the need for many of these steps.
- Add monitoring and logging to make it easier to see app performance and errors.
- Consider what requests for resourses are proper for the usage of this application. Right now we've only got limits.
- Work on HTTPS support.
    - SSL Certificate?
    - Ingress control like nginx?
- Implement a CI pipeline to allow for better testing, building, deployment.
- Update the repo permissions. It's currently public, which is likely not ideal for the usecase. 
    - Transfer over ownership to 'Kent AB', and make it invite-only.