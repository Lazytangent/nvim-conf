(block_mapping_pair
  key: (flow_node) @_run (#any-of? @_run "script")
  value: (flow_node
           (plain_scalar) @javascript))

(block_mapping_pair
  key: (flow_node) @_run (#any-of? @_run "script")
  value: (block_node
           (block_scalar) @javascript (#offset! @javascript 0 0 0 0)))

(block_mapping_pair
  key: (flow_node) @_run (#any-of? @_run "script")
  value: (block_node
           (block_sequence
             (block_sequence_item
               (flow_node) @javascript))))

(block_mapping_pair
  key: (flow_node) @_run (#any-of? @_run "script")
  value: (block_node
           (block_sequence
             (block_sequence_item
               (block_node
                  (block_scalar) @javascript)))))
