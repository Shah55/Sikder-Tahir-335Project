;; Design Idea:

; The function uses a recursive approach by defining a helper function that takes in three parameters (queu, visited, and distances). 
; The algorithm will select the node with the shortest distance from the queue by sorting the queue based on the weights of the nodes. 
; The selected node is checked to see if it is the destination node. If it is, the function returns the weight associated with the node,  
; representing the shortest path from the start node to the destination. If the selected node has already been visited, the function calls 
; itself again recursively. If the selected node has not been visied, the neighbors are then processed using the assoc function, which retrieves 
; the list of edges connected to the current node. For each neighbor, the function calculates the new distance by adding the current node's 
; distance and the weight of the connecting edge. If the neighbor has not been assigned a distance yet or if the new distance is shorter than 
; the existing one, a new node is created with the neighbor's vertex and the new distance. Otherwise, a node is created with the neighbor's 
; vertex and its existing distance. 


;; PROOF:

; Base Case: When the queue is empty, the function will return #f, which means no path exists from the start vertex to the end vertex.

; Inductive Hypothesis: Assume that for a graph of n vertices, the djikstra function will correctly find the shortest possible path 
; from the start vertex to any other vertex. 

; Show that the function correctly finds the shortest path between two vertices for a graph with n+1 vertices. 

; If the current vertex is in the 'iter' function is "end", the weight of the current node is returned, which is the base case. 
; If the current vertex is not the "end" vertex, the 'update-distances-from-node' function is utilized to calculate the new distance
; based on the current vertex and its neighbors. The dijkstra function explores all possible paths that exist in a given graph 
; and finds the shortest path from the start vertex to the end vertex.
