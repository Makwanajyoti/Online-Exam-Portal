import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/login_s"})
public class login_s extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String password=null;
        try {
           String username = request.getParameter("username");    
           String Password = request.getParameter("password");          

          HttpSession session = request.getSession();
          session.setAttribute("user", username);  // or user ID, name etc.

          Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/examPortal";
          String user ="root";
          String pass= "mkjyoti05";
          Connection conn = DriverManager.getConnection(url,user,pass);
          Statement st=conn.createStatement();
          String sql="select password from user where username='"+username+"'";
          ResultSet rs=st.executeQuery(sql);
          while(rs.next()){
              password=rs.getString("password");
          }
          if(password.equals(Password)){
               request.getRequestDispatcher("home.jsp").forward(request, response);
          }
          else {
       request.setAttribute("errorMsg", "you entered wrong password !");
      request.getRequestDispatcher("login.jsp").forward(request, response);
          }
        }
        catch(Exception e){
       request.setAttribute("errorMsg", "User not registered. Please register first.");
      request.getRequestDispatcher("login.jsp").forward(request, response);
    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
