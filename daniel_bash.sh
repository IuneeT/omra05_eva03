#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp daniel_website.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  daniel_website.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8888" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/daniel_website.py" >> tempdir/Dockerfile

cd tempdir
docker build -t daniel_imagen .

docker run -t -d -p 8888:8888 --name daniel_running daniel_imagen

docker ps -a
