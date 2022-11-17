docker container rm eyetracker 
docker image rm eyetracker_python_test
docker build -t eyetracker_python_test .
docker run -it --name eyetracker -e DISPLAY=10.41.8.182:0 -v C:\Users\anato:\anato eyetracker_python_test