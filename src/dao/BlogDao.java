package dao;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.BlogsVo;

public class BlogDao extends CTDao{
	
	Database db = new Database();
	Session session= db.getSession();
	Transaction tx = null;
	
	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		
		List<Object> blogs=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();

				blogs = session.createQuery("FROM BlogsVo where blog_enrollment="+id+"ORDER BY blog_date DESC").list(); 
					
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
		return  blogs;
		
	}
	
	
	public List<Object> viewAll(String category) {
		// TODO Auto-generated method stub
		
		List<Object> blogs=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
			
			if(category.equals(""))
				{blogs = session.createQuery("FROM BlogsVo").list();} 
			else
				{blogs = session.createQuery("FROM BlogsVo where blog_category='"+category+"' ORDER BY blog_date DESC").list();} 
					
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
		return  blogs;
		
	}
	
public List<Object> view(int noOfRows,int noOfPage){
		
		List<Object> blogs=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				Query q= session.createQuery("FROM BlogsVo order by blog_date desc");
				q.setMaxResults(3);
				blogs=q.list();
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
		return  blogs;
		
	}
	
	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		int ID=(int)id;
	      try{
	         tx = session.beginTransaction();
	         BlogsVo vo = 
	                   (BlogsVo)session.get(BlogsVo.class,ID); 
	         if(!vo.getBlog_file().equals(""))
	         {
	        	 File file=new File(vo.getBlog_file());
	        	 if(file.exists())
	        	 {
	        		 file.delete();
	        	 }
	         }
	         session.delete(vo); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		
	}
	@Override
	public void edit(Object o) {
		// TODO Auto-generated method stub
		BlogsVo vo=(BlogsVo)o;
	      try{
	         tx = session.beginTransaction();
	         BlogsVo updateVo = 
	                    (BlogsVo) session.get(BlogsVo.class,vo.getBlog_id()); 
	        
	         updateVo.setBlog_date(vo.getBlog_date());
	         updateVo.setBlog_description(vo.getBlog_description());
	         updateVo.setBlog_enrollment(vo.getBlog_enrollment());
	         updateVo.setBlog_id(vo.getBlog_id());
	         updateVo.setBlog_name(vo.getBlog_name());
	         updateVo.setBlog_title(vo.getBlog_title());
	         updateVo.setBlog_category(vo.getBlog_category());
	         
	         String old_pic = (String) session.createQuery("select blog_file from BlogsVo where blog_id="+vo.getBlog_id()).uniqueResult();
	         System.out.println("blog old file :"+old_pic);
		        if(!(vo.getBlog_file().equals(""))){
		        	//delete old file code
		        	File file = new File(old_pic);
		        	if(file.exists()){
		        		file.delete();
		        	}
		        	//entry of new file in database
		        	updateVo.setBlog_file(vo.getBlog_file());
		        }else{
		        	updateVo.setBlog_file(old_pic);
		        }
	         
			 session.update(updateVo); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		
	}
}


