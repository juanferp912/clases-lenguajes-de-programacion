max(X,Y,X):-
    X >= Y.

max(X,Y,Y):-
    Y >= X.

reinado('Carlos II',1665,1700).
reinado('Felipe V',1700,1724).
reinado('Luis I',1724,1724).
reinado('Felipe V',1724,1746).

rige(Persona,N):-
    reinado(Persona,A,B),
    A =< N,
    N =< B.

rigeEntre(Persona,N,M):-
    reinado(Persona,A,B),
    N =< A,
    B =< M.


tiempo(presente).
tiempo(pasado).
tiempo(futuro).

persona(primera).
persona(segunda).
persona(tercera).

numero(singular).
numero(plural).

ser(presente,primera,singular,"am").
ser(presente,segunda,singular,"are").
ser(presente,tercera,singular,"is").
ser(presente,primera,plural,"are").
ser(presente,segunda,plural,"are").
ser(presente,tercera,plural,"are").

ser(pasado,primera,singular,"was").
ser(pasado,segunda,singular,"were").
ser(pasado,tercera,singular,"was").
ser(pasado,primera,plural,"were").
ser(pasado,segunda,plural,"were").
ser(pasado,tercera,plural,"were").

ser(futuro,primera,singular,"will be").
ser(futuro,segunda,singular,"will be").
ser(futuro,tercera,singular,"will be").
ser(futuro,primera,plural,"will be").
ser(futuro,segunda,plural,"will be").
ser(futuro,tercera,plural,"will be").

conjugar_verbo(Verbo,Tiempo,Persona,Numero,Conjugacion):-
    tiempo(Tiempo),
    persona(Persona),
    numero(Numero),
    (
        Verbo = "to be" ->
    ser(Tiempo,Persona,Numero,R),
    Conjugacion = R     ;
        Conjugacion = Verbo.
    ).