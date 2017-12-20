package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CampusTalkController {
   // HttpServletRequest request;
	public void control(CTInterface inf,String operation, HttpServletRequest request,HttpServletResponse response)
	{
		switch(operation)
		{
		case "insert" : inf.insert(request,response);
						break;		
		case "view"	  : inf.view(request,response);
						break;
		case "edit"	  : inf.edit(request,response);
					    break;
		case "delete" : inf.delete(request,response);
		                break;
		}
	}
}
