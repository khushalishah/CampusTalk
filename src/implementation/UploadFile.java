package implementation;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadFile {
	static String file;

	public String uploadFile(HttpServletRequest request, String savePath, String name)
			throws ServletException, IOException {

		String fileName = "";

		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		InputStream inputStream = null; // input stream of the upload file
		OutputStream outputStream = null;
		try {
			// obtains the upload file part in this multipart request
			Part filePart = request.getPart(name);
			if (filePart != null) {
				// prints out some information for debugging
				System.out.println(filePart.getName());
				System.out.println(filePart.getSize());
				System.out.println(filePart.getContentType());

				// if file is empty then return blank string
				if (filePart.getSize() == 0) {
					return "";
				}

				// obtains input stream of the upload file
				inputStream = filePart.getInputStream();

				// file name
				fileName = extractFileName(request.getPart(name));
				String file[] = fileName.split("\\.");
				fileName = file[0] + System.currentTimeMillis() + "." + file[1];

				// write the inputStream to a FileOutputStream
				outputStream = new FileOutputStream(fileSaveDir + File.separator + fileName);

				int read = 0;
				byte[] bytes = new byte[1024];

				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}

				System.out.println("Done!");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (outputStream != null) {
				try {
					// outputStream.flush();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
			return savePath + File.separator + fileName;
		
	}

	/**
	 * Extracts file name from HTTP header content-disposition
	 */
	private static String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				System.out.println("filename:" + s);
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}
