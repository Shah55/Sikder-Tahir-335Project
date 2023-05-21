(load "../Graph_Algorithms/Dijkstra's.scm")

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(dijkstra graph 'A 'E)


; Testing this function gives an error which we didn't have time to fix, but it was supposed to return the shortest path
; between the two given vertices. 
