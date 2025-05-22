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
on your skills.

I hope you enjoy it and happy coding!

## 📖 Table of Contents

- [Features](#features)
- [Plugin Structure Overview][plugin_structure]
- [Get started](#get-started)
- [Code Formatting and Linting](#code-formatting-and-linting)
- [Markdown Linting](#markdown-linting)

## <a id="features"></a>🚀 Features

- **Automated setup:** A Lua script that renames directories,
  files, and updates the README with your plugin’s name and
  repository link
- **Continuous Integration:** Utilizes GitHub Actions to ensure
  consistent code quality by checking:

  - Code formatting with [Stylua][stylua]
  - Lua linting with [Luacheck][luacheck]
  - Markdown linting with [Markdownlint][markdownlint]

- **Standard Directory Structure:** Comes with a well-organized
  base directory and file structure designed for Neovim plugin
  development.

- **Prebuilt README Template:** Includes a structured README with
  essential sections, so you can focus on content instead of
  setting up headers, a table of contents, and formatting.

## <a id="plugin-structure"></a> 📂 Plugin Structure Overview

```bash
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
├── script.lua
├── README_TEMPLATE.md
└── README.md
```

- **lua/plugin_name:** This directory is automatically loaded
  by Neovim and is intended to hold your plugin’s core logic.

- **plugin:** Lua files in this directory are also auto-loaded by
  Neovim. Typically, this folder is used for code that sets
  up autocommands, user commands, keymaps, etc.—complementing
  the core functionality in lua/plugin_name.

- **doc:** Contains documentation that can be accessed from within
  Neovim using the `:help` command.

- **.github:** Holds GitHub configuration files such as workflows
  and funding details. (This folder is ignored by Neovim.)

## <a id="get-started"></a>💻 Get started

To use this template, you can either:

- **Clone this repository** manually, or
- **Use the "Use this template" button** on GitHub (top-right
  of the repository page) to create a new repository.

Once you’re ready to customize the template, choose one of the
following setup methods:

### ⚡ Option 1: Automated Setup (Recommended)

> [!TIP]
> You can reuse the script as often as you like to customize your plugin's
> base structure.
>
> It works as long as there's a `README.md` or `README_TEMPLATE.md` file —
> the script will treat the **first line** of that file as the name of your plugin.

1. Open `script.lua` in Neovim and run `:luafile %`,
   or execute the script using the Lua interpreter.
2. Enter your plugin’s name when prompted.
3. Enter your plugin’s repository URL.

### 🚀 Option 2: Manual Setup

1. **Rename Instances:** Follow the
   [plugin structure][plugin_structure] and replace every
   instance of `plugin_name` with your plugin’s name.
2. **Update FUNDING.yaml:** Replace this file with your own or
   delete it (this template uses it for the "Sponsor" button).
3. **(Optional) Customize:** Adjust dotfiles and configuration
   settings to match your plugin's style.

That’s it! Your template is now set up and ready to go. 🎉 Have fun
working on your plugin! :)

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
