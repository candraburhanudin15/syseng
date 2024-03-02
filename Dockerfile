# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r app/requirements.txt

# Install MySQL Connector/Python and MySQL Client
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev && \
    pip install mysql-connector-python

# Install Jupyter and Jupyter SQL extension
RUN pip install jupyter

# Install Jupyter and Jupyter SQL extension
RUN pip install jupyterlab

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
