package br.com.gestoecon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.gestoecon.bean.UsuarioVO;

public class UsuarioDAO {

	// INSERIR USUARIO NO BANCO DE DADOS.

	public static void inserirUsuario(UsuarioVO objUsuario) {

		String sqlInsercao = "insert into usuario (email, nome, senha) values (?,?,?)";
		PreparedStatement pstm = null;
		Connection objCon = null;

		try {
			objCon = ConexaoDAO.getConnection();
			pstm = objCon.prepareStatement(sqlInsercao);
			pstm.setString(1, objUsuario.getEmail());
			pstm.setString(2, objUsuario.getNome());
			pstm.setString(3, objUsuario.getSenha());

			pstm.executeUpdate();
			System.out.println("Insercao Feita Com Sucesso!");
		} catch (Exception e) {
			System.out.println("Erro na insercao!\nMotivo: " + e.getMessage());
		} finally {
			ConexaoDAO.closeConnection(objCon);
		}
	}

	// EXCLUIR USUARIO DO BANCO DE DADOS.

	public void excluirUsuario(UsuarioVO objUsuario) {
		String sqlExclusao = "delete from usuario where email = ?";
		PreparedStatement pstm = null;
		Connection objCon = null;

		try {
			objCon = ConexaoDAO.getConnection();
			pstm = objCon.prepareStatement(sqlExclusao);
			pstm.setString(1, objUsuario.getEmail());
			pstm.executeUpdate();
			System.out.println("Exclusao Feita com Sucesso!");
		} catch (Exception e) {
			System.out.println("Erro na exclusao da Conta!\nMotivo: " + e.getMessage());
		} finally {
			ConexaoDAO.closeConnection(objCon);
		}

	}
	
	/** LISTAR USUARIO */

	public static List<UsuarioVO> listarUsuario() {

		List<UsuarioVO> lista = new ArrayList<UsuarioVO>();

		String sqlLista = "select * from usuario";
		PreparedStatement pstm = null;
		Connection objCon = null;

		try {
			objCon = ConexaoDAO.getConnection();
			pstm = objCon.prepareStatement(sqlLista);

			// Commit no banco
			ResultSet rs = pstm.executeQuery();
			// Tirando do Resultset e colocando no objeto usuario
			while (rs.next()) {
				UsuarioVO objUsuario = new UsuarioVO();
				objUsuario.setEmail(rs.getString("email"));
				objUsuario.setNome(rs.getString("nome"));
				objUsuario.setSenha(rs.getString("senha"));

				lista.add(objUsuario);
			}
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}


	// ALTERANDO USUARIO DO BANCO DE DADOS.

	public static void alterarUsuario(UsuarioVO objUsuario ) {
		String sqlAtualizacao = "update usuario set email=?, nome =?, senha =? where email = ?";
		PreparedStatement pstm = null;
		Connection objCon = null;

		try {
			objCon = ConexaoDAO.getConnection();
			pstm = objCon.prepareStatement(sqlAtualizacao);
			pstm.setString(1, objUsuario.getEmail());
			pstm.setString(2, objUsuario.getNome());
			pstm.setString(3, objUsuario.getSenha());
			pstm.setString(4, objUsuario.getEmail());
			
			
			pstm.executeUpdate();
			System.out.println("Atualizacao de usuario Feita com Sucesso!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro na atualizacao do Usuario");
		} finally {
			ConexaoDAO.closeConnection(objCon);

		}
	}

	// CONSULTAR USUARIO NO BANCO DE DADOS.

	public static UsuarioVO consultarUsuario(String email) {
		UsuarioVO objUsuario = new UsuarioVO();
		String sqlConsulta = "select * from usuario where email = ?";
		PreparedStatement pstm = null;
		Connection objCon = null;
		ResultSet rs = null;

		try {
			objCon = ConexaoDAO.getConnection();
			pstm = objCon.prepareStatement(sqlConsulta);
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			rs.next();
			if (rs.getRow() == 0) {
				objUsuario = null;
				System.out.println("Usuario não consta na base de dados!");
			} else {
				objUsuario.setEmail(rs.getString("email"));
				objUsuario.setNome(rs.getString("nome"));
				objUsuario.setSenha(rs.getString("senha"));
			}
		} catch (SQLException e) {
			System.out.println("Erro na consulta de usuario!\nMotivo: "
					+ e.getMessage());
		} finally {
			ConexaoDAO.closeConnection(objCon);
		}
		return objUsuario;
	}

	
	
	
	
	
	

}
