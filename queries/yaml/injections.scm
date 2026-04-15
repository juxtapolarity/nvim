; Jinja expression blocks: {{ ... }}
((block_scalar) @injection.content
 (#lua-match? @injection.content "{{")
 (#set! injection.language "jinja_inline"))

((flow_node) @injection.content
 (#lua-match? @injection.content "{{")
 (#set! injection.language "jinja_inline"))

((plain_scalar) @injection.content
 (#lua-match? @injection.content "{{")
 (#set! injection.language "jinja_inline"))

((double_quote_scalar) @injection.content
 (#lua-match? @injection.content "{{")
 (#set! injection.language "jinja_inline"))

((single_quote_scalar) @injection.content
 (#lua-match? @injection.content "{{")
 (#set! injection.language "jinja_inline"))

; Jinja statement blocks: {% ... %}
((block_scalar) @injection.content
 (#lua-match? @injection.content "{%%")
 (#set! injection.language "jinja_inline"))

((flow_node) @injection.content
 (#lua-match? @injection.content "{%%")
 (#set! injection.language "jinja_inline"))

((plain_scalar) @injection.content
 (#lua-match? @injection.content "{%%")
 (#set! injection.language "jinja_inline"))

((double_quote_scalar) @injection.content
 (#lua-match? @injection.content "{%%")
 (#set! injection.language "jinja_inline"))

((single_quote_scalar) @injection.content
 (#lua-match? @injection.content "{%%")
 (#set! injection.language "jinja_inline"))

