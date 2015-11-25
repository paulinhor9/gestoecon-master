package br.com.gestoecon.bean;

import java.util.Date;

public class MovimentoVO {

	private int id_movimento;
	private String nome;
	private double valor;
	private Date data;
	private boolean tipo;
	private int idConta;
	//no banco eh o campo email
	private String idUsuario;

	public MovimentoVO() {
		super();
		this.id_movimento = id_movimento;
		this.nome = nome;
		this.valor = valor;
		this.data = data;
		this.tipo = tipo;
	}
	
	public String getIdUsuario() {
		return idUsuario;
	}
	
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getId_movimento() {
		return id_movimento;
	}

	public void setId_movimento(int id_movimento) {
		this.id_movimento = id_movimento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public boolean isTipo() {
		return tipo;
	}

	public void setTipo(boolean tipo) {
		this.tipo = tipo;
	}
	
	public void setIdConta(int idConta) {
		this.idConta = idConta;
	}
	
	public int getIdConta() {
		return idConta;
	}

}
