# Use an official Python runtime as a parent image
FROM python:3.8-slim as builder

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install -r requirements.txt

# Use a second stage for the actual application
FROM builder as app

# Copy the application code into the container
COPY . /app/

# Run the Streamlit web app
CMD ["streamlit", "run", "PaLM_ChatPDF.py"]
