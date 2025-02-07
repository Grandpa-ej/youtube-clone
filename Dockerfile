FROM python:3.7.9

# Copy the project files into the container
COPY . .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

# Install Gunicorn
RUN pip install gunicorn

# Expose the port on which the app will run
EXPOSE 5000

# Run the application using Gunicorn
CMD ["gunicorn", "server:app", "--bind", "0.0.0.0:5000"]
