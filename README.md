## Schema Registry UI
https://github.com/lensesio/schema-registry-ui

```
docker pull landoop/schema-registry-ui
docker run --rm -p 8000:8000 -e "SCHEMAREGISTRY_URL=http://host.docker.internal:8081" -e "PROXY=true" landoop/schema-registry-ui
```
