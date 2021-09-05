function ExecuteFile()
  let filetype_to_command = {
        \ 'javascript': 'node',
        \ 'python': 'python',
        \ 'ruby': 'ruby',
        \ 'sh': 'sh',
        \ 'html': 'open',
	\ 'java': 'java',
        \ }
  let cmd = get(filetype_to_command, &filetype, &filetype)
  call RunShellCommand(cmd . "%s")
endfunction

function RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor

  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap nospell
  call setline(1, 'You entered:   ' . a:cmdline)
  call setline(2, 'Expanded form: ' . expanded_cmdline)
  call setline(3, substitute(getline(2),'.','=','g'))
  execute '$read !' . expanded_cmdline
  setlocal nomodifiable
  1
endfunction
