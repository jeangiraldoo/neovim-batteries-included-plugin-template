local input = (vim.fn) and function(val) return vim.fn.input(val) end
	or function(val)
		io.write(val)
		return io.read()
	end

local name = input("What's the name of the plugin? ")
local url = input("Type the repository's URL: ")

local placeholders = {
	name = "plugin_name",
	url = "repository_url"
}

local order = {
	"rename",
	"remove",
	"write"
}

local actions = {
	remove = {
		handler = function(path) os.remove(path) end,
		items = {
			"./README.md",
		}
	},
	rename = {
		handler = function(item)
			os.rename(
				string.format(item, placeholders.name),
				string.format(item, name)
			)
		end,
		items = {
			"./plugin/%s.lua",
			"./lua/%s",
			"./doc/%s.txt"
		}
	},
	write = {
		handler = function(item)
			local file = io.open(item.path, "w")
			file:write(item.str)
			file:close()
		end,
		items = {
			{
				path = "./.github/FUNDING.yaml",
				str = ""
			},
			{
				path = "./README.md",
				str = (function()
					local file = io.open("./README_TEMPLATE.md", "r")
					local content = file:read("*a")
					local replaced_name = string.gsub(content, placeholders.name, name)
					local final_readme = string.gsub(replaced_name, placeholders.url, url)
					return final_readme
				end)()
			}
		}
	},
}

for _, action_key in ipairs(order) do
	local action_data = actions[action_key]
	for _, item in pairs(action_data.items) do
		action_data.handler(item)
	end
end

print("\nAll changes are finished. Have fun working on your plugin! :)")
