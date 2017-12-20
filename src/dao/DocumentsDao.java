package dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.BlogsVo;
import vo.DocumentsVo;

public class DocumentsDao extends CTDao {

	
	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		List<Object> documents=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				
				
			documents = session.createQuery("FROM DocumentsVo where document_enrollment="+id).list(); 
					
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
		return  documents;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void edit(Object o) {
		// TODO Auto-generated method stub
		DocumentsVo docVo = (DocumentsVo) o;
		
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		
		   try{
		         tx = session.beginTransaction();
		         DocumentsVo updateVo = 
		                    (DocumentsVo) session.get(DocumentsVo.class,docVo.getDocument_enrollment()); 
		        
		         DocumentsVo databaseVo = (DocumentsVo) session.createQuery("from DocumentsVo where document_enrollment="+docVo.getDocument_enrollment()).uniqueResult();
		         if(!(docVo.getDocument_10th().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_10th());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_10th(docVo.getDocument_10th());
			        }else{
			        	updateVo.setDocument_10th(databaseVo.getDocument_10th());
			        }
		         //12th marksheet
		         if(!(docVo.getDocument_12th().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_12th());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_12th(docVo.getDocument_12th());
			        }else{
			        	updateVo.setDocument_12th(databaseVo.getDocument_12th());
			        }
		         
		         //sem1 marksheet
		         if(!(docVo.getDocument_sem1().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem1());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem1(docVo.getDocument_sem1());
			        }else{
			        	updateVo.setDocument_sem1(databaseVo.getDocument_sem1());
			        }
		         
		         //sem2 marksheet
		         if(!(docVo.getDocument_sem2().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem2());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem2(docVo.getDocument_sem2());
			        }else{
			        	updateVo.setDocument_sem2(databaseVo.getDocument_sem2());
			        }
		         
		         //sem3 marksheet
		         if(!(docVo.getDocument_sem3().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem3());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem3(docVo.getDocument_sem3());
			        }else{
			        	updateVo.setDocument_sem3(databaseVo.getDocument_sem3());
			        }
		         
		         //sem4 marksheet
		         if(!(docVo.getDocument_sem4().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem4());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem4(docVo.getDocument_sem4());
			        }else{
			        	updateVo.setDocument_sem4(databaseVo.getDocument_sem4());
			        }
		         
		         //sem5 marksheet
		         if(!(docVo.getDocument_sem5().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem5());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem5(docVo.getDocument_sem5());
			        }else{
			        	updateVo.setDocument_sem5(databaseVo.getDocument_sem5());
			        }
		         
		         //sem6 marksheet
		         if(!(docVo.getDocument_sem6().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem6());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem6(docVo.getDocument_sem6());
			        }else{
			        	updateVo.setDocument_sem6(databaseVo.getDocument_sem6());
			        }
		         
		         //sem7 marksheet
		         if(!(docVo.getDocument_sem7().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem7());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem7(docVo.getDocument_sem7());
			        }else{
			        	updateVo.setDocument_sem7(databaseVo.getDocument_sem7());
			        }
		         
		         //sem8 marksheet
		         if(!(docVo.getDocument_sem8().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sem8());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sem8(docVo.getDocument_sem8());
			        }else{
			        	updateVo.setDocument_sem8(databaseVo.getDocument_sem8());
			        }
		         
		         //photo
		         if(!(docVo.getDocument_photo().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_photo());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_photo(docVo.getDocument_photo());
			        }else{
			        	updateVo.setDocument_photo(databaseVo.getDocument_photo());
			        }
		         
		         //sign
		         if(!(docVo.getDocument_sign().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_sign());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_sign(docVo.getDocument_sign());
			        }else{
			        	updateVo.setDocument_sign(databaseVo.getDocument_sign());
			        }
		         
		         //driving license
		         if(!(docVo.getDocument_drivingL().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_drivingL());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_drivingL(docVo.getDocument_drivingL());
			        }else{
			        	updateVo.setDocument_drivingL(databaseVo.getDocument_drivingL());
			        }
		         
		         //uniqueId
		         if(!(docVo.getDocument_uniqueId().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_uniqueId());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_uniqueId(docVo.getDocument_uniqueId());
			        }else{
			        	updateVo.setDocument_uniqueId(databaseVo.getDocument_uniqueId());
			        }
		         
		         //other document
		         if(!(docVo.getDocument_other().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_other());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_other(docVo.getDocument_other());
			        }else{
			        	updateVo.setDocument_other(databaseVo.getDocument_other());
			        }
		         
		         //birth certificate
		         if(!(docVo.getDocument_birthC().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_birthC());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_birthC(docVo.getDocument_birthC());
			        }else{
			        	updateVo.setDocument_birthC(databaseVo.getDocument_birthC());
			        }
		         
		         //college Id
		         if(!(docVo.getDocument_clgId().equals(""))){
			        	//delete old file code
			        	File file = new File(databaseVo.getDocument_clgId());
			        	if(file.exists()){
			        		file.delete();
			        	}
			        	//entry of new file in database
			        	updateVo.setDocument_clgId(docVo.getDocument_clgId());
			        }else{
			        	updateVo.setDocument_clgId(databaseVo.getDocument_clgId());
			        }
		         
				 session.update(updateVo); 
		         tx.commit();
		      }catch (HibernateException e) {
		         if (tx!=null) tx.rollback();
		         e.printStackTrace(); 
		      }finally {
		    	  	db.closeSession(session);
		      }
		
	}
	
	public boolean areDocumentsAvailable(long enrollment){
		long count =0;
		
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		
		try
		{
			tx = session.beginTransaction();
				
				
			count = (long) session.createQuery("select count(*) FROM DocumentsVo where document_enrollment="+enrollment).uniqueResult();
			System.out.println("documents Available?"+count);
			tx.commit();
			if(count!=0){
				return true;
			}	
				
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
		return false;
	}

}
