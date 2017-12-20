package implementation;

import java.sql.*;

public class Login_DB {

	 ResultSet rs;	
	public String getPwd(String uname)
	{
		
		String pwd=null;
		try
		{   
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/campustalk","root","root");
			PreparedStatement ps=con.prepareStatement("select password from registration where uname='"+uname+"'");
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
		finally {
			
		}
		return null;
		
	}
    public User getuname(String uname)
	{   
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/campustalk","root","root");
			PreparedStatement ps=con.prepareStatement("select uname,email,password,name from registration where uname='"+uname+"'");
			rs=ps.executeQuery();
		
			if(rs.next())
			{
			  User u=new User(rs.getString(1),rs.getString(3),rs.getString(2),rs.getString(4));	
			  con.close();
			  return u;
			}
			else
			{
				return null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public class User
	{
		public String uname,password,email,name;

		public User(String uname, String password, String email,String name) {
			super();
			this.uname = uname;
			this.password = password;
			this.email = email;
			this.name=name;
		}
		public User(){}
		
	}
}
