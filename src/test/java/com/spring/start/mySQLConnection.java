package com.spring.start;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class mySQLConnection {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/spring_prj";
	private static final String USER = "mimi";
	private static final String PWD = "1234";
	
	@Test
	public void testConn() throws Exception{
		Class.forName(DRIVER);
		try(Connection conn = DriverManager.getConnection(URL, USER, PWD)){
			System.out.println(conn);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
