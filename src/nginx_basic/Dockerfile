#FROM tag fetches a base image from dockerhub
FROM nginx:latest
#this will add all the content of current directory to define path in container (this is a way of packaging all the content to the images)
#But any time you changes anything in your files, you need to rebuild the docker image to get the changes shown
ADD . /usr/share/nginx/html
