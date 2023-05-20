;; Working on implementing the bfs but the abstraction is making this exceptionally difficult. I hope to
;; get through it though

; Design Idea:

; The recursive BFS algorithm uses a helper function that takes two parameters: visited (the set of visited nodes) and queue (the queue of nodes to be processed).
; The base case is when the queue becomes empty, indicating that all nodes have been visited. In this case, the algorithm returns the set of visited nodes.
; In the recursive case, the algorithm processes the first node in the queue, checks if it has been visited, and updates the visited set accordingly.
; If the node has not been visited, its neighbors are obtained from the graph, and the algorithm enqueues the neighbors that have not been visited yet.
; The algorithm then recursively calls itself with the updated visited set and queue to continue the BFS process.

;; PROOF:

; Base Case: When the queue is empty, the algorithm correctly returns the set of visited nodes. 

; Inductive Hypothesis:

; Lets say that the recursive BFS algorithm correctly visits all nodes in a graph starting from any node n 
; and returns the set of visited nodes when the queue becomes empty.
; Assume it holds for all nodes that can be reached from n in k or fewer steps, where k is a positive integer.


; Inductive Step:

; We want to show that the IH holds for any node n in the graph, meaning the algorithm correctly visits all nodes 
; starting from n and returns the set of visited nodes when the queue becomes empty.

; In the recursive case of the algorithm, the first node node is dequeued from the queue, and if it has not been visited, 
; its neighbors are enqueued. Since all neighbors are reached from node in one step, they can be reached from n in k or 
; fewer steps. By the inductive hypothesis, the algorithm correctly visits all nodes starting from node and returns the set 
; of visited nodes when the queue becomes empty.
