# Healthcare Booking System Backend

## Docker Compose 🐳
Before proceeding with Docker Compose commands, ensure you're in the root directory of the project. 
- To start the containers from the docker-compose file:
    ```bash
    docker-compose up -d
    ```
- To stop the containers from the docker-compose file:
    ```bash
    docker-compose down
    ```
- To remove the container and its volumes:
    ```bash
    docker-compose down -v
    ```
- To open the the database on terminal:
    ```bash
    docker ps -a
    docker exec -it hms-app_db_1 /bin/bash
    mariadb -uroot -p
    enter password:  P@ssw0rd#123456
    use HMS;
    ```
