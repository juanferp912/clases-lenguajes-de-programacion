personaje('Elare',5,100).
personaje('Kael',3,80).
personaje('Rin',7,120).
% personajes nuevos
personaje('Enzo', 5, 130).
personaje('Trunks', 4, 120).
personaje('Ceboson', 2, 90).

mision(m1,'Bosque de Sombras',2,50).
mision(m2,'Cueva del Dragon',5,120).
mision(m3,'Torre Arcana',7,200).

inventario('Elara',[espada,escudo,pocion]).
inventario('Kael',[arco,flechas]).
inventario('Rin',[varita,grimorio,pocion,amuleto]).
inventario('Enzo',[martillo, bola]).
inventario('Trunks', [espada, lanza]).
inventario('Ceboson', [piter, pocion]).

requiere(m2,escudo).
requiere(m2,pocion).
requiere(m3,escudo).
requiere(m3,pocion).

puede_aceptar(Personaje,ID_Mision):-
    personaje(Personaje,Nivel,_),
    mision(ID_Mision,_,Dificultad,_),
    Nivel>=Dificultad.

xp_acumulada(0,0).
xp_acumulada(N,Total):-
    N > 0,
    N1 is N - 1,
    xp_acumulada(N1,Prev),
    Total is Prev + (30 * N).

tiene_requerido(Personaje, Objeto):-
    inventario(Personaje,Lista),
    member(Objeto,Lista).

mismo_nivel(P1,P2):-
    personaje(P1,N,_),
    personaje(P2,N,_),
    P1 \== P2.

es_balanceado(Personaje):-
    personaje(Personaje,_,Vida),
    Vida =:= 100.

%--------------------------------------------------------

fusionar_equipo(P1,P2,EquipoFusionado):-
    inventario(P1,L1),
    inventario(P2,L2),
    append(L1,L2,EquipoFusionado).

tiempo(presente). tiempo(pasado). tiempo(futuro).

persona(primera). persona(segunda). persona(tercera).

numero(singular). numero(plural).

ser(presente,tercera,singular,"es").
ser(pasado,tercera,singular,"fue").
ser(futuro,tercera,singular,"será").
ser(presente,primera,singular,"soy").
ser(presente,primera,plural,"somos").
ser(presente,tercera,plural,"son").

conjugar_accion(Verbo,Tiempo,Persona,Numero,Conjugacion):-
    tiempo(Tiempo),persona(Persona),numero(Numero),
    (Verbo = "ser" ->
        ser(Tiempo,Persona,Numero,R),
        Conjugacion=R
    ;Conjugacion = Verbo ).
    
generar_reporte(Personaje,MisionID,Mensaje):-
    puede_aceptar(Personaje,MisionID),
    mision(MisionID,Nombre,_,XP),
    conjugar_accion("ser",presente,tercera,singular,FormaVerbal),
    atomic_list_concat([Personaje, ' ', FormaVerbal, " capaz de completar ", Nombre, " por ", XP, " XP"], Mensaje).

reporteGrupal(ListaPersonajes,MisionID):-
    mision(MisionID,NombreMision,_,XP),
    forall(member(P,ListaPersonajes), puede_aceptar(P,MisionID)),
    atomic_list_concat(ListaPersonajes, ', ', NombresTexto),
    conjugar_accion("ser",presente,tercera,plural,FormaVerbal),
    atomic_list_concat([NombresTexto, " ", FormaVerbal, " capaces de completar ", NombreMision, " por ", XP, " XP"], Mensaje),
    write(Mensaje).

% 2 nuevas reglas

puede_completar_mision(PersonajeID, ID_Mision):-
    puede_aceptar(PersonajeID, ID_Mision),
    forall(requiere(ID_Mision, Objeto),tiene_requerido(PersonajeID, Objeto)).

es_veterano(Personaje):-
    personaje(Personaje, Nivel, _),
    Nivel > 5.

% enemigos

enemigo('Santinok', 200).
enemigo('Duende', 50).
enemigo('Mingol', 130).


% fuerza ataque de las armas

fuerza_arma(espada,25).
fuerza_arma(martillo, 40).
fuerza_arma(piter, 90).
fuerza_arma(lanza, 30).
fuerza_arma(puno, 10).
fuerza_arma(pocion, 20).
fuerza_arma(bola, 30).
fuerza_arma(varita,15).


% ejecucion de ataque

atacar(Atacante, Enemigo):-
    inventario(Atacante, [Arma|_]),
    fuerza_arma(Arma, Dano),
    enemigo(Enemigo, VidaEnemigo),
    (Dano >= VidaEnemigo ->
        (write('Murio'), nl, true)
    ;   (write('No murio'), nl, true)
    ).

% atacar grupo de enemigos

atacar_grupo(Atacante, ListaEnemigos):-
    forall(member(Enemigo, ListaEnemigos), 
           (format('~w ataca a ~w: ', [Atacante, Enemigo]), atacar(Atacante, Enemigo))).
