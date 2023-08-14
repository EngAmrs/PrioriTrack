FROM ruby:3.2.2

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

# Install Bundler
RUN gem install bundler

# Set working directory
WORKDIR /PrioriTrack

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy entrypoint script and give it executable permissions
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

# Copy the rest of the application code
COPY . .

# Expose port
EXPOSE 3000

# Set the command to run the entrypoint script
CMD ["./entrypoint.sh"]
