FROM node:22-alpine

LABEL version="14.10.1"
LABEL repository="https://github.com/w9jds/firebase-action"
LABEL homepage="https://github.com/w9jds/firebase-action"
LABEL maintainer="Jeremy Shore <w9jds@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN apk update && apk add --no-cache jq openjdk11-jre

RUN npm i -g npm@10.9.2 && npm cache clean --force
RUN npm i -g firebase-tools@14.10.1 && npm cache clean --force

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
