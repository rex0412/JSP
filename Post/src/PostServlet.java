

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>get Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println(" <h2>");
		out.println("name : [" + name + "] ");
		out.println(" </h2><br/>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>get Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println(" <h2>");
		out.println("name : [" + name + "] ");
		out.println(" </h2><br/>");
		out.println("</body>");
		out.println("</html>");
	}

}
