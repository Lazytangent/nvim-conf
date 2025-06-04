; extends

((minted_environment
   (begin
     (curly_group_text)
     (curly_group_text
       (text
	 (word) @lang (#eq? @lang "fnl"))))
   (source_code) @injection.content
   (#set! injection.language "fennel")))

((minted_environment
   (begin
     (curly_group_text)
     (curly_group_text
       (text
	 (word) @lang (#eq? @lang "cl"))))
   (source_code) @injection.content
   (#set! injection.language "commonlisp")))

((minted_environment
   (begin
     (curly_group_text)
     (curly_group_text
       (text
	 (word) @lang (#eq? @lang "clj"))))
   (source_code) @injection.content
   (#set! injection.language "clojure")))

; mintinline

(generic_command
  command: (command_name) @command (#eq? @command "\\mintinline")
  arg: (curly_group
	 (text
	   word: (word) @lang (#eq? @lang "fnl")))
  arg: (curly_group) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "fennel"))
