(define (domain transporte)
    (:predicates (aeropuerto ?r)  (en ?c ?r)  (avion ?a)  (carga ?c)  (dentro ?c ?a))
    (:action cargar
        :parameters (?a ?c ?r)
        :precondition (and (en ?c ?r) (en ?a ?r) (carga ?c) (avion ?a) (aeropuerto ?r))
        :effect (and (not (en ?c ?r)) (dentro ?c ?a))
    )
     (:action descargar
        :parameters (?a ?c ?r)
        :precondition (and (dentro ?c ?a) (en ?a ?r) (carga ?c) (avion ?a) (aeropuerto ?r))
        :effect (and (en ?c ?r) (not (dentro ?c ?a)))
    )
     (:action volar
        :parameters (?a ?origen ?destino)
        :precondition (and (en ?a ?origen) (avion ?a) (aeropuerto ?origen) (aeropuerto ?destino))
        :effect (and (not (en ?a ?origen)) (en ?a ?destino))
    )
)