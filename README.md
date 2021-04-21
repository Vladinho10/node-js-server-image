# Dockerizing a Node.js app

## Table of contents
* [Server app](#server-app)
* [docker](#docker)
* [Dockerizing Process](#dockerizing-process)


### Server app
We are going to create a Docker image for Node.js app.\
It's very simple, 12-line Node.js server-app. The app doesn't depend on any other technologies or tools, e.g. database, searching engine and so on. \
The app consist of these files \
index.js \
package.json \
package-lock.json \
There is only one dependency in package.json, it's Express.js framework.

### Docker
There are 2 files related docker
.dockerignore \
Dockerfile \
In .dockerignore file you should add ignoring files or directory which you don't want to build in docker image. \
About Dockerfile content is written in Node.js official [doc](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/). There are 2 small differences between our and their Dockerfile files.\
I changed `WORKDIR` to `/usr/src/`, and removed `EXPOSE` part.

### Dockerizing Process
`docker build . -t yourHubDockerUsername/yourImageName`\
(in my case: docker build . -t vladdius/node-js-server-image)\
`docker tag yourImageId vladdius/node-js-server-image:version1.0`\
(it's an option command, if you want you can add `:version1.0`, otherwise it's default `latest` version)\
Create your image repository in docker hub, as we do it in github for git repositories.\
(in our vladdius/node-js-server-image:version1.0)
`docker login` (type Docker hub your credentials)\
`docker push yourHubDockerUsername/yourImageName`\
(docker push node-js-server-image:version1.0)

`docker run -p mapping-port:nodejs-app-port --name your-custom-container-name -d yourImageName`\
(docker run -p 4004:4002 --name node-server-container -d vladdius/node-js-server-image:version1.0)\
Tip: on mac OS `--name your-custom-container-name` part is required. 

Try in your browser.
http://localhost:`mapping-port`\
(http://localhost:4004)

Docker hub [link](https://hub.docker.com/r/vladdius/node-js-server-image) of this image.

<img src="docker-node.png"  alt="docker-node.js"/>
