local input = function(val)
	local is_vim_fn_available = vim.fn and true or false
	if is_vim_fn_available then
		return vim.fn.input(val)
	end

	io.write(val)
	return io.read()
end

local plugin = {
	name = {
		placeholder = "plugin_name",
		value = input("What's the name of the plugin? "),
	},
	url = {
		placeholder = "repository_url",
		value = input("Type the repository's URL: "),
	},
}

local order = {
	"rename",
	"remove",
	"write",
}

local actions = {
	remove = {
		handler = function(path)
			os.remove(path)
		end,
		items = {
			"./README.md",
		},
	},
	rename = {
		handler = function(item)
			os.rename(string.format(item, plugin.name.placeholder), string.format(item, plugin.name.value))
		end,
		items = {
			"./plugin/%s.lua",
			"./lua/%s",
			"./doc/%s.txt",
		},
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
				str = "",
			},
			{
				path = "./README.md",
				str = (function()
					local file = io.open("./README_TEMPLATE.md", "r")
					local content = file:read("*a")
					local replaced_name = string.gsub(content, plugin.name.placeholder, plugin.name.value)
					local final_readme = string.gsub(replaced_name, plugin.url.placeholder, plugin.url.value)
					return final_readme
				end)(),
			},
		},
	},
}

for _, action_key in ipairs(order) do
	local action_data = actions[action_key]
	for _, item in pairs(action_data.items) do
		action_data.handler(item)
	end
end

print("\nAll changes are finished. Have fun working on your plugin! :)")
