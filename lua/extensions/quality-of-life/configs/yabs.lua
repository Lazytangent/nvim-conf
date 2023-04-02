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
    rust = {
      tasks = {
        rustfmt = {
          command = "rustfmt %",
          output = "quickfix",
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
