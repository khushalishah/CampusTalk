package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.RegVo;

public class GetRegObj {
	
	Database db = new Database();
	Session session= db.getSession();
	Transaction tx = null;
	RegVo rv=null;
	
	public RegVo getRegObj(long enrollment)
	{
		try
		{
			tx = session.beginTransaction();

				rv = (RegVo) session.createQuery("FROM RegVo where enrollment="+enrollment).uniqueResult(); 
					
			tx.commit();	
		}
		catch(Exception e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			System.out.println(e);
		}finally
		{
			db.closeSession(session);
		}
		return  rv;
	}
	
	public List<String> getAllUsernames(){
		
		List<String> names = new ArrayList<>();
		try
		{
			tx = session.beginTransaction();

				names =  session.createQuery("select registration_uname FROM RegVo").list(); 
					
			tx.commit();	
		}
		catch(Exception e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			System.out.println(e);
		}finally
		{
			db.closeSession(session);
		}
		return  names;
		
		
	}
	
public List<String> getAllNames(){
		
		List<String> names = new ArrayList<>();
		try
		{
			tx = session.beginTransaction();

				names =  session.createQuery("select registration_name FROM RegVo").list(); 
					
			tx.commit();	
		}
		catch(Exception e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			System.out.println(e);
		}finally
		{
			db.closeSession(session);
		}
		return  names;
		
		
	}

}
