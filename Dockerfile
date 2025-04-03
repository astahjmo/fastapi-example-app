# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# Use --no-cache-dir to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable (optional, can be overridden)
ENV PORT=80 
ENV HOST=0.0.0.0

# Run uvicorn when the container launches
# Use --host 0.0.0.0 to make it accessible externally
# Use --port $PORT to use the environment variable
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
