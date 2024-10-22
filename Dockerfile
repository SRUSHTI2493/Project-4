# Use the latest Ubuntu image
FROM ubuntu:latest

# Update the package repository and install required packages
RUN apt-get -y update
RUN apt-get install -y apache2 curl zip unzip

# Add a zip file from the internet or replace with a local zip file if URL fails
ADD https://www.free-css.com/assets/files-css-templates/download/page261/avalon.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html

# Unzip the downloaded template file
RUN unzip avalon.zip

# Copy files from the unzipped folder to the web server's root directory
RUN cp -rvf avalon/* .

# Clean up by removing unnecessary files and folders
RUN rm -rf avalon avalon.zip

# Set up the Apache server entry point and start command
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80 for HTTP
EXPOSE 80

