vim.api.nvim_create_user_command("GenUuid", [[r !python -c 'import uuid; print(uuid.uuid4(), end="")']], {})
