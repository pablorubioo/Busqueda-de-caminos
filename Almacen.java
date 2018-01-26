

public class Almacen {
	
	
	public static class Nodo{
		String id, norte, sur, este, oeste;
		int distancia, F;
		boolean estante;
		int heuristica;
		public static Nodo padre;
		public Nodo(String i, int d, boolean est, String n, String s, String e, String o) {
			this.id=i;this.distancia=d;this.estante=est;this.norte=n;this.sur=s;this.este=e;this.oeste=o;
			};
	}
	
	public static class Total{
		String nombre;
		int unidades;
		public Total(String n, int u) {this.nombre=n; this.unidades=u;}
	}
	
	public static class Objeto{
		String nombre, posicion;
		int unidades;
		public Objeto(String n, String p, int u) {this.nombre=n;this.posicion=p;this.unidades=u;};
	}
	
	
	public static class Pedido{
		String producto;
		int unidades;
		public Pedido(String p, int u) {this.producto=p;this.unidades=u;}
	}
	
}
