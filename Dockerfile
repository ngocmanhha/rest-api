FROM harbor.intgdc.com/tools/gdc-node:89999e9 as build-stage

LABEL image_name="GoodData pipeline-shared-libs image based on gdc-node-89999e9"
LABEL maintainer="SETI Team <guild.seti@gooddata.com>"
LABEL git_repository_url="https://github.com/null/null"
LABEL parent_image="harbor.intgdc.com/tools/gdc-node:89999e9"
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

WORKDIR /app
COPY . /app/
RUN cd /app && yarn install --frozen-lockfile
RUN yarn build

FROM harbor.intgdc.com/tools/gdc-node:89999e9

LABEL image_name="GoodData pipeline-shared-libs image based on gdc-node-89999e9"
LABEL maintainer="SETI Team <guild.seti@gooddata.com>"
LABEL git_repository_url="https://github.com/null/null"
LABEL parent_image="harbor.intgdc.com/tools/gdc-node:89999e9"
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

WORKDIR /app
COPY --from=build-stage /app/dist /app
COPY --from=build-stage /app/node_modules /app/node_modules
