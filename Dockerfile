FROM --platform=linux/x86_64 eclipse-temurin:17-jdk AS build

EXPOSE 8181

VOLUME /tmp

# Server
ENV PORT="PORT"

# Eureka
ENV EUREKA_SERVER_URI="EUREKA_SERVER_URI"


ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","bo.edu.ucb.mabgateway.MabGatewayApplication"]