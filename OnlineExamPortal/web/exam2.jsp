<%@ page import="java.sql.*, java.util.*, model.Question " %>
<%
    String examName = "exam2"; 
    List<Question> questions = new ArrayList<>();
    Map<Integer, String> userAnswers = (Map<Integer, String>) request.getAttribute("userAnswers");
    Map<Integer, String> correctAnswers = new HashMap<>();

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
            q.setCorrectOption(rs.getString("correct_option"));
            questions.add(q);
            correctAnswers.put(q.getId(), rs.getString("correct_option"));
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }

    // Safety method to prevent HTML injection
    %><%! 
        public String safe(String text) {
            if (text == null) return "";
            return text.replace("&", "&amp;")
                       .replace("<", "&lt;")
                       .replace(">", "&gt;")
                       .replace("\"", "&quot;");
        }
    %>
<html>
<head>
    <title>Exam 2 - JavaScript</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #f3f9ff, #e6f0fa);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .exam-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 30px;
        }
        .question-block {
            margin-bottom: 25px;
            padding: 20px;
            border: 1px solid #e3e3e3;
            border-radius: 10px;
            background-color: #f9fbff;
        }
        .question-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: #002244;
        }
        label {
            display: block;
            padding: 8px 12px;
            border-radius: 6px;
            transition: 0.2s ease;
        }
        label:hover {
            background-color: #e8f0fe;
            cursor: pointer;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        .submit-button {
            display: block;
            margin: 30px auto;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
            transition: background-color 0.3s;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="exam-container">
    <h2>Exam 2 - JavaScript</h2>
    <%
     if (request.getAttribute("score") != null) { %>
            <h2 style="color:green;"><%= request.getAttribute("score") %></h2>
        <% }
    %>
    <form action="calculatemarks" method="post">
        <input type="hidden" name="exam" value="<%= examName %>">
        <%
            int index = 1;
            for (Question q : questions) {
                int qid = q.getId();
                String correct = correctAnswers.get(qid);
                String userAns = userAnswers != null ? userAnswers.get(qid) : "";
                boolean isCorrect = userAns != null && userAns.equals(correct);
        %>
        <div class="question-block" style="background-color: <%= userAnswers != null ? (isCorrect ? "#d4edda" : "#f8d7da") : "#f9fbff" %>;">
            <div class="question-title">Q<%= index++ %>. <%= safe(q.getQuestion()) %></div>

            <label style="<%= (userAnswers != null && userAns.equals("A") && !isCorrect) ? "color:red;" : "" %>">
                <input type="radio" name="q<%= qid %>" value="A"
                    <%= userAns.equals("A") ? "checked" : "" %>
                    <%= userAnswers != null ? "disabled" : "" %>> <%= safe(q.getOptionA()) %>
            </label>
            <label style="<%= (userAnswers != null && userAns.equals("B") && !isCorrect) ? "color:red;" : "" %>">
                <input type="radio" name="q<%= qid %>" value="B"
                    <%= userAns.equals("B") ? "checked" : "" %>
                    <%= userAnswers != null ? "disabled" : "" %>> <%= safe(q.getOptionB()) %>
            </label>
            <label style="<%= (userAnswers != null && userAns.equals("C") && !isCorrect) ? "color:red;" : "" %>">
                <input type="radio" name="q<%= qid %>" value="C"
                    <%= userAns.equals("C") ? "checked" : "" %>
                    <%= userAnswers != null ? "disabled" : "" %>> <%= safe(q.getOptionC()) %>
            </label>
            <label style="<%= (userAnswers != null && userAns.equals("D") && !isCorrect) ? "color:red;" : "" %>">
                <input type="radio" name="q<%= qid %>" value="D"
                    <%= userAns.equals("D") ? "checked" : "" %>
                    <%= userAnswers != null ? "disabled" : "" %>> <%= safe(q.getOptionD()) %>
            </label>

            <% if (userAnswers != null && !isCorrect && userAns != null) { %>
                <p style="color:green;"><b>Correct Answer: <%= correct %></b></p>
            <% } %>
        </div>
        <% } %>

        <% if (userAnswers == null) { %>
            <button type="submit" class="submit-button">Submit Exam</button>
        <% } %>
    </form>
</div>
</body>
</html>
