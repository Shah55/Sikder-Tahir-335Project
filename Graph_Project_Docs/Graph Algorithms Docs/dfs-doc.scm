;; Design Idea:

; The dfs function initializes an empty set called visited to keep track of the vertices that have been visited during the traversal. 
; It also creates an empty list called result to store the visited vertices in the order they are encountered.

; The DFS algorithm is implemented within the nested function dfs-visit. This function takes a vertex, the visited set, and the result list as parameters.

; dfs-visit:

; Marks the current vertex as visited by adding it to the visited set.
; Appends the current vertex to the result list, indicating that it has been visited.
; Retrieves the neighbors of the current vertex using the get-neighbors function.
; Iterates through each neighbor and recursively calls dfs-visit on unvisited neighbors, passing the updated visited and result values.
; This ensures that the algorithm explores all reachable vertices in a depth-first manner, following each path as far as possible before backtracking.
; The recursive calls continue until all reachable vertices from the current vertex have been visited.
; The dfs-visit function returns the updated result list.
; After defining dfs-visit, the dfs function invokes it with the starting vertex, the initial visited set, and the empty result list. 
; It then reverses the result list to obtain the vertices in the correct traversal order.

; The result is a list of visited vertices representing the DFS traversal order of the graph starting from the given vertex.

;; PROOF:

; Base Case: When the graph has only one vertex, the dfs function should return a list containing only that vertex. 

; Inductive Hypothesis: Assume that the dfs function correctly performs a depth-first search for any graph with k vertices, 
; where k <= n, and returns the expected list of visited vertices.

; Show that the dfs function correctly performs a depth-first search for a graph with n+1 vertices.

; The dfs-visit function is called for the starting vertex, marking it as visited and adding it to the result.
; The function recursively calls dfs-visit for each unvisited neighbor of the current vertex, accumulating the result.
; The final result is obtained by reversing the accumulated list.
; By the inductive hypothesis, we can conclude that the dfs function correctly performs a depth-first search for graphs 
; with k vertices, where k <= n. In the inductive step, we showed that the function correctly handles the case when the graph 
; has n+1 vertices based on the behavior of the dfs-visit function.