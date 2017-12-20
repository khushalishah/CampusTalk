package implementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Login_DB_Admin {
	

	 ResultSet rs;
	
	public String getPwd(String uname)
	{
		String pwd=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/campustalk","root","root");
			PreparedStatement ps=con.prepareStatement("select password from Admin where username='"+uname+"'");
			rs=ps.executeQuery();
			if(rs.next())
			{
				pwd=rs.getString("password");
			}
			con.close();
			return pwd;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public String getType(String uname)
	{
		String type="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/campustalk","root","root"); 
			PreparedStatement ps=con.prepareStatement("select type from Admin where username='"+uname+"'");
			rs=ps.executeQuery();
			if(rs.next()){
			type=rs.getString("type");
			}
			return type;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void setpwd(String pwd,String uname)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/campustalk","root","root");
			PreparedStatement ps=con.prepareStatement("update Admin set password=? where username=?");
			ps.setString(1, pwd);
			ps.setString(2, uname);
			ps.executeUpdate();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//return false;
	}
}


