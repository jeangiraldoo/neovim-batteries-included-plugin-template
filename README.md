# A Neovim plugin template

<p align="center">
    <img src="https://img.shields.io/badge/neovim-%2323D0B8EB?style=for-the-badge&logo=neovim&color=%232E3A59"
        alt="Neovim logo"
    />
    <img src="https://img.shields.io/badge/lua_plugins-%2323D0B8EB?style=for-the-badge&logo=lua&logoColor=%23D0B8EB&color=%232E3A59"
        alt="The template is for Lua plugins"
    />
    <a href = "https://github.com/jeangiraldoo/neovim-plugin-template-batteries-included/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/MIT-%232E3A59?style=for-the-badge&label=License&labelColor=%232E3A59&color=%23F4A6A6"
            alt="Latest version"
        />
    </a>
    <img src="https://img.shields.io/github/repo-size/jeangiraldoo/neovim-plugin-template-batteries-included?style=for-the-badge&logo=files&logoColor=yellow&label=SIZE&labelColor=%232E3A59&color=%23A8D8A1"
        alt="Repository size in KB"
    />
</p>

Welcome to your new, batteries-included Neovim plugin template!
This beginner-friendly template is designed to make creating Neovim
plugins with Lua as simple as possible by providing everything you
need right out of the box.

Every file and folder is thoroughly documented so you can easily
understand its purpose—whether you're just starting your plugin
journey, looking to learn some new tricks, or simply brushing up
on your skills. I hope you enjoy it and happy coding!

## 🚀 Template Features

- **Continuous Integration:** Utilizes GitHub Actions to ensure
  consistent code quality by checking:
  - Code formatting with [Stylua][stylua]
  - Lua linting with [Luacheck][luacheck]
  - Markdown linting with [Markdownlint][markdownlint]
- **Standard Directory Structure:** Comes with a well-organized
  base directory and file structure designed for Neovim plugin
  development.

## 📖 Table of Contents

- [Plugin Structure Overview][plugin_structure]
- [Get started](#get-started)
- [Code Formatting and Linting](#code-formatting-and-linting)
- [Markdown Linting](#markdown-linting)

## <a id="plugin-structure"></a> 📂 Plugin Structure Overview

```lua
.
├── lua
│   └── plugin_name
│       └── init.lua
├── plugin
│   └── plugin_name.lua
├── doc
│   └── plugin_name.txt
├── .github
│   ├── FUNDING.yaml
│   └── workflows
│       ├── markdown_linting.yaml
│       └── code_checks.yaml
└── README.md
```

- lua/plugin_name: This directory is automatically loaded
  by Neovim and is intended to hold your plugin’s core logic.
- plugin: Lua files in this directory are also auto-loaded by
  Neovim. Typically, this folder is used for code that sets
  up autocommands, user commands, keymaps, etc.—complementing
  the core functionality in lua/plugin_name.
- doc: Contains documentation that can be accessed from within
  Neovim using the `:help` command.
- .github: Holds GitHub configuration files such as workflows
  and funding details. (This folder is ignored by Neovim.)

## <a id="get-started"></a>💻 Get started

Follow these steps to use the template:

1. Clone or Create from Template: Either clone this repository,
   or if you're on GitHub, click the "Use this template" button
   at the top-right of the repository page and select "Create
   new repository".
1. Rename Instances: Use the [plugin structure][plugin_structure] as a guide,
   and replace every instance of plugin_name with the name of
   your plugin.
1. Replace the FUNDING.yaml file with your own or delete it,
   as this file is used in this template repository to display
   my "Sponsor" button.
1. (Optional) Customize: Adjust the dotfiles or other
   configuration defaults to better match your desired plugin
   style.
1. Have fun working on your plugin! :)

## <a id="code-formatting-and-linting"></a>🛠️ Code Formatting and Linting

This template enforces consistent coding standards by integrating:

- Stylua for code formatting.
- Luacheck for linting Lua code.

These checks run automatically via GitHub Actions, ensuring that your
code remains clean and error-free.

For an even smoother development experience, consider using a Neovim
autoformatter like [Conform](https://github.com/stevearc/conform.nvim),
which formats your code on every save.

## <a id="markdown-linting"></a>📝 Markdown Linting

To maintain well-formatted documentation, Markdown files are linted
using [Markdownlint][markdownlint]. This ensures that your README and any additional
documentation follow best practices.

> **Note:** If you prefer not to use Markdownlint for your project, simply remove
> the markdown_linting.yaml workflow file.

[plugin_structure]: #plugin-structure
[markdownlint]: https://github.com/DavidAnson/markdownlint
[stylua]: https://github.com/JohnnyMorganz/StyLua
[luacheck]: https://github.com/mpeterv/luacheck
