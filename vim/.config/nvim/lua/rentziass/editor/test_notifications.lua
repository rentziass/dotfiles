local notify = require("notify")
local fidget = require("fidget")
local progress = require("fidget.progress")

---@param client neotest.Client
local function init(client)
  local handle = nil
  client.listeners.run = function(adapter_id, root_id, position_ids)
    handle = progress.handle.create({
      title = "Running tests...",
      lsp_client = { name = "neotest" },
      percentage = 0,
    })
  end

  client.listeners.results = function(_, results, _)
    local total, failed = 0, 0
    for _, result in pairs(results) do
      total = total + 1
      if result.status == "failed" then
        failed = failed + 1
      end
    end

    local msg = failed == 0 and "All tests passed " or (failed .. " of " .. total .. " failed ")
    local level = failed == 0 and "info" or "error"

    if handle then
      handle:report({
        title = msg,
        level = level,
        lsp_client = { name = "neotest" },
      })
      handle:finish()
      handle = nil
    end
  end
end

return setmetatable({}, {
  __call = function(_, client)
    init(client)
  end,
})
