(load "../Basic-Data-Types/adjacencyList.scm")

;; Sample usage:

;; Create a graph with vertices and edges
(define my-graph (make-graph '(a b c d) '((a . b) (b . c) (c . d) (d . a))))

;; Check if 'a' is a vertex in the graph
(vertex-in-graph? my-graph 'a)
;; Output: #t

;; Check if 'x' is a vertex in the graph
(vertex-in-graph? my-graph 'x)
;; Output: #f

;; Check if the edge '(a . b)' is in the graph
(edge-in-graph? my-graph '(a . b))
;; Output: #t

;; Check if the edge '(b . d)' is in the graph
(edge-in-graph? my-graph '(b . d))
;; Output: #f

;; Check if vertices 'a' and 'b' are adjacent in the graph
(adjacent? my-graph 'a 'b)
;; Output: #t

;; Check if vertices 'c' and 'd' are adjacent in the graph
(adjacent? my-graph 'c 'd)
;; Output: #t

;; Check if vertices 'a' and 'c' are adjacent in the graph
(adjacent? my-graph 'a 'c)
;; Output: #f

;; Get the adjacency list for vertex 'a' in the graph
(get-adjacency-list my-graph 'a)
;; Output: (b)