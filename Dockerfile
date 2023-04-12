FROM redemonbr/android-sdk:node-16-api-33

ENV ASDK_ACCEPT_LICENSES=yes

ENV ASDK_ACCEPT_LICENSES_SILENT=yes

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN yes | sdkmanager --licenses

RUN npm i -g expo-cli

RUN mkdir /root/.gradle

COPY ./gradle.properties /root/.gradle/
