local jdtls = require("jdtls")

-- cari root project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == nil then
  return
end

local home = os.getenv("HOME")

local config = {
  cmd = {
    home .. "/.local/share/nvim/mason/packages/jdtls/bin/jdtls",
    "-data",
    home .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
  },
  root_dir = root_dir,
}

jdtls.start_or_attach(config)
