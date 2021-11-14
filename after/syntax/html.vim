" syntax region djangotagmarkers start="{{" end="}}"
" syntax region djangovariablemarkers start="{%" end="%}"
" command! -nargs=+ HiLink hi def link <args>
" HiLink djangotagmarkers PreProc
" HiLink djangovariablemarkers PreProc
" delcommand HiLink
