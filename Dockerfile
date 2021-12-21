FROM openjdk:11-slim
ARG APP_NAME=spring-boot
ARG VERSION=0.0.0
ARG GIT_COMMIT_SHA

ADD build/distributions/$APP_NAME.tar /
WORKDIR /$APP_NAME
ADD https://dtdg.co/latest-java-tracer /dd-java-agent.jar
ENV JAVA_OPTS -javaagent:/dd-java-agent.jar
ENV DD_SERVICE=$APP_NAME
ENV DD_VERSION=$VERSION
ENV DD_TAGS=git.commit.sha:$GIT_COMMIT_SHA

CMD [ "bin/$APP_NAME" ]
