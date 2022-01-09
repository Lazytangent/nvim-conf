vim.api.nvim_add_user_command("GenSecret", "r !python -c 'import secrets; print(secrets.token_hex())'", {})
