
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.sql.*;

@WebServlet("/calculatemarks")
public class calculatemarks extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String exam = request.getParameter("exam");
        int score = 0;
        Map<Integer, String> userAnswers = new HashMap<>();
        Map<Integer, String> correctAnswers = new HashMap<>();

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ExamPortal", "root", "mkjyoti05");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, correct_option FROM questions WHERE exam_name='" + exam + "'");

            while (rs.next()) {
                int qid = rs.getInt("id");
                String correct = rs.getString("correct_option");
                correctAnswers.put(qid, correct); // Save correct answers

                String userAnswer = request.getParameter("q" + qid); // From form input
                userAnswers.put(qid, userAnswer); // Save user answers

                if (correct.equalsIgnoreCase(userAnswer)) {
                    score++;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        String redirect = exam + ".jsp";
        String res = "Your score is: " + score;
        request.setAttribute("score", res);
        request.setAttribute("userAnswers", userAnswers);
        request.setAttribute("correctAnswers", correctAnswers);

        request.getRequestDispatcher(redirect).forward(request, response);
    }
}
