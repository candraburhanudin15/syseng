# Gunakan image resmi Python sebagai base image
FROM python:3.10

# Instal Jupyter Notebook
RUN pip install jupyter

# Instal library Python yang dibutuhkan untuk koneksi MySQL
RUN pip install mysql-connector-python

# Instal MySQL Client
RUN apt-get update && apt-get install -y mysql-client

# Install the Jupyter extension for executing SQL code in Jupyter cells
RUN pip install jupyter_contrib_nbextensions && jupyter contrib nbextension install --user && jupyter nbextension enable execute_time/ExecuteTime && jupyter nbextension enable codefolding/main && jupyter nbextension enable collapsible_headings/main

# Install dependencies
COPY app/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Set working directory
WORKDIR /app

# Copy the notebook file into the container
COPY ../app/src/data.ipynb /app/data.ipynb

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook when the container starts
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/app"]
