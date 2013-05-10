package jsp.travelsnap;

import java.io.File;

import java.io.IOException;

import java.util.Iterator;
import java.util.Vector;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javaxt.io.Image;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("serial")
public class UploadPhoto extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)

	throws ServletException, IOException {

		String savePath = this.getServletConfig().getServletContext()
				.getRealPath("");

		savePath = savePath + "\\images\\photo\\";

		File f1 = new File(savePath);

		if (!f1.exists()) {

			f1.mkdirs();

		}

		DiskFileItemFactory fac = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(fac);

		upload.setHeaderEncoding("utf-8");

		List fileList = null;

		try {

			fileList = upload.parseRequest(request);

		} catch (FileUploadException ex) {

			return;

		}

		Iterator<FileItem> it = fileList.iterator();

		String name = "";

		String extName = "";

		while (it.hasNext()) {

			FileItem item = it.next();

			if (!item.isFormField()) {

				name = item.getName();

				long size = item.getSize();

				String type = item.getContentType();

				System.out.println(size + " " + type);

				if (name == null || name.trim().equals("")) {

					continue;

				}

				// get ext

				if (name.lastIndexOf(".") >= 0) {

					extName = name.substring(name.lastIndexOf("."));

				}

				File file = null;

				do {

					// file name

					name = UUID.randomUUID().toString();

					file = new File(savePath + name + extName);

				} while (file.exists());

				File saveFile = new File(savePath + name + extName);

				try {

					item.write(saveFile);

				} catch (Exception e) {

					e.printStackTrace();

				}

			}

		}

		String url = savePath + name + extName;
		
		Image image = new Image(url);

		double[] gpsInit = image.getGPSCoordinate();

		Vector<Double> gpsLat = new Vector<Double>();
		
		Vector<Double> gpsLng = new Vector<Double>();

		if (gpsInit != null && gpsInit.length > 0) {
			
			gpsLat.add(gpsInit[1]);
			
			gpsLng.add(gpsInit[0]);
			
			// System.out.println("Lat: " + gpsInit[1]);
			
			// System.out.println("Long: " + gpsInit[0]);
			
		} else {
			
			gpsInit = new double[2];
			
			gpsInit[0] = 0;
			
			gpsInit[1] = 0;
			
			// System.out.println("GPS is empty");
		}

		String path = request.getContextPath();
		
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";

		String showPath = basePath + "images/photo/" + name + extName;

		response.getWriter().print(
				showPath + "^" + gpsInit[1] + "^" + gpsInit[0]);

	}

}