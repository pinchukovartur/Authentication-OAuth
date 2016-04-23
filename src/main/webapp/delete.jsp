<%@ page import="service.DAO.DAO" %>

<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Delete Student</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("ID"));
        DAO dao = new DAO();
        dao.deleteStudentById(id);
    %>
    Student with id = <%=id%> was delete!

    <form action ="index.jsp" method="GET">
        <input type="submit" name="MainWindow" value="MainWindow">
    </form>
</body>
</html>
