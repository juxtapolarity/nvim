; extends

; Inject YAML into the raw text (words) nodes between Jinja tags.
; injection.combined merges all words nodes into one YAML parse so the
; YAML structure is understood across multiple Jinja blocks.
((words) @injection.content
  (#set! injection.language "yaml")
  (#set! injection.combined))
