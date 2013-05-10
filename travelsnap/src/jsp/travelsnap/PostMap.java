package jsp.travelsnap;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PostMap", urlPatterns = { "/map.view" }, loadOnStartup = 1)
public class PostMap extends HttpServlet {

	private static final long serialVersionUID = -4182478950855246158L;

	public PostMap() {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String user = req.getParameter("user");
		System.out.println("User: " + user);

		post p = new post();
		p.setUserName(user);
		ResultSet rs = p.postlist();

		Vector<Integer> postIds = new Vector<Integer>();
		try {
			while (rs.next()) {
				int id = rs.getInt("postid");
				System.out.println("Post ID: " + id);
				postIds.add(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		Vector<Double> gpsLat = new Vector<Double>();
		Vector<Double> gpsLng = new Vector<Double>();
		for (int postId : postIds) {
			p.getPostLocations(postId);

			System.out.format("Post Location: %d - %.3f %.3f", postId,
					p.getLat(), p.getLng());

			gpsLat.add(p.getLat());
			gpsLng.add(p.getLng());
		}

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Post Map</title>");
		out.println("<script type=\"text/javascript\" src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyCMDuFRouHd0k5SVf8Q46gr7iBjZRf52Tg&sensor=false\">");
		out.println("</script>");
		out.println("<script type=\"text/javascript\">");
		out.println("  function initialize() {");
		out.println("   var locations = [");
		double lat = 0;
		double lng = 0;
		if (gpsLat.size() > 0) {
			for (int l = 0; l < gpsLat.size(); l++) {
				if (gpsLat.get(l) != 0 && gpsLng.get(l) != 0) {
					out.println(String.format("['', %.3f, %.3f],",
							gpsLat.get(l), gpsLng.get(l)));
				}
			}
		} else {

			// out.println("['Hong Kong', 22.303857, 114.180468]");
			// // TW 25.081868 121.512222
			// lat = 22.303857;
			// lng = 114.180468;

			lat = 0;
			lng = 0;
		}
		out.println("    ];");
		out.println("    var mapOptions = {");
		out.println("      center: new google.maps.LatLng(" + lat + ", " + lng
				+ "),");
		out.println("      zoom: 1,");
		out.println("      mapTypeId: google.maps.MapTypeId.ROADMAP");
		out.println("    };");
		out.println("    var map = new google.maps.Map(document.getElementById(\"map-canvas\"), mapOptions);");

		out.println("    for (i = 0; i < locations.length; i++) {");
		out.println("      var marker = new google.maps.Marker({");
		out.println("             position: new google.maps.LatLng(locations[i][1], locations[i][2]),");
		out.println("             map: map,");
		out.println("             title:locations[i][0]");
		out.println("      });");
		out.println("    }");
		out.println("  }");
		out.println("  google.maps.event.addDomListener(window, 'load', initialize);");
		out.println("</script>");
		out.println("</head>");

		out.println("<body onload=\"initialize()\">");

		// out.println("<h1>GPS info</h1>");
		// out.println("<img src=\"/travelsnap/images/photo/image.jpg\" width=\"400px\" height=\"300px\" /><br/>");
		// if (gpsInit.length > 0) {
		// out.println("Lat: " + gpsInit[1] + "<br/>");
		// out.println("Long: " + gpsInit[0] + "<br/>");
		// } else {
		// out.println("GPS is empty");
		// }

		out.println("<div id=\"map-canvas\"/ style=\"width: 430px; height: 430px\">");

		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
