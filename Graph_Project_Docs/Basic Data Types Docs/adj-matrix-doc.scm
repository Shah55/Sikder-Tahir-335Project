; Pre: The n parameter must be a positive integer representing the number of nodes in the graph.
; Post: Returns an empty adjacency matrix of size n x n filled with zeros.
; (define adjacency-matrix (make-adjacency-matrix 4))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The adjacency-matrix parameter must be a valid adjacency matrix representing a graph.
; The node1 and node2 parameters must be valid nodes in the adjacency matrix.

; Post: Returns an updated adjacency matrix with an added edge between node1 and node2.
; (define adjacency-matrix (add-edge adjacency-matrix 1 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pre: The adjacency-matrix parameter must be a valid adjacency matrix representing a graph.
; The node1 and node2 parameters must be valid nodes in the adjacency matrix.

; Post: Returns an updated adjacency matrix with the edge between node1 and node2 removed.
; (define adjacency-matrix (remove-edge adjacency-matrix 1 2))
