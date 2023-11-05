FROM xtonev/bigartm:v0.10.0
FROM ubuntu:20.04

# Set the working directory within the container
WORKDIR /app

# prevent question during installation
ENV DEBIAN_FRONTEND=noninteractive
# Update and install necessary packages
RUN apt-get update -y
RUN apt-get install -y python3.9 python3-pip

# Install Python dependencies, including Jupyter
RUN pip3 install --no-cache-dir jupyter topicnet==0.8.0 autotm==0.2.0
RUN pip3 intsall en-core-web-sm==3.7.0

# Expose a port if your application listens on one
EXPOSE 8889

# Define the command to run Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]
