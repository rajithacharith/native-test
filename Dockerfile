# Auto Generated Dockerfile
FROM ballerina/native-builder:latest as build

WORKDIR /app/build

COPY claim_mgt.jar ./

RUN sh build-native.sh claim_mgt.jar claim_mgt

FROM debian:11-slim

WORKDIR /home/ballerina

USER 10014

EXPOSE 8443

COPY --from=build /app/build/claim_mgt .

CMD ["./claim_mgt"]
