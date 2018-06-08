FROM node:9.11

ARG USER="node"
ARG UID="1000"
ARG GROUP="node"
ARG GID="1000"
ENV WORKSPACE="/var/www/"

# set workspace.
RUN mkdir $WORKSPACE -p
WORKDIR $WORKSPACE

# set node user.
RUN groupmod -g $GID $GROUP && usermod -u $UID -g $GID $USER
RUN chown -R $UID:$GID $WORKSPACE
USER $USER

