FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y binutils && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Build with PyInstaller
RUN pyinstaller --onefile app.py

# Run the app (as default container command)
CMD ["./dist/app"]
