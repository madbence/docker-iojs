# Use a tiny & bleeding edge iojs image
FROM mhart/alpine-iojs:latest
MAINTAINER Bence Dányi <bence@danyi.me>

# The app lives in /opt/app by default
RUN mkdir -p /opt/app
WORKDIR /opt/app

# If there is an nprc file, copy that first, to create the top cache layer
ONBUILD COPY .npmrc ./

# Create separate cache layer with the package.json
ONBUILD COPY package.json ./
ONBUILD RUN npm install

# Copy the rest of the files
ONBUILD COPY . ./

CMD npm start
