FROM python:3.8

RUN pip install -U pip setuptools
# Install Tobii
RUN pip install tobii_research

# Download Package Information
RUN apt-get update -y
# Install Tkinter
RUN apt-get install tk -y

RUN apt-get install sudo


WORKDIR /usr/app/src
COPY projecteyetracker ./projecteyetracker

