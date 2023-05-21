; Pre: The vertices parameter must be a list representing the vertices of the graph.

; Post: The edges parameter must be a list of pairs 
; representing the edges of the graph, where each pair consists of two vertices.
; (define my-graph (make-graph '(a b c d) '((a . b) (b . c) (c . d) (d . a))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph parameter must be a valid graph.
; The vertex parameter must be a vertex in the graph.

; Post: Returns #t if the vertex is present in the graph, #f otherwise.
; (vertex-in-graph? my-graph 'a)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph parameter must be a valid.
; The edge parameter must be a pair representing an edge in the graph.

; Post: Returns #t if the edge is present in the graph, #f otherwise.
; (edge-in-graph? my-graph '(a . b))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph parameter must be a valid graph.
; The vertex1 and vertex2 parameters must be vertices in the graph.

; Post: Returns #t if vertex1 and vertex2 are adjacent in the graph, #f otherwise.
; (adjacent? my-graph 'a 'b)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph parameter must be a valid graph data structure.
; The vertex parameter must be a vertex in the graph.

; Post: Returns a list representing the adjacency list for the vertex in the graph.
; (get-adjacency-list my-graph 'a)

