vim.api.nvim_create_user_command("GenSecret", "r !python -c 'import secrets; print(secrets.token_hex())'", {})
