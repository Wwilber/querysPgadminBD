package jpostgresql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

public class Utils {
	
	static Scanner teclado = new Scanner(System.in);
	
	//conexão com o banco de dados:
	public static Connection conectar() {
		
		//instânciado o método Properties:	
		Properties props = new Properties();
		//acessar o usuário wilber e senha no postgresql:	
		props.setProperty("user", "wilber");
		props.setProperty("password", "Creci#006799");
		//sem criptografia:
		props.setProperty("ssl", "false");
		//criação de uma String para a url do servidor do banco de dados:
		String URL_SERVIDOR = "jdbc:postgresql://localhost:5432/jpostgresql";	
	
		try {
			return DriverManager.getConnection(URL_SERVIDOR, props);	
		
		}catch(Exception e ) {
			e.printStackTrace();
			if(e instanceof ClassNotFoundException) {
				System.err.println("Verifique o driver de conexão");
			}else {
				System.err.println("Verifique se o servidor está ativo");
			}
			System.exit(-42);
			return null;
		}
	}
	public static void desconectar(Connection conn) {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void listar() {
		String BUSCAR_TODOS = "SELECT * FROM produtos";
		
		try {
			Connection conn = conectar();
			PreparedStatement produtos = conn.prepareStatement(BUSCAR_TODOS);
			
		}catch(Exception e ) {
			e.printStackTrace();
			System.err.println("Erro buscando todos os produtos!!!!");
			System.exit(-42);
		}
	}
	
	public static void inserir() {
		System.out.println("Inserindo produtos...");
	}
	
	public static void atualizar() {
		System.out.println("Atualizando produtos...");
	}
	
	public static void deletar() {
		System.out.println("Deletando produtos...");
	}
	
	public static void menu() {
		System.out.println("==================Gerenciamento de Produtos===============");
		System.out.println("Selecione uma opções: ");
		System.out.println("1 - Listar produtos.");
		System.out.println("2 - Inserir produtos.");
		System.out.println("3 - Atualizar produtos.");
		System.out.println("4 - Deletar produtos.");
		
		int opcao = Integer.parseInt(teclado.nextLine());
		if(opcao == 1) {
			listar();
		}else if(opcao == 2) {
			inserir();
		}else if(opcao == 3) {
			atualizar();
		}else if(opcao == 4) {
			deletar();
		}else {
			System.out.println("Opção inválida.");
		}
	}
}
