/******************************************************************************

                            Online Java Compiler.
                Code, Compile, Run and Debug java program online.
Write your code in this editor and press "Run" button to execute it.

*******************************************************************************/

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.ResultSet; 
import java.sql.Statement; 

public class BatchCommand { 

	// Main driver method 
	public static void main(String args[]) 
	{ 

		// Try block to check if exception occurs 
		try { 

			// Step 2: Loading driver class 
			// Using forName() 
			Class.forName("oracle.jdbc.OracleDriver"); 

			// Step 3: Create connection object 
			Connection con = DriverManager.getConnection( 
				"jdbc:oracle:thin:@localhost:1521:xe", 
				"username", "password"); 
			Statement s = con.createStatement(); 
			
			// Step 4: Create a statement / create table 
			String sql1 
				= "CREATE TABLE STUDENT(STUDENTID VARCHAR2(10) PRIMARY KEY,NAME VARCHAR2(20),DEPARTMENT VARCHAR2(10))"; 

			// Step 5: Process a querry 
			// Insert records in the table 
			String sql2 
				= "INSERT INTO STUDENT VALUES('S101','JEAN','CSE')"; 
			String sql3 
				= "INSERT INTO STUDENT VALUES('S102','ANA','CSE')"; 
			String sql4 
				= "INSERT INTO STUDENT VALUES('S103','ROBERT','ECE')"; 
			String sql5 
				= "INSERT INTO STUDENT VALUES('S104','ALEX','IT')"; 
			String sql6 
				= "INSERT INTO STUDENT VALUES('S105','DIANA','IT')"; 
			s.addBatch(sql1); 
			s.addBatch(sql2); 
			s.addBatch(sql3); 
			s.addBatch(sql4); 
			s.addBatch(sql5); 
			s.addBatch(sql6); 

			// Step 6: Process the results 
			// execute the sql statements 
			s.executeBatch(); 
			ResultSet rs 
				= s.executeQuery("Select * from Student"); 

			// Print commands 
			System.out.println( 
				"StudentID\tName\t\tDepartment"); 
			System.out.println( 
				"-------------------------------------------------------"); 

			// Condition to check pointer pointing 
			while (rs.next()) { 
				System.out.println(rs.getString(1) + "\t\t"
								+ rs.getString(2) 
								+ "\t\t"
								+ rs.getString(3)); 
			} 

			// Step 7: Close the connection 
			con.commit(); 
			con.close(); 
		} 

		// Catch block to handle exceptions 
		catch (Exception e) { 

			// Print line number if exception occured 
			System.out.println(e); 
		} 
	} 
}
