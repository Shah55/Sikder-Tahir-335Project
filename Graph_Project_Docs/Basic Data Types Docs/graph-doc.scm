; Pre: 
; list of vertices (a b c d) 
; list of edges '((a b) (b c) (c d) (a c)) 
; The vertices in the edge list must already exist in the vertex list.

; Post: 
; The variable graph is assigned the created graph.
; (define graph (make-graph '(a b c d) '((a b) (b c) (c d) (a c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; Post: 
(graph-vertices graph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(graph-edges graph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(vertex-in-graph? graph 'a)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(vertex-in-graph? graph 'e)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(add-vertex graph 'e)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(add-edge graph '(d e))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(edge-in-graph? graph '(a b))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre:
; Post:
(edge-in-graph? graph '(a d))
