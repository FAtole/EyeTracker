FROM python:3.8-slim

RUN pip install -U pip setuptools
# Install Tobii
RUN pip install tobii_research

# Download Package Information
RUN apt-get update -y
# Install Tkinter
RUN apt-get install tk -y

#install pygaze
RUN pip install python-pygaze

RUN apt install sudo
RUN sudo apt-get install python3-pygame
RUN python -m pip install pygame
RUN sudo apt-get install python-imaging
RUN sudo apt-get install psychopy
RUN pip install numpy


WORKDIR /usr/app/src
COPY projecteyetracker ./projecteyetracker
COPY simple_tracker_experiment ./simple_tracker_experiment

