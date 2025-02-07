FROM python:3.7.9

# Install libgl1-mesa-glx to provide libGL.so.1
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Copy your application files into the container
COPY . .

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

# Install Gunicorn (WSGI server)
RUN pip install gunicorn

# Expose port 5000
EXPOSE 5000

# Command to run the app using Gunicorn
CMD ["gunicorn", "server:app", "--host", "0.0.0.0", "--port", "5000"]
