(load "../Graph_Algorithms/BreadthFirstSearch.scm")

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)