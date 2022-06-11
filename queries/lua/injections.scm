; (assignment_statement
;   (variable_list
;     (identifier) @language)
;   (expression_list
;     (table_constructor
;       (field
; 	(function_call
; 	  (arguments
; 	    (function_call
; 	      (identifier) @_name (#lua-match? @_name "^fmta?$")
; 	      (arguments
; 		((string) @content (#offset! @content 1 0 0 0))))))))))
