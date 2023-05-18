; Base Case: When the queue is empty, the algorithm correctly returns the set of visited nodes. 

; Inductive Hypothesis:

; Let P(n) be the statement that the recursive BFS algorithm correctly visits all nodes in a graph starting from any node n 
; and returns the set of visited nodes when the queue becomes empty.
; Assume P(n) holds for all nodes that can be reached from n in k or fewer steps, where k is a positive integer.


; Inductive Step:

; We want to show that P(n) holds for any node n in the graph, meaning the algorithm correctly visits all nodes 
; starting from n and returns the set of visited nodes when the queue becomes empty.

; In the recursive case of the algorithm, the first node node is dequeued from the queue, and if it has not been visited, 
; its neighbors are enqueued. Since all neighbors are reached from node in one step, they can be reached from n in k or 
; fewer steps. By the inductive hypothesis, the algorithm correctly visits all nodes starting from node and returns the set 
; of visited nodes when the queue becomes empty.
