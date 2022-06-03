(expression_statement
  (assignment
    ((string) @graphql (#offset! @graphql 0 3 0 0))
    (#lua-match? @graphql "mutation")))

(expression_statement
  (assignment
    ((identifier) @name)
    (#lua-match? @name "^query$")
    ((string) @graphql (#offset! @graphql 0 3 0 0))))
