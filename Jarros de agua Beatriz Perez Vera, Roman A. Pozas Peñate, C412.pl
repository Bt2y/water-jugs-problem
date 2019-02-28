/********************************************
 *                                          *
 * Proyeto:                                 *
 *  Los jarros de agua                      *
 *                                          *
 *                                          *
 * Autores:                                 *
 *  Beatriz Pérez Vera                      *
 *  Roman A. Pozas Peñate                   *
 *                                          *
 * Grupo:				    *
 *  C-412                                   *
 *                                          *
 * Correos:                                 *
 *  b.vera@estudiantes.matcom.uh.cu         *
 *  r.pozas@estudiantes.matcom.uh.cu        *
 *                                          *
 ********************************************
 */


objetivo([_,2]). %estado final

estado(vaciar_J4, [J3,_], [J3,0]).
estado(vaciar_J3, [_,J4], [0,J4]).

estado(llenar_J4, [J3,_], [J3,4]).
estado(llenar_J3, [_,J4], [3,J4]).

estado(hechar_J4_en_J3, [J3,J4], [NJ3,0]):-
       Sobrante is 3-J3,
       Sobrante >= J4,
       NJ3 is J3+J4.

estado(hechar_J4_en_J3, [J3,J4], [3,NJ4]):-
	Sobrante is 3-J3,
	Sobrante < J4,
	NJ4 is J4-Sobrante.

estado(hechar_J3_en_J4, [J3,J4], [0,NJ4]):-
	Sobrante is 4-J4,
	Sobrante >= J3,
	NJ4 is J3+J4.

estado(hechar_J3_en_J4, [J3,J4], [NJ3,4]):-
	Sobrante is 4-J4,
	Sobrante < J3,
	NJ3 is J3-Sobrante.


solucion(Estado, [], Pasos):- Pasos >= 0, objetivo(Estado).
solucion(Estado, [X|Y], Pasos):-
	Pasos > 0,
	estado(X,Estado,NEstado),
	NPasos is Pasos-1,
	solucion(NEstado,Y,NPasos).

jarras(Solucion,CantidadPasos):-solucion([0,0],Solucion,CantidadPasos).
