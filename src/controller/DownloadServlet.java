package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadServlet
 */
@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		

		         String filePath = request.getParameter("filePath");
		         System.out.println(filePath);
		         
		         if((filePath!=null) && (!filePath.equals(""))){
		         String fileArray[]=filePath.split("\\\\");
		         
		         String fileName = "";
		         String fileType = "";
		         // Find this file id in database to get file name, and file type
		         fileName = fileArray[fileArray.length-1];
		         fileName = fileName.replaceAll("\\s+","");
		         // You must tell the browser the file type you are going to send
		         // for example application/pdf, text/plain, text/html, image/jpg
		         //response.setContentType(fileType);
		         
		         // Make sure to show the download dialog
		         response.setHeader("Content-disposition","attachment; filename="+fileName);

		         // Assume file name is retrieved from database
		         // For example D:\\file\\test.pdf

		         File my_file = new File(filePath);
		         response.setHeader("Content-Type", new MimetypesFileTypeMap().getContentType(my_file));

		         // This should send the file to browser
		         OutputStream out = response.getOutputStream();
		         FileInputStream in = new FileInputStream(my_file);
		         byte[] buffer = new byte[4096];
		         int length;
		         while ((length = in.read(buffer)) > 0){
		            out.write(buffer, 0, length);
		         }
		         in.close();
		         out.flush();
		         out.close();
		         }else{
		        	 //code if file is not available
		        	 System.out.println("File not available");
		        	   

		         }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
