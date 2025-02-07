FROM python:3.7.9

# Install libgl1-mesa-glx to provide libGL.so.1
RUN apt-get update && apt-get install -y libgl1-mesa-glx

COPY . .
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt
RUN pip install "uvicorn[standard]"
EXPOSE 5000
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "5000"]
