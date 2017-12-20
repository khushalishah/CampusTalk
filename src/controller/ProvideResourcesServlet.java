package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.GetRegObj;

/**
 * Servlet implementation class ProvideResourcesServlet
 */
@WebServlet("/ProvideResourcesServlet")
public class ProvideResourcesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProvideResourcesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String type = request.getParameter("operationtype");
		if(type.equals("checkusername")){
			System.out.println("username cheking...");
			GetRegObj obj = new GetRegObj();
			
			JSONArray jsonArray = new JSONArray();
			for(String value : obj.getAllUsernames()){
				jsonArray.put(value);
			}
			try{
			
			response.getWriter().append(jsonArray.toString());
			}catch(Exception e){
				
			}
			
			
		}
		else if(type.equals("getStudentNames")){
GetRegObj obj = new GetRegObj();
			
			JSONArray jsonArray = new JSONArray();
			for(String value : obj.getAllNames()){
				jsonArray.put(value);
			}
			try{
			
				response.getWriter().append(jsonArray.toString());
			}catch(Exception e){
				
			}
			
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
