; extends

((minted_environment
   (begin
     (curly_group_text)
     (curly_group_text
       (text
	 (word) @lang (#eq? @lang "fnl"))))
   (source_code) @injection.content
   (#set! injection.language "fennel")))
