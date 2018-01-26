

public class Main {

	public final static String Nodoinicio = "ps";
	public final static String Nodofin = "pt";

	public static Almacen.Nodo [] nod = new Almacen.Nodo [14];
	public static Almacen.Objeto [] obj = new Almacen.Objeto [14];
	public static Almacen.Pedido [] ped = new Almacen.Pedido [3];
	public static Almacen.Total [] tot = new Almacen.Total[9];
	
	 public static void main(String[] args) {

		 inicializarAlmacen();
		 
		 inicializarPedido();
		 
		 if(comprobarPedido(ped, tot)) {
			 Astar.aestrella(Nodoinicio, Nodofin, ped, nod, obj);
		 }
		 else {
			 System.out.println("No se puede realizar su pedido");
		 }
		 
	 }
	 

	private static boolean comprobarPedido(Almacen.Pedido[] pedido, Almacen.Total[] objetos) {
		
		boolean b = true;
		
		//Comprobamos si el pedido se puede hacer
		for(int i =0;i<pedido.length;i++) {
			for(int j=0;j<objetos.length;j++) {
			
				if(pedido[i].producto == objetos[j].nombre) {
					if(pedido[i].unidades > objetos[j].unidades) {
						b = false;
					}
				}
				
				}
			}
		
		return b;
	}


	private static void inicializarAlmacen(){
    	
    	//NODOS
    	nod[0]= new Almacen.Nodo("ps", 0, false, null, null, "pc1", null);
    	nod[1]= new Almacen.Nodo("pc1", 5, false, "ps1", "ps5", "pc2", "ps");
    	nod[2]= new Almacen.Nodo("pc2", 10, false, "ps2", "ps6", "pc3", "pc1");
    	nod[3]= new Almacen.Nodo("pc3", 15, false, "ps3", "ps7", "pc4", "pc2");
    	nod[4]= new Almacen.Nodo("pc4", 20, false, "ps4", "ps8", "pt", "pc3");
    	nod[5]= new Almacen.Nodo("pt", 25, false, null, null, null, "pc4");
    	nod[6]= new Almacen.Nodo("ps1", 10, true, null , "pc1", null, null);
    	nod[7]= new Almacen.Nodo("ps5", 10, true, "pc1", null, null, null);
    	nod[8]= new Almacen.Nodo("ps2", 15, true, null , "pc2", null, null);
    	nod[9]= new Almacen.Nodo("ps6", 15, true, "pc2", null, null, null);
    	nod[10]= new Almacen.Nodo("ps3", 20, true, null , "pc3", null, null);
    	nod[11]= new Almacen.Nodo("ps7", 20, true, "pc3", null, null, null);
    	nod[12]= new Almacen.Nodo("ps4", 25, true, null , "pc4", null, null);
    	nod[13]= new Almacen.Nodo("ps8", 25, true, "pc4", null, null, null);
    	
    	//OBJETOS
    	obj[0]= new Almacen.Objeto("patatas", "ps1", 200);
    	obj[1]= new Almacen.Objeto("melones", "ps1", 100);
    	obj[2]= new Almacen.Objeto("boligrafos", "ps2", 500);
    	obj[3]= new Almacen.Objeto("melocotones", "ps4", 200);
    	obj[4]= new Almacen.Objeto("berzas", "ps4", 100);
    	obj[5]= new Almacen.Objeto("papeles", "ps5", 500);
    	obj[6]= new Almacen.Objeto("plumas", "ps7", 500); 
    	obj[7]= new Almacen.Objeto("colonias", "ps3", 150);
    	obj[8]= new Almacen.Objeto("ratones", "ps4", 210);
    	obj[9]= new Almacen.Objeto("boligrafos", "ps3", 400);
    	obj[10]= new Almacen.Objeto("boligrafos", "ps6", 400);
    	obj[11]= new Almacen.Objeto("patatas", "ps1", 200);
    	obj[12]= new Almacen.Objeto("melones", "ps1", 100);
    	obj[13]= new Almacen.Objeto("plumas", "ps8", 400);
    	
    	tot[0] = new Almacen.Total("patatas", 400);
    	tot[1] = new Almacen.Total("melones", 200);
    	tot[2] = new Almacen.Total("boligrafos", 1300);
    	tot[3] = new Almacen.Total("melocotones", 200);
    	tot[4] = new Almacen.Total("berzas", 100);
    	tot[5] = new Almacen.Total("papeles", 500);
    	tot[6] = new Almacen.Total("plumas", 900);
    	tot[7] = new Almacen.Total("colonias", 150);
    	tot[8] = new Almacen.Total("ratones", 210);

    	
    	System.out.println("Almacén inicializado.");
  	
    }
	
	private static void inicializarPedido() {
		
		ped[0]= new Almacen.Pedido("patatas", 40); 
		ped[1]= new Almacen.Pedido("boligrafos", 40); 
		ped[2]= new Almacen.Pedido("plumas", 10);
		
    	System.out.println("Pedido inicializado.");
		
	}
	
}
