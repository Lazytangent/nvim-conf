; extends

(((comment) @injection.language (#offset! @injection.language 0 3 0 -3))
 ((expression_list
    (raw_string_literal) @injection.content)))

(((comment) @injection.language (#offset! @injection.language 0 3 0 -3))
 ((raw_string_literal) @injection.content (#offset! @injection.content 0 1 0 -1)))

(((comment) @injection.language (#offset! @injection.language 0 3 0 -3))
 (expression_list (interpreted_string_literal) @injection.content (#offset! @injection.content 0 1 0 -1)))
