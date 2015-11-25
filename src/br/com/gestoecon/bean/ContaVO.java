package br.com.gestoecon.bean;

public class ContaVO {

	private int id;
	private String nome;
	private double saldo;
	private String idUsuario;

	
	public ContaVO(int id, String nome, double saldo) {
		super();
		this.id = id;
		this.nome = nome;
		this.saldo = saldo;
	}
	
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public String getIdUsuario() {
		return idUsuario;
	}

	public ContaVO() {
		// TODO Auto-generated constructor stub
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
