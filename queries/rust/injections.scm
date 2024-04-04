;; extends

(macro_invocation
  ((identifier) @_name (#eq? @_name "html"))
  ((token_tree) @html (#offset! @html 0 1 0 -1)))

(((block_comment) @injection.language (#offset! @injection.language 0 3 0 -3))
 ((raw_string_literal) @injection.content))
