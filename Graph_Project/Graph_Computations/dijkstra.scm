(load "../Graph_Algorithms/Dijkstra's.scm")

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(dijkstra graph 'A 'E) ; 6