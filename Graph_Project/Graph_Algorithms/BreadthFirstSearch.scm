(load "..Basic-Data-Types/set.scm")
(load "..Basic-Data-Types/graph.scm")
(load "..Basic-Data-Types/queue.scm")

;; Working on implementing the bfs but the abstraction is making this exceptionally difficult. I hope to
;; get through it though

; Design Idea:

; The recursive BFS algorithm uses a helper function that takes two parameters: visited (the set of visited nodes) and queue (the queue of nodes to be processed).
; The base case is when the queue becomes empty, indicating that all nodes have been visited. In this case, the algorithm returns the set of visited nodes.
; In the recursive case, the algorithm processes the first node in the queue, checks if it has been visited, and updates the visited set accordingly.
; If the node has not been visited, its neighbors are obtained from the graph, and the algorithm enqueues the neighbors that have not been visited yet.
; The algorithm then recursively calls itself with the updated visited set and queue to continue the BFS process.

(define (bfs start-node graph)
  (define (bfs-helper visited queue)
    (cond ((empty? queue) visited)
          (else
           (let ((node (first queue)))
             (if (set-member? visited node)
                 (bfs-helper visited (dequeue queue))
                 (let ((neighbors (get-neighbors node graph))
                       (visited (set-adjoin visited node)))
                   (bfs-helper visited (append (dequeue queue)
                                              (filter (lambda (neighbor)
                                                        (not (set-member? visited neighbor)))
                                                      (map make-vertex neighbors))))))))))

  (bfs-helper (set-adjoin (make-empty-set) start-node) (make-queue start-node)))

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)



