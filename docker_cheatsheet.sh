$docker pull image-name
$docker images  #List all the images 

$docker run image_name:latest    #run a instance of container for the image_name
$docker run -d image_name:latest    #run the container in detached mode (you can get the port the container is pointing to by running $docker ps, we would use to map it on our localhost:8080)
$docker run image_name:latest bash  #you want to run the container with bash 
$docker run -d -p 8080:80 image_name:latest      #if the image runs at 80 port we are now

directing it to localhost:8080 and would be able to see on a webpage
$docker run -d -p 8080:80 -p 3000:80 image_name:latest  #can run same container on multiple ports
$docker run --name myName -d -p 8080:80 image_name:latest



$docker ps      #List all the running containers
$docker ps -a   #List all running and not running containers
$docker ps -aq  #a argument give output for all containers, q -> quitely only returns the container ids for them

#A nicer format for ps(export FORMAT=below_string)
"ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

$docker ps --format=$FORMAT 


$docker stop CONTAINER_ID        #stops the running container
$docker stop CONTAINER_NAME

$docker rm CONTAINER_ID ID       #remover the container (must need to stop container first)
$docker rm $(docker ps -aq)      #remove all the available containers

# filter and delete stopped containers
$docker rm $(docker ps -a -f status=exited -q)

$docker rmi image_name           #deletes the images from system
$docker rmi -f image_name        #force delete the image


Volumes - Allows sharing of data. File and folder, btw host and containers, and with multiple containers
$docker run -d -v /path/to/host/files:/path/inside/container:ro -p 8080:80 image_name:latest  # -v tag for volume, specify the paths, and ro/rw (read only rw mount option), with no mode passed it means rw mode

Volumes sharing between containers
$docker run --name continer_new --volumes-from some_other_container -d -p 8080:80 image_name:latest    #This create a new container of image_name with container name as container_new, and share the volume from a container named some_other_container


excec container in (-i)interactive mode (-t)Allocate a pseudo-TTY in our case let say bash
$docker exec -it container_name bash


Build a dockerfile
$docker build --tag image_name:tag_name /path/to/your/dockerfile

# you can specify $dockerfile name with -f option
$docker build -f mydockerfile -t myapp_debug /path/to/mydockerfile


# dangling images <none> <none>
$docker images --filter "dangling=true"

# remove all dangling images
$docker rmi -f $(docker images -q --filter "dangling=true")


# pushing images to $docker registry
# first tag the image and then push it
$docker tag local_build_image:tag user_name/image_name:tag

#first create a repository on you $docker registry with image_name
$docker push user_name/image_name:tag

# Inspect command to, get whole information about the containers to inspect some problem
$docker inspect CONTAINER_ID/CONTAINER_NAME

# Get console logs from a container
$docker logs CONTAINER_ID
$docker logs -f CONTAINER_ID #tailf logs with -f flag

#Create volumes to be shared between containers
$docker volume create volume_name
$docker volume ls  #list all the volume available
$docker inspect volume_name #gives all the information about the voulme created


#misc
$docker run --name ipu-v15 -it -v /home/suhail/Documents/Codes/ipu_2dtg:/home/root/ipu_2dtg ipu_v15:latest
$docker create -it --name ipu_v20 -v /home/suhail/Documents/Codes/ipu_2dtg:/root/ipu_2dtg ipu_v20:latest
$docker start ipu_v20
$docker exec ipu_v20  cmake .. 
$docker exec make -j5
$docker stop ipu_v20
$docker rm ipu_v20


$docker exec ipu_v20 cd /root/ipu_2dtg/build && cmake .. && make -j5
$docker exec ipu_v20 make -j5 -C /root/ipu_2dtg/build
