docker container rm eyetracker2 
docker image rm eyetracker_python_2
docker build -f Dockerfile.2 -t eyetracker_python_2 .
docker run -d -it  --name eyetracker2 -e DISPLAY=172.29.208.1:0  -v C:\Users\anato:\anato --privileged -v /dev/bus/usb/:/dev/bus/usb eyetracker_python_2
