package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int[] pixels = new int[128*128*3];
	    for(int i = 0; i < 128*128; i++){
	        pixels[i] = 200 << 16 | 0 << 8 | 0;
	    }
	    BufferedImage image = new BufferedImage(128,128,BufferedImage.TYPE_INT_RGB);
	    image.setRGB(0,0,128,128, pixels,0,128);

	    String path = request.getParameter("imageID");
	    if(!path.equals("")){
	    System.out.println(path);
	    // get the file's address from the request
	    File imageID = new File(path);
	    String file[] = path.split("\\.");
	    System.out.println(file[1]);
	    // Try to read the file into the image, if you can't read it, print an error
	    try{
	        image = ImageIO.read(imageID);
	       
	    }catch(Exception e){
	        System.out.println("IMAGE IO ERROR");
	        e.printStackTrace();
	    }

	    System.out.println(imageID.toString());

	    // get the response output stream and pass the image to it
	    ServletOutputStream out = response.getOutputStream();
	    ImageIO.write(image, file[1], out);
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
