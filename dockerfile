#
#   Gabriela Mańka
#

# Stage 1 : budowanie
# na bazie obrazu node:14-alpine
FROM node:14-alpine as build

# ustawienie katalogu roboczeno
WORKDIR /server

# przekopiowanie zależności oraz aplikacji do kontenera
COPY package.json ./
COPY src ./src
COPY public ./public

# zainstalowanie zależności
RUN npm install
# zbudowanie aplikacji
RUN npm run build

# Stage 2 : wystawienie
FROM nginx:1.21.1-alpine

# przekopiowanie aplikacji oraz konfiguracji serwera do kontenera
COPY --from=build /server/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# wystawienie usługi na port 80
EXPOSE 80

# sprawdzenie dzialania serwera
HEALTHCHECK --interval=10s --timeout=1s \
 CMD curl -f http://localhost:80/ || exit 1

# wystawienie serwera
CMD ["nginx", "-g", "daemon off;"]