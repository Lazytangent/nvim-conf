(block_mapping_pair
 key: (flow_node) @_type (#lua-match? @_type "script")
 value: (block_node
         (block_scalar) @injection.content (#set! injection.language "javascript")))

(block_node
  (block_scalar
    (comment) @injection.language (#offset! @injection.language 0 3 0 0))
  @injection.content (#offset! @injection.content 1 0 0 0))
