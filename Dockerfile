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
RUN pip install jupyter jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable collapsible_headings/main && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable freeze/main && \
    jupyter nbextension enable hide_input/main && \
    jupyter nbextension enable highlighter/highlighter && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable autosavetime/main && \
    jupyter nbextension enable toggle_all_line_numbers/main && \
    jupyter nbextension enable scratchpad/main && \
    jupyter nbextension enable comment-uncomment/main && \
    jupyter nbextension enable code_prettify/code_prettify && \
    jupyter nbextension enable code_prettify/isort && \
    jupyter nbextension enable codefolding/edit && \
    jupyter nbextension enable codefolding/codefolding && \
    jupyter nbextension enable notify/notify && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable move_selected_cells/main && \
    jupyter nbextension enable select_keymap/main && \
    jupyter nbextension enable freeze/main && \
    jupyter nbextension enable table_beautifier/main && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable collapsible_headings/main && \
    jupyter nbextension enable nbextensions_configurator/config_menu/main && \
    jupyter nbextension enable hide_input/main && \
    jupyter nbextension enable highlighter/highlighter && \
    jupyter nbextension enable scratchpad/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable autosavetime/main && \
    jupyter nbextension enable toggle_all_line_numbers/main && \
    jupyter nbextension enable comment-uncomment/main && \
    jupyter nbextension enable code_prettify/code_prettify && \
    jupyter nbextension enable code_prettify/isort && \
    jupyter nbextension enable notify/notify && \
    jupyter nbextension enable move_selected_cells/main && \
    jupyter nbextension enable select_keymap/main && \
    jupyter nbextension enable table_beautifier/main && \
    jupyter nbextension enable freeze/main

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
