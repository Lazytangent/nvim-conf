require('yabs'):setup({
  languages = {
    python = {
      tasks = {
        run_file = {
          command = "python %",
          output = "quickfix"
        },
        run_fastapi = {
          command = "uvicorn main:app --reload",
          output = "terminal",
        },
        run_flask = {
          command = "flask run",
          output = "terminal",
        },
      },
    },
  },
  tasks = {
    pre_commit = {
      command = "pre-commit run --files %",
      output = "quickfix",
    },
  },
})
