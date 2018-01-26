/*****************************************************************************

//Pablo Rubio Machacón 70922996N
//Victor Ramos Sánchez 71095070T

		Copyright (c) My Company

 Project:  FINAL
 FileName: FINAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "final.inc"

domains
objeto=symbol
unidades=integer
estante=symbol
posicion=symbol
listaRecorrido=posicion*
distancia=integer
lineapedido=linea(objeto,unidades)
pedido=lineapedido*

predicates

estanteria(estante,posicion)
conectado(posicion,posicion,distancia)
ubicacion(objeto,estante,unidades)
recorrido(posicion,posicion,listaRecorrido,listaRecorrido,distancia)
añade(posicion,listaRecorrido,listaRecorrido)
escribe(listaRecorrido)
pedido(pedido)
tratarPedido(lineapedido,pedido,listaRecorrido,posicion,distancia)
invierte(listaRecorrido,listaRecorrido)
concatenar(listaRecorrido,listaRecorrido,listaRecorrido)
distinto(posicion,posicion)

clauses

/* Estanterias */
estanteria(s1,ps1).estanteria(s2,ps2).estanteria(s3,ps3).estanteria(s4,ps4).estanteria(s5,ps5).estanteria(s6,ps6).estanteria(s7,ps7).estanteria(s8,ps8).

/* Contenido del almacen */
ubicacion(patatas,s1,200).
ubicacion(melones,s1,100).
ubicacion(boligrafos,s2,500).
ubicacion(boligrafos,s3,400).
ubicacion(melocotones,s4,200).
ubicacion(berzas,s4,100).
ubicacion(papeles,s5,500).
ubicacion(boligrafos,s6,400).
ubicacion(patatas,s1,200).
ubicacion(melones,s1,100).
ubicacion(plumas,s7,500).
ubicacion(plumas,s8,400).
ubicacion(colonias,s3,150).
ubicacion(ratones,s4,210).

/* Distancia entre las posiciones del almacen */
conectado(ps,pc1,5).conectado(ps7,pc3,5).
conectado(pc1,pc2,5).conectado(ps1,pc1,5).
conectado(pc2,pc3,5).conectado(ps5,pc1,5).
conectado(pc3,pc4,5).conectado(ps2,pc2,5).
conectado(pc4,pt,5).conectado(ps6,pc2,5).
conectado(ps3,pc3,5).conectado(ps4,pc4,5).
conectado(ps8,pc4,5).

concatenar([],L,L). 

concatenar([X|L1],L2,[X|L3]):-
	 concatenar(L1,L2,L3). 

invierte([],[]). 

invierte([H|T],L):- 
	invierte(T,R), 
	concatenar(R,[H],L). 
	
añade(X,Lista,[X|Lista]).

  escribe([]).
        
  escribe([H|T]):-
        write(H,'\n'),
       	escribe(T).

distinto(X,Y):-
	X<>Y.


pedido([Cabeza|Cola]):-
	añade(ps,ListaRecorrido,NuevaLista),
	conectado(ps,Pos_sig,5),
	añade(Pos_sig,NuevaLista,NuevaLista2),
	tratarPedido(Cabeza,Cola,NuevaLista2,Pos_sig,5). 

tratarPedido(linea(Objeto,Unidades),[],ListaRecorrido,Pos_ini,Distancia):-
	ubicacion(Objeto,Estanteria,Unid),
	estanteria(Estanteria,Posicion),
	recorrido(Pos_ini,Posicion,ListaRecorrido,NuevaLista,Distancia),
	recorrido(Posicion,pt,NuevaLista,NuevaLista2,Distancia),
	invierte(NuevaLista2,ListaInvertida),
	escribe(ListaInvertida).
	
	
tratarPedido(linea(Objeto,Unidades),[Cabeza|Cola],ListaRecorrido,Pos_ini,Distancia):-
	ubicacion(Objeto,Estanteria,Unid),
	estanteria(Estanteria,Posicion),
	recorrido(Pos_ini,Posicion,ListaRecorrido,NuevaLista,Distancia),
	tratarPedido(Cabeza,Cola,NuevaLista,Posicion,Distancia).

recorrido(Pos,Pos,ListaRecorrido,NuevaLista,Distancia):-
	invierte(NuevaLista,ListaInvertida),
	escribe(ListaInvertida).
	
recorrido(pc1,ps1,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps1,pc1,Dist),
	añade(ps1,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps1,ps1,NuevaLista,NuevaLista,Dist2).

recorrido(pc1,ps5,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps5,pc1,Dist),
	añade(ps5,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps5,ps5,NuevaLista,NuevaLista,Dist2).

recorrido(pc1,Pos,ListaRecorrido,Lista_aux,Distancia):-
	distinto(ps1,Pos),
	distinto(ps5,Pos),
	conectado(pc1,pc2,Dist),
	añade(pc2,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(pc2,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(pc2,ps2,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps2,pc2,Dist),
	añade(ps2,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps2,ps2,NuevaLista,NuevaLista,Dist2).

recorrido(pc2,ps6,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps6,pc2,Dist),
	añade(ps6,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps6,ps6,NuevaLista,NuevaLista,Dist2).

recorrido(pc2,Pos,ListaRecorrido,Lista_aux,Distancia):-
	distinto(ps2,Pos),
	distinto(ps6,Pos),
	conectado(pc2,pc3,Dist),
	añade(pc3,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(pc3,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(pc3,ps3,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps3,pc3,Dist),
	añade(ps3,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps3,ps3,NuevaLista,NuevaLista,Dist2).

recorrido(pc3,ps7,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps7,pc3,Dist),
	añade(ps7,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps7,ps7,NuevaLista,NuevaLista,Dist2).

recorrido(pc3,Pos,ListaRecorrido,Lista_aux,Distancia):-
	distinto(ps3,Pos),
	distinto(ps7,Pos),
	conectado(pc3,pc4,Dist),
	añade(pc4,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(pc4,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(pc4,ps4,ListaRecorrido,Lista_aux,Distancia):-
	%write('1','0','\n'),
	conectado(ps4,pc4,Dist),
	añade(ps4,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps4,ps4,NuevaLista,NuevaLista,Dist2).

recorrido(pc4,ps8,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps8,pc4,Dist),
	añade(ps8,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(ps8,ps8,NuevaLista,NuevaLista,Dist2).

recorrido(pc4,pt,ListaRecorrido,Lista_aux,Distancia):-
	conectado(pc4,pt,Dist),
	añade(pt,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(pt,pt,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps1,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps1,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).

recorrido(ps2,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps2,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps3,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps3,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps4,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps4,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps5,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps5,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps6,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps6,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps7,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps7,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	
recorrido(ps8,Pos,ListaRecorrido,Lista_aux,Distancia):-
	conectado(ps8,Pos_central,Dist),
	añade(Pos_central,ListaRecorrido,NuevaLista),
	Dist2 = Distancia + 5,
	recorrido(Pos_central,Pos,NuevaLista,NuevaLista,Dist2).
	

	
goal

pedido([linea(patatas,40),linea(boligrafos,40),linea(plumas,10)]).