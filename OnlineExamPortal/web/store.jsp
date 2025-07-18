<!-- <%@ page import="java.sql.*, java.util.*, model.Question " %>
<%
    String examName = "exam1"; // fixed for this JSP
    List<Question> questions = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ExamPortal", "root", "mkjyoti05");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM questions WHERE exam_name=? LIMIT 10");
        ps.setString(1, examName);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Question q = new Question();
            q.setId(rs.getInt("id"));
            q.setQuestion(rs.getString("question"));
            q.setOptionA(rs.getString("option_a"));
            q.setOptionB(rs.getString("option_b"));
            q.setOptionC(rs.getString("option_c"));
            q.setOptionD(rs.getString("option_d"));
            q.setCorrectOption(rs.getString("correct_option")); // Optional
            questions.add(q);
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<html>
<head><title>Exam 1 - Java</title></head>
<style>
    body {
    background: linear-gradient(to right, #e0f7fa, #fefefe);
    font-family: 'Poppins', sans-serif;
    margin: 20px;
}

.exam-container {
    max-width: 750px;
    margin: auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

.question-block {
    background: #f5f9ff;
    padding: 15px 20px;
    margin-bottom: 20px;
    border-left: 5px solid #2196f3;
    border-radius: 10px;
}

.question-block h4 {
    margin-bottom: 10px;
    color: #0d47a1;
}

label {
    display: block;
    margin: 8px 0;
    cursor: pointer;
    transition: all 0.2s ease;
}

input[type="radio"] {
    margin-right: 10px;
}

label:hover {
    color: #0d47a1;
    transform: translateX(5px);
}

</style>
<body>
    <div class="exam-container">
<h2>Exam 1 - Java</h2>

<form action="SubmitExamServlet" method="post">
    <input type="hidden" name="exam" value="<%= examName %>">
    <%
        int index = 1;
        for (Question q : questions) {
    %>
    
        <p><b>Q<%= index++ %>. <%= q.getQuestion() %></b></p>
        <div class="question-block">
            <label><input type="radio" name="q<%= q.getId() %>" value="A" required> <%= q.getOptionA() %></label> <br>
            <label><input type="radio" name="q<%= q.getId() %>" value="B"> <%= q.getOptionB() %></label><br>
            <label><input type="radio" name="q<%= q.getId() %>" value="C"> <%= q.getOptionC() %></label> <br>
            <label><input type="radio" name="q<%= q.getId() %>" value="D"> <%= q.getOptionD() %></label> <br>
        </div>
      
    <%
        }
    %>
    </div>
    <input type="submit" value="Submit Exam">
</form>
</body>
</html> -->