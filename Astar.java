
import java.util.ArrayList;

public class Astar {

	public final static int d = 5;
	public static int distanciaPrincipio = 9999;
	public static boolean exito;
	public static Almacen.Nodo actual, temp;
	public static String norte, sur, este, oeste;
	
	static ArrayList<Object> cerrados = new ArrayList<>();          
	static ArrayList<Object> abiertos = new ArrayList<>();
	static ArrayList<Object> vecinos = new ArrayList<>();

	
	public static void aestrella(String inicio, String fin, Almacen.Pedido[] ped, Almacen.Nodo[] nod, Almacen.Objeto[] obj) {
		
		System.out.println("");
		System.out.println("RUTA ALGORITMO A*");
		System.out.println("");
		
		cerrados.clear();
		abiertos.clear();
		
		abiertos.add(nod[0]);		
		exito=false;
		
		while(abiertos.size()!=0) {
			
			actual = (Almacen.Nodo) getMenorCoste(abiertos);

			abiertos.remove(actual);
			
			cerrados.add(actual);
			
			if(actual.id==fin) {
				break;
			}
			else {
							
				//OBTENER LOS VECINOS DEL NODO ACTUAL CON SU HEURÍSTICA CORRESPONDIENTE CALCULADA
				vecinos.clear();
				vecinos = obtenerVecinos(actual, nod, ped, obj);

				if(vecinos.size()==1) {
					temp = (Almacen.Nodo) vecinos.get(0);
					temp.F = 1;
					abiertos.add(temp);
				}
				else {
					for(int v=0;v<vecinos.size();v++) {
						
						temp = (Almacen.Nodo) vecinos.get(v);
						
						temp.F = setTotal(temp);
						
						if(!abiertos.contains(temp) && !cerrados.contains(temp)) {
							temp.padre = actual;
							abiertos.add(temp);
						}
						else if (abiertos.contains(temp)){
							if(temp.distancia < actual.distancia) {
								temp.padre = actual;
							}
						}
						
					}//fin for vecinos
				}
			}//fin else
		}//fin while
		
		
		//IMPRIMO EL RECORRIDO FINAL
		int distancia = 0;
		for(int i=0;i<cerrados.size();i++) {
			Almacen.Nodo nodoo = (Almacen.Nodo) cerrados.get(i);
			distancia += d;
			System.out.println(nodoo.id +" distancia "+ distancia);
		}

	}
	
	
	
	private static Almacen.Nodo getMenorCoste(ArrayList<Object> abierto) {
		
		Almacen.Nodo nodo = null;
		Almacen.Nodo temp = null;
		
		nodo = (Almacen.Nodo) abierto.get(0);
		
		if(abierto.size()>1) {
			for(int i=0;i<abierto.size();i++) {				
				temp = (Almacen.Nodo) abierto.get(i);
				if(temp.F < nodo.F) {
					nodo = temp;
				}
			}
		}
		
		return nodo;
	}



	private static int setTotal(Almacen.Nodo nodo) {
		
		int total = 0;
		
		if(nodo.id=="pt") {
			total=1;
		}
		else {
			total = nodo.distancia + nodo.heuristica;
		}		
		
		return total;
	}



	private static ArrayList<Object> obtenerVecinos(Almacen.Nodo nodo, Almacen.Nodo[] nodos, Almacen.Pedido[] ped, Almacen.Objeto[] obj) {
		
		ArrayList<Object> vecinos = new ArrayList<Object>();
		
		for(int i=0;i<nodos.length;i++) {
			if(nodos[i].id==nodo.norte) {
				nodos[i].heuristica = calcularHeuristica(nodos[i], ped, obj); 
				vecinos.add(nodos[i]);
			}
			else if(nodos[i].id==nodo.este) { 
				nodos[i].heuristica = calcularHeuristica(nodos[i], ped, obj); 
				vecinos.add(nodos[i]);
			}
			else if(nodos[i].id==nodo.oeste) {
				nodos[i].heuristica = calcularHeuristica(nodos[i], ped, obj); 
				vecinos.add(nodos[i]);
			}
			else if(nodos[i].id==nodo.sur) {
				nodos[i].heuristica = calcularHeuristica(nodos[i], ped, obj); 
				vecinos.add(nodos[i]);
			}
			else {};
		}
		
		return vecinos;	
	}



	private static int calcularHeuristica(Almacen.Nodo nodo, Almacen.Pedido[] pedido, Almacen.Objeto[] objeto) {
		int valor = 100;
		int flag = 0;
		int temp = 0;

		
		//si tiene un objeto que queremos se resta valor a la heuristica
		for(int i =0;i<pedido.length;i++) {
			for(int j=0;j<objeto.length;j++) {
				if(pedido[i].producto==objeto[j].nombre) {
					if(nodo.id==objeto[j].posicion) { 			
						
						if(pedido[i].unidades > objeto[j].unidades) {
							temp = pedido[i].unidades;
							pedido[i].unidades -= objeto[j].unidades;
							objeto[j].unidades -= temp;
						}
						else {
							pedido[i].producto = "gotIt";
						}
						
						valor = 0; 
						flag=1;
						break;
					}
					else if(pedido[i].producto==objeto[j].nombre && nodo.estante) {
						valor = valor + 100;
						break;
					}
				}
			}
			if(flag==1) break;
		}
		
		return valor;
	}
	
}
