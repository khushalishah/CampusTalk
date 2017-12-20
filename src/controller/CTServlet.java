package controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CTInterface;
import controller.CTObjectFactory;
import controller.CampusTalkController;

/**
 * Servlet implementation class CTServlet
 */
@WebServlet("/CTServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
maxFileSize=1024*1024*10,		// 10MB
maxRequestSize=1024*1024*50)	// 50MB
public class CTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CTServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		String type=request.getParameter("type");
		String operation=request.getParameter("operation");
		CTInterface ci=(CTInterface) CTObjectFactory.getInstance(type);
	    CampusTalkController cc=new CampusTalkController();
	    cc.control(ci,operation, request,response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	}

}
