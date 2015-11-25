package br.com.gestoecon.bean;

public class UsuarioVO {

	private int id;
	private String email;
	private String nome;
	private String senha;

	public UsuarioVO(String email, String nome, String senha) {
		this.id = id;
		this.email = email;
		this.nome = nome;
		this.senha = senha;
	}

	public UsuarioVO() {
		// TODO Auto-generated constructor stub
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
