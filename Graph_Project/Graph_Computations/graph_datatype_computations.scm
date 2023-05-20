(load "../Basic-Data-Types/graph.scm")

(define graph (make-graph '(a b c d) '((a b) (b c) (c d) (a c))))
(display graph)
(newline)
; '((a b c d) ((a b) (b c) (c d) (a c)))

(graph-vertices graph)
; (a b c d)

(graph-edges graph)
; (((a b) (b c) (c d) (a c)))

(vertex-in-graph? graph 'a)
;=> #t

(vertex-in-graph? graph 'e)
;=> #f

(add-vertex graph 'e)
;=> '((a b c d e) ((a b) (b c) (c d) (a c)))

(add-edge graph '(d e))
;=> '((a b c d e) ((a b) (b c) (c d) (a c) (d e)))

; This one is outputting wrong, need to fix this
(edge-in-graph? graph '(a b))
;=> #t

(edge-in-graph? graph '(a d))
;=> #f

