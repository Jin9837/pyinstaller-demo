# 🎯 Goal： Jenkins + PyInstaller Demo (CI/CD with Docker and GitHub)
Build and package a Python script into a .exe (Windows) or binary (Mac/Linux) using PyInstaller, inside a Docker container, triggered from GitHub push via Jenkins.


## 1. Install Jenkins
```
install jenkins: brew install jenkins-lts
```
```
start jenkins: brew services start jenkins-lts
```
```
stop jenkins:  brew services stop jenkins-lts
```

### Problem Encountered

When accessing Jenkins via [http://localhost:8080/](http://localhost:8080/), it redirected to a login page but I didn't have a username or password.

To find the Jenkins home directory, I used:

```bash
ps aux | grep jenkins
```

Output:

```
/opt/homebrew/opt/openjdk@17/bin/java -Dmail.smtp.starttls.enable=true -jar /opt/homebrew/opt/jenkins-lts/libexec/jenkins.war --httpListenAddress=127.0.0.1 --httpPort=8080
```

This shows Jenkins was being run directly via the `.war` file located at:

```
/opt/homebrew/opt/jenkins-lts/libexec/jenkins.war
```

## 2. Install Docker

To verify Docker installation:

```bash
docker --version
```

To test Docker:

```bash
docker run hello-world
```

If successful, it should print:

```
Hello from Docker!
```


## 3. Create GitHub Repository

1. Go to GitHub and create a new repository (e.g. `pyinstaller-demo`).
2. Open Terminal and run:

```bash
>>>>>>> 411dc2c (update readme)
cd ~/Desktop
mkdir pyinstaller-demo
cd pyinstaller-demo
git init
git remote add origin https://github.com/<your-username>/pyinstaller-demo.git
<<<<<<< HEAD
4. Prepare Python Project
Inside your project directory:
•	app.py
print("Hello from PyInstaller app!")
•	requirements.txt
pyinstaller
5. Create Dockerfile
In your project root:
=======
```

## 4. Prepare Python Project

Inside your project directory:

- `app.py`

```python
print("Hello from PyInstaller app!")
```

- `requirements.txt`

```
pyinstaller
```

## 5. Create Dockerfile

In your project root:

```Dockerfile
>>>>>>> 411dc2c (update readme)
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y binutils && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Run PyInstaller
RUN pyinstaller --onefile app.py
<<<<<<< HEAD
6. Create Jenkinsfile
=======
```

## 6. Create Jenkinsfile

```groovy
>>>>>>> 411dc2c (update readme)
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/pyinstaller-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '/usr/local/bin/docker build -t pyinstaller-demo .'
            }
        }

        stage('Run PyInstaller Binary') {
            steps {
                echo 'Binary should be located in /dist folder of the container'
            }
        }
    }
}
<<<<<<< HEAD
 
7. Configure Jenkins Job
1.	Go to Jenkins > New Item > Choose “Pipeline”
2.	Configure GitHub repository URL.
3.	Paste Jenkinsfile content in the pipeline script field (or let it pull from repo).
 
8. GitHub Webhook Setup
1.	Go to GitHub repo > Settings > Webhooks
2.	Payload URL: Use ngrok to expose Jenkins:
ngrok http 8080
Then use the HTTPS URL shown (e.g., https://abc123.ngrok.io/github-webhook/)
3.	Content Type: application/json
4.	Secret: Set a shared secret (e.g., MyGitHubSecret123)
5.	Events: Just the “push” event
6.	Save
Enable GitHub Webhook Secret in Jenkins
1.	Install GitHub plugin in Jenkins
2.	Go to: Jenkins > Manage Jenkins > Configure System
3.	Scroll to GitHub Servers, add a new server:
o	Name: GitHub
o	API URL: https://api.github.com
o	Credentials: Add new Secret Text
	Secret: Same as GitHub secret
	ID: github-webhook-secret
Enable Trigger
In the Jenkins job configuration:
•	Go to Build Triggers
•	Check “GitHub hook trigger for GITScm polling”
 
9. Test the Pipeline
1.	Make any commit and push to GitHub
=======
```

---

## 7. Configure Jenkins Job

1. Go to Jenkins > New Item > Choose "Pipeline"
2. Configure GitHub repository URL.
3. Paste Jenkinsfile content in the pipeline script field (or let it pull from repo).

---

## 8. GitHub Webhook Setup

1. Go to GitHub repo > Settings > Webhooks
2. Payload URL: Use [ngrok](https://ngrok.com/) to expose Jenkins:

```bash
ngrok http 8080
```

Then use the HTTPS URL shown (e.g., `https://abc123.ngrok.io/github-webhook/`)

3. Content Type: `application/json`
4. Secret: Set a shared secret (e.g., `MyGitHubSecret123`)
5. Events: Just the "push" event
6. Save

### Enable GitHub Webhook Secret in Jenkins

1. Install **GitHub plugin** in Jenkins
2. Go to: Jenkins > Manage Jenkins > Configure System
3. Scroll to **GitHub Servers**, add a new server:
   - Name: `GitHub`
   - API URL: `https://api.github.com`
   - Credentials: Add new `Secret Text`
     - Secret: Same as GitHub secret
     - ID: `github-webhook-secret`

### Enable Trigger

In the Jenkins job configuration:

- Go to **Build Triggers**
- Check "GitHub hook trigger for GITScm polling"

---

## 9. Test the Pipeline

1. Make any commit and push to GitHub

```bash
>>>>>>> 411dc2c (update readme)
echo "# test" >> README.md
git add .
git commit -m "Test GitHub webhook to Jenkins"
git push origin main
<<<<<<< HEAD
2.	GitHub should show a green check in Webhook > Recent Deliveries
3.	Jenkins should start the build automatically
✅ If successful, your PyInstaller binary will be built inside Docker via Jenkins, triggered from a GitHub push!
 
End of Guide ✨
![image](https://github.com/user-attachments/assets/e276d969-baf3-4818-96f1-804a7716501d)

=======
```

2. GitHub should show a green check in Webhook > Recent Deliveries
3. Jenkins should start the build automatically

✅ If successful, your PyInstaller binary will be built inside Docker via Jenkins, triggered from a GitHub push!

---

End of Guide ✨
>>>>>>> 411dc2c (update readme)

