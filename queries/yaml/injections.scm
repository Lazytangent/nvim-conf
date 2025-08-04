; extends

(block_node
  (block_scalar
    (comment) @injection.language (#offset! @injection.language 0 2 0 0))
  @injection.content (#offset! @injection.content 0 1 0 0))

; github actions
([
  (string_scalar)
  (block_scalar)
  (double_quote_scalar)
  (single_quote_scalar)
] @injection.content
 (#lua-match? @injection.content "[$]{{.*}}")
 (#set! injection.language "ghactions"))
