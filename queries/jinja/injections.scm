; extends

; Inject YAML into each raw text (words) node between Jinja tags.
; Each words node is parsed as an independent YAML snippet so that
; section boundaries (introduced by {# … #} comment separators) don't
; cause cross-node YAML parse errors.
((words) @injection.content
  (#set! injection.language "yaml"))
