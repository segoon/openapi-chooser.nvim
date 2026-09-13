# openapi-chooser.nvim (deprecated)

> [!WARNING]
> This plugin is deprecated and no longer maintained.
> Use [yaml-schema-selector.nvim](https://github.com/segoon/yaml-schema-selector.nvim)
> instead.

`yaml-schema-selector.nvim` supersedes this plugin and includes built-in
selectors for OpenAPI 3.x and Swagger 2.0. It also supports custom,
content-based schema selection for other YAML documents.

## Migration

Remove `segoon/openapi-chooser.nvim` from your plugin manager and install
`segoon/yaml-schema-selector.nvim` by following its
[installation instructions](https://github.com/segoon/yaml-schema-selector.nvim#installation).

The replacement requires Neovim 0.11 or newer and an already configured
`yaml-language-server`. Call its `setup()` function to enable the built-in
OpenAPI and Swagger selectors:

```lua
require("yaml-schema-selector").setup()
```

No further OpenAPI-specific configuration is required.

## Legacy behavior

This repository remains available for existing users, but it will receive no
new features, fixes, or compatibility updates.

The legacy plugin detects `openapi` and `swagger` keys in YAML documents and
updates the schema configuration of an attached `yamlls` client.
