; Pre: 
; list of vertices (a b c d) 
; list of edges '((a b) (b c) (c d) (a c)) 
; The vertices in the edge list must already exist in the vertex list.

; Post: 
; The variable graph is assigned the created graph.
; (define graph (make-graph '(a b c d) '((a b) (b c) (c d) (a c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; Post: Returns a list of all vertices present in the graph.
(graph-vertices graph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; Post: Returns a list of all edges present in the graph.
(graph-edges graph)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; The vertex 'a' must be provided.

; Post: Returns #t if the vertex is present in the graph, #f otherwise.
(vertex-in-graph? graph 'a)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; The vertex 'e' must be provided.
; The vertex 'e' must not already exist in the graph.

; Post: Returns an updated graph with the vertex 'e' added.
(add-vertex graph 'e)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; The edge '(d e) must be provided.
; Both vertices 'd' and 'e' must already exist in the graph.

; Post: Returns an updated graph with the edge '(d e) added.
(add-edge graph '(d e))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The graph must be a valid graph.
; The edge '(a b) must be provided.

; Post: Returns #t if the edge is present in the graph, #f otherwise.
(edge-in-graph? graph '(a b))



