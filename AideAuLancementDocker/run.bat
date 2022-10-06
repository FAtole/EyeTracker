docker container rm eyetracker 
docker image rm eyetracker_python_test
docker build -t eyetracker_python_test .
docker run -it --name eyetracker -e DISPLAY=192.168.56.1:0 -v C:\Users\anato:\anato eyetracker_python_test