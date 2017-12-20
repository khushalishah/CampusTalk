package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CTInterface {

	public void insert(HttpServletRequest request,HttpServletResponse response);
	public void delete(HttpServletRequest request,HttpServletResponse response);
	public void edit(HttpServletRequest request,HttpServletResponse response);
	public void view(HttpServletRequest request, HttpServletResponse response);

}
