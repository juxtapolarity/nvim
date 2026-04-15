; extends

; Inject YAML into raw content between jinja tags
((content) @injection.content
 (#set! injection.language "yaml")
 (#set! injection.combined))
