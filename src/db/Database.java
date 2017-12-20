package db;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Database {

	static SessionFactory factory = new Configuration().configure().buildSessionFactory();
	
	static SessionFactory getSessionFactory(){
		return factory;
	}
	
	public Session getSession(){
		return factory.openSession();
	}
	
	public void closeSession(Session session){
		if(session != null){
			session.close();
		}
	}
}
