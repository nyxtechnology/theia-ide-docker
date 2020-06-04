FROM theiaide/theia:latest

USER root
ENV HOME=/home/node
RUN cp /home/theia/* /home/node -r
RUN chown -R node:node /home/node
WORKDIR /home/node
ENV SHELL=/bin/bash THEIA_DEFAULT_PLUGINS=local-dir:/home/node/plugins
RUN rm -rf /home/theia
USER node
ENTRYPOINT ["node", "/home/node/src-gen/backend/main.js", "/home/project", "--hostname=0.0.0.0"]

