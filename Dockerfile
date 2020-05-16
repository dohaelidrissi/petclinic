FROM openjdk:8
EXPOSE 8080
RUN apt-get update -y && \
    apt-get install maven git -y 
RUN   git clone https://gitlab.com/bouchtateam/petclinic.git && \
      cd petclinic && \
      mvn install package && \
      cp target/*.jar /petclinic.jar
    
#ADD target/*.jar petclinic.jar
ENTRYPOINT ["java","-jar","-DMYSQL_HOST=mysql","/petclinic.jar"]