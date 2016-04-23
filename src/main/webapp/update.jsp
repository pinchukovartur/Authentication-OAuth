<%@ page import="service.DAO.Student" %>
<%@ page import="service.DAO.DAO" %>

<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Search Student</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("ID"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        int score = Integer.parseInt(request.getParameter("score"));
        int group = Integer.parseInt(request.getParameter("group"));
        Student student = new Student();
        student.setIdStudent(id);
        student.setName(name);
        student.setSurname(surname);
        student.setScore(score);
        student.setGroup(group);
        DAO dao = new DAO();
        dao.updateStudentById(student);
    %>
    Student with id = <%=id%> was updated!

    <form action ="index.jsp" method="GET">
        <input type="submit" name="MainWindow" value="MainWindow">
    </form>
</body>
</html>
