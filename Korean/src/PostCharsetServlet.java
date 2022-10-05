

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KoreanServlet
 */
@WebServlet("/KoreanServlet")
public class PostCharsetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostCharsetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>post Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println(" <h2>");
		out.println(" 입력된 이름 : " + name);
		out.println(" </h2><br/>");
		out.println("</body>");
		out.println("</html>");
	}

}
