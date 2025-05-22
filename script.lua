local input = function(val)
	local is_vim_fn_available = vim.fn and true or false
	if is_vim_fn_available then
		return vim.fn.input(val)
	end

	io.write(val)
	return io.read()
end

local README_STR = (function()
	local file = io.open("./README_TEMPLATE.md", "r")
	if not file then
		file = io.open("./README.md", "r")
	end
	local content = file:read("*a")
	file:close()
	return content
end)()

local plugin = {
	name = {
		placeholder = (function()
			local first_line = README_STR:match("([^\n]*)")
			local title = first_line:match("^#%s*(.+)")
			print("The detected placeholder is: ", title)
			return title
		end)(),
		value = input("What's the name of the plugin? "),
	},
	url = {
		placeholder = "repository_url",
		value = input("Type the repository's URL: "),
	},
}

local file_opts = {
	remove = {
		handler = function(path)
			os.remove(path)
		end,
		items = {
			"./README_TEMPLATE.md",
		},
	},
	rename = {
		handler = function(item)
			local default_path = string.format(item, plugin.name.placeholder)
			local updated_path = string.format(item, plugin.name.value)
			os.rename(default_path, updated_path)
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
					local replaced_name = string.gsub(README_STR, plugin.name.placeholder, plugin.name.value)
					local final_readme = string.gsub(replaced_name, plugin.url.placeholder, plugin.url.value)
					return final_readme
				end)(),
			},
		},
	},
}

for _, opt_name in ipairs({ "rename", "write", "remove" }) do
	local opt_data = file_opts[opt_name]
	for _, item in pairs(opt_data.items) do
		opt_data.handler(item)
	end
end

print("\nAll changes are finished. Have fun working on your plugin! :)")
