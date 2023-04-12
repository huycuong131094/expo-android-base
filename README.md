# Dockerfile for Expo EAS Android Build Environment

This Dockerfile is used to build a base image for building Expo applications using the Expo Application Services (EAS) build environment for Android. It is inspired by the original base image from [rdnxk/android-sdk-docker](https://gitlab.com/rdnxk/android-sdk-docker).

## Prerequisites
- Docker installed on your system

## Usage

1. Clone the repository with the Dockerfile to your local machine.
2. Change directory to the cloned repository.
3. Build the Docker image using the following command:
```bash
docker build -t expo-eas-android-build .
```
4. Once the image is built, you can use it as the base image in your Expo application's Dockerfile.


Example usage in your Expo application's Dockerfile:

```Dockerfile
# Use expo-eas-android-build as the base image
FROM expo-eas-android-build

# Set working directory
WORKDIR /app

# Copy dependencies declaration and install
COPY package* /app

RUN npm i

# Copy source code
COPY . .

# Run health check for expo project
RUN npx expo-cli doctor

# Prebuild step for android
RUN npx expo prebuild --platform android

WORKDIR /app/android

# Build android project
RUN ./gradlew --warning-mode none --no-daemon :app:assembleRelease

# Your additional build steps
...
```

This Dockerfile sets up the necessary environment variables and installs the Expo CLI, following the recommended Android build server configurations mentioned in the [Expo documentation](https://docs.expo.dev/build-reference/infrastructure/#android-build-server-configurations).

Note: You may need to customize the Dockerfile further based on your specific requirements and dependencies.

Feel free to reach out if you need any further assistance!