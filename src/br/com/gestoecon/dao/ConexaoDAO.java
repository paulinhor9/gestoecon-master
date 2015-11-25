package br.com.gestoecon.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {

	public static Connection getConnection() {

		String url = "jdbc:postgresql://127.0.0.1:5432/GestoEcon";
		Connection con = null;
		try {
			// CARREGAR O DRIVE

			Class.forName("org.postgresql.Driver");

			// ESTABELECENDO CONEXÃO COM O BANCO
			con = DriverManager.getConnection(url, "postgres", "130423");
			System.out.println("\n\n-------Conexão estabelecida com sucesso!------");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("Driver não encontrado!");

		} catch (SQLException e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			System.err.println("Erro no momento da conexão com o banco de dados");
		}
		return con;
	}

	public static void closeConnection(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConexao() {
		// TODO Auto-generated method stub
		return null;
	}

}
