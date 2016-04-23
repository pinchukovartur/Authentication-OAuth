<%@ page import="service.DAO.Student" %>
<%@ page import="service.DAO.DAO" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>

<%@page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>Search Student</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("ID"));
        DAO dao = new DAO();
        Student student = dao.searchStudentById(id);
    %>
    ID Student: <%=id%>
    Name: <%=student.getName()%>
    Surname: <%=student.getSurname()%>
    Group: <%=student.getGroup()%>
    Score: <%=student.getScore()%>

    <form action ="index.jsp" method="GET">
        <input type="submit" name="MainWindow" value="MainWindow">
    </form>
    <% String token = null;
        try {
            String g = "http://oauth.vk.com/authorize?client_id=5428090&redirect_uri=http://localhost:8080/&response_type=token";
            URL u = new URL(g);
            URLConnection c = u.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream()));
            String inputLine;
            StringBuffer b = new StringBuffer();
            while ((inputLine = in.readLine()) != null)
                b.append(inputLine + "\n");
            in.close();
            token = b.toString();
            System.out.println(token);
        } catch (Exception e) {
        }
    %>
   Token: <%=token%>
</body>
</html>
