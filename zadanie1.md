# chmury_zad1

Rozwiązanie zadania 1 z technologii chmurowych.

Gabriela Mańka


<h3>1. Struktura aplikacji</h3>

[Upload server/src/App.js]

![Struktura folderu]

![Działanie aplikacji]

<h3>2. Dockerfile</h3>

[Upload server/dockerfile]

<h3>3. Komendy</h3>

`docker build -t zad1:v0.5 .`
![Budowanie obrazu]

`docker run -d -p 80:80 --name zad1 zad1:v0.5`
![Włączenie kontenera]

`docker logs zad1`
![Logi kontenera]

`docker history zad1:v0.5`
![Warstwy]
