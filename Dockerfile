# Imagen base con Ruby
FROM ruby:3.2

# Instala dependencias necesarias
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Crea directorio de la app
WORKDIR /app

# Copia Gemfile y Gemfile.lock primero para aprovechar cache
COPY Gemfile Gemfile.lock ./

# Instala gems
RUN bundle install

# Copia el resto del código
COPY . .

# Precompila assets con un secret dummy
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Expone el puerto de Puma
EXPOSE 3000

# Comando por defecto: arranca Puma con la configuración de Rails
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

ENV SECRET_KEY_BASE=727c08bd27afc1fd25d7912dbdd1e2f44cb5b9b04dc11b2224de2fe87e4321410cdeeedd5750ad1843d9df6c9f246da44862c616f17c2219e0d957b960e9807f
