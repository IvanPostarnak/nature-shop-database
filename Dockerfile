FROM postgres:16beta1-bullseye
WORKDIR /app
ENV POSTGRES_USER=postgres POSTGRES_PASSWORD=postgres POSTGRES_DB=nature_shop
EXPOSE 5432
COPY . .