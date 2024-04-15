#!/bin/bash

# See: https://stackoverflow.com/questions/43978837/how-to-check-if-docker-daemon-is-running
{
    docker ps -q
} || {
    echo "Docker daemon not running - launch docker!"
    exit 1
}

if docker ps | grep -q my-postgres; then
    echo -e "PostreSQL container already running on port 5342\nConnect to it via:\n\tdocker exec -it my-postgres psql -U postgres"
    exit 2
fi

docker pull postgres

docker run --name my-postgres -e POSTGRES_PASSWORD=password -d -p 5342:5342 postgres

echo -e "PostgreSQL running on port 5342\nConnect to it via:\n\tdocker exec -it my-postgres psql -U postgres"
