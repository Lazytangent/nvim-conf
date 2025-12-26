return {
  'Ramilito/kubectl.nvim',
  dependencies = {
    'Ramilito/kubediff',
  },
  build = 'make build',
  opts = true,
  -- disable on linux
  enabled = false,
}
