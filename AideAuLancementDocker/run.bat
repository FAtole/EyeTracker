docker container rm eyetracker 
docker image rm eyetracker_python_test
docker build -f Dockerfile.1 -t eyetracker_python_test .
docker run -d -it  --name eyetracker -e DISPLAY=172.29.208.1:0  -v C:\Users\anato:\anato --privileged -v /dev/bus/usb/:/dev/bus/usb eyetracker_python_test
