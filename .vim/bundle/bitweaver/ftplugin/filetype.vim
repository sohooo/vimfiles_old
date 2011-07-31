if exists("did\_load\_filetypes")

  finish

endif

augroup bitweaver

  au! BufRead,BufNewFile *.bitw      setfiletype bitw
  au! BufRead,BufNewFile *.bitweaver setfiletype bitw

augroup END
