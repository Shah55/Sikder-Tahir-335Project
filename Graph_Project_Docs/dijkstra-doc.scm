; Not done yet, still updating. 

;; Design Idea:



; The result is 

;; PROOF:

; Base Case: When the queue is empty, the function will return #f,
; which means no path exists from the start vertex to the end vertex.

; Inductive Hypothesis: Assume that for a graph of n vertices, the djikstra
; function will correctly find the shortest possible path from the start vertex
; to any other vertex. 

; Show that the function correctly finds the shortest path between two vertices
; for a graph with n+1 vertices. 

; If the current vertex is in the 'iter' function is "end", the weight of the current
; node is returned, which is the base case. 
; If the current vertex is not the "end" vertex, the 'update-distances-from-node'
; function is utilized to calculate the new distance based on the current vertex
; and its neighbors.
; The dijkstra function explores all possible paths that exist in a given graph 
; and finds the shortest path from the start vertex to the end vertex.
