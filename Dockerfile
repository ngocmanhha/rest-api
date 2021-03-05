FROM harbor.intgdc.com/tools/gdc-node:89999e9 as build-stage

WORKDIR /app
COPY . /app/
RUN cd /app && yarn install --frozen-lockfile
RUN yarn build

FROM harbor.intgdc.com/tools/gdc-node:89999e9
WORKDIR /app
COPY --from=build-stage /app/dist /app
COPY --from=build-stage /app/node_modules /app/node_modules
