package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
public abstract class CTDao {
	public void insert(Object obj) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		try
		{
			tx = session.beginTransaction();
			session.save(obj);
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
	}
    public abstract List<Object> view(long id);
    public abstract void delete(Object id);
    public abstract void edit(Object o);
	

}
