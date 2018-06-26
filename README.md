# Bldr resource

a Concourse resource for triggering builds when new habitat packages are promoted to channels

## Source configuration

* `origin`: _Required_ the package origin
* `name`: _Required_ the package name
* `channel`: _Optional_ the bldr channel to watch. Defaults to stable.
* `platform`: _Optional_ the package platform to filter on. Defaults to x86_64-linux
* `bldr_url`: _Optional_ the bldr server to check against. Defaults to https://bldr.habitat.sh/v1/depot/.

### Example

```
resource_types:
- name: hab-pkg
  type: docker-image
  source:
    repository: jonlives/hab-resource
    tag: latest
    
resources:
  - name: hab-pkg
    type: hab-pkg
    source:
      origin: jonlives
      name: national-parks
      channel: unstable


jobs:
- name: hab-query
  plan:
    - get: hab-pkg
      trigger: true
```

## Behaviour

### `check`: Returns all package versions on a channel
Will return a list (in ascending order) of all versions of a package on the specified channel

### `in`: Get the latest package version on the specified channel
Will return the version and release numbers for the most recently promoted version of the specified package to the specified channel

## Attribution
This resource borrows very very heavily from eeyun/bldr-resource
