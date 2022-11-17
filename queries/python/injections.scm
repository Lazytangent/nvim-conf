(expression_statement
  (assignment
    ((string) @graphql (#offset! @graphql 0 3 0 0))
    (#lua-match? @graphql "mutation")))

(expression_statement
  (assignment
    ((identifier) @_name)
    (#lua-match? @_name "^query$")
    ((string) @graphql (#offset! @graphql 0 3 0 0))))
