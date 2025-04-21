local vim = vim

local function setup_schema(uri)
  for _, client in pairs(vim.lsp.get_clients()) do
    if client['name'] == 'yamlls' then
      local settings = client['config']['settings']
      settings['yaml']['schemas'] = {}
      settings['yaml']['schemas'][uri] = '*'
      -- print(vim.inspect(settings))

      client:notify('workspace/didChangeConfiguration', {settings=settings})
    end
  end
end

local function on_attach(args)
  local tree = vim.treesitter.get_parser():parse()[1]
  local node = tree:root()
  while node do
    -- print(node)
    if node:type() == 'block_mapping' then
      break
    end

    local node_changed = false
    for child, _ in node:iter_children() do
      if child:type() == 'comment' then
      else
	node = child
	node_changed = true
	break
      end
    end

    if not node_changed then
      return nil
    end
  end


  for child, _ in node:iter_children() do
    local key = vim.treesitter.get_node_text(child:child(0), 0)

    if key == 'swagger' then
      setup_schema('https://json.schemastore.org/swagger-2.0.json')
      return
    end

    if key == 'openapi' then
      setup_schema('https://spec.openapis.org/oas/3.0/schema/2021-09-28')
      return
    end
  end
end

vim.api.nvim_create_autocmd({'LspAttach'}, {
  pattern = '*.yaml',
  callback = on_attach
})
