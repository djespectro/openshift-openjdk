FROM openjdk:latest

WORKDIR /opt/application

COPY ./run.sh ./run.sh
COPY ./quiz.jar ./app.jar

CMD ["sh","run.sh"]
