# Auto Generated Dockerfile
FROM ballerina/native-builder:latest as build

WORKDIR /app/build

COPY claim_mgt.jar .

RUN sh build-native.sh claim_mgt.jar claim_mgt

FROM debian:11-slim

RUN useradd -ms /bin/bash ballerina
WORKDIR /home/ballerina


USER ballerina

COPY --from=build /app/build/claim_mgt .

CMD ["./claim_mgt"]
