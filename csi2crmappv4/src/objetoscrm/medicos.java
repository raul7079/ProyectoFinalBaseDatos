package objetoscrm;

public class medicos {

	private int idMedico;
	private String nombre;
	private String apellido;

	public medicos(int idMedico, String nombre, String apellido) {
		super();
		this.idMedico = idMedico;
		this.nombre = nombre;
		this.apellido = apellido;
	}

	public int getidMedico() {
		return idMedico;
	}

	public void setIdMedico(int idMedico) {
		this.idMedico = idMedico;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
}
