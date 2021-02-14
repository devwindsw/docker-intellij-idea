# Dockerfile for Android Studio

Dockerfile for Intellij IDEA

## Running

### 1. Create a directory for Intellij IDEA on local system
```
mkdir intellij
cd intellij
mkdir .android
mkdir .cache
mkdir .config
mkdir .idea
mkdir .Idea
mkdir .Idea.gradle
mkdir .Idea.java
mkdir .Idea.maven
mkdir .Idea.share
mkdir IdeaProjects
```

### 2. Start a container
```
docker run -it --rm \
  -e DISPLAY=${DISPLAY} \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /path/to/intellij/you/created/.android:/home/devwindsw/.androie \
  -v /path/to/intellij/you/created/.cache:/home/devwindsw/.cache \
  -v /path/to/intellij/you/created/.config:/home/devwindsw/.config \
  -v /path/to/intellij/you/created/.idea:/home/devwindsw/.idea \
  -v /path/to/intellij/you/created/.Idea:/home/devwindsw/.Idea \
  -v /path/to/intellij/you/created/.Idea.java:/home/devwindsw/.java \
  -v /path/to/intellij/you/created/.Idea.maven:/home/devwindsw/.m2 \
  -v /path/to/intellij/you/created/.Idea.gradle:/home/devwindsw/.gradle \
  -v /path/to/intellij/you/created/.Idea.share:/home/devwindsw/.local/share/JetBrains \
  -v /path/to/intellij/you/created/IdeaProjects:/home/devwindsw/IdeaProjects \
  --name idea-$(head -c 4 /dev/urandom | xxd -p)-$(date +'%Y%m%d-%H%M%S') \
  intellij-idea:latest
```
