        <%@ page import="service.DAO.DAO" %>
<%@ page import="service.DAO.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="authentication.FaceBook" %>
        <%@ page import="java.net.URL" %>
        <%@ page import="java.net.URLConnection" %>
        <%@ page import="java.io.BufferedReader" %>
        <%@ page import="java.io.InputStreamReader" %>
        <%@ page import="org.json.JSONObject" %>

        <%@page language="java" contentType="text/html; utf-8" pageEncoding="utf-8" %>

<html>
    <body>
            <form action ="search.jsp" method="GET">
                ID: <input type="number" name="ID" style="width:50px" min="1" max="100" REQUIRED>
                <input type="submit" name="Search" value="Search by ID">
            </form>
        <form action ="delete.jsp" method="GET">
            ID: <input type="number" name="ID" style="width:50px" min="1" max="100" REQUIRED>
            <input type="submit" name="Delete" value="Delete by ID">
        </form>
        <form action ="update.jsp" method="GET">
            ID: <input type="number" name="ID" style="width:50px" min="1" max="100" REQUIRED>
            Name: <input type="text" name="name" style="width:50px" maxlength="10" REQUIRED>
            Surname: <input type="text" name="surname" style="width:50px" maxlength="10" REQUIRED>
            Score: <input type="number" name="score" style="width:50px" min="1" max="10" REQUIRED>
            Group: <input type="number" name="group" style="width:50px"min="1" max="999999" REQUIRED>
            <input type="submit" name="Update" value="Update by ID">
        </form>
        <form action ="add.jsp" method="GET">
            Name: <input type="text" name="name" style="width:50px" maxlength="10" REQUIRED>
            Surname: <input type="text" name="surname" style="width:50px" maxlength="10" REQUIRED>
            Score: <input type="number" name="score" style="width:50px" min="1" max="100" REQUIRED>
            Group: <input type="number" name="group" size="5" style="width:50px"min="1" max="999999" REQUIRED>
            <input type="submit" name="Update" value="Add new student">
        </form>
            <form action ="vk.jsp" method="GET">
                <input type="submit" name="VK" value="VK">
            </form>

        <table border="1">
            <caption>TABLE STUDENTS</caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Group</th>
                <th>Score</th>
            </tr>
        <%  DAO dao = new DAO();
            List<Student> students = dao.getAllStudent(); %>
            <%for (int i = 0; i < students.size(); i++) {%>
            <tr><td><%=students.get(i).getIdStudent()%></td>
                <td><%=students.get(i).getName()%></td>
                <td><%=students.get(i).getSurname()%></td>
                <td><%=students.get(i).getGroup()%></td>
                <td><%=students.get(i).getScore()%></td>
            </tr>
        <%} %>
        </table>
            <% FaceBook oAuth = new FaceBook();
                String faceURL = "https://www.facebook.com/dialog/oauth?client_id=" + oAuth.getIDApp()
                        + "&redirect_uri=" + oAuth.getURLApp() + "&response_type=code";%>

            <a href= <%=faceURL%> >Войти через FACEBOOK</a>

        <%HttpServletRequest httpServletRequest = (HttpServletRequest) request;
            String code = httpServletRequest.getParameter("code");
            FaceBook faceBook = null;
            String facebookId;
            String firstName;
            String middleNames;
            String lastName;
            String email=null;
            if (code != null) {
                String faceURL2 = "https://graph.facebook.com/oauth/access_token?client_id=" + oAuth.getIDApp() +
                        "&redirect_uri=" + oAuth.getURLApp() + "&client_secret=" + oAuth.getSecretApp() +
                        "&code=" + code;
                String token = null;
                try {
                    URL u = new URL(faceURL2);
                    URLConnection c = u.openConnection();
                    BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream()));
                    String inputLine;
                    StringBuffer b = new StringBuffer();
                    while ((inputLine = in.readLine()) != null)
                        b.append(inputLine + "\n");
                    in.close();
                    token = b.toString();
                    if (token.startsWith("{"))
                        throw new Exception("error on requesting token: " + token + " with code: " + code);
                } catch (Exception e) {
                }

                String faceURL3 = "https://graph.facebook.com/me?" + token;
                String message = null;
                try {
                    URL u = new URL(faceURL3);
                    URLConnection c = u.openConnection();
                    BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream()));
                    String inputLine;
                    StringBuffer b = new StringBuffer();
                    while ((inputLine = in.readLine()) != null)
                        b.append(inputLine + "\n");
                    in.close();
                    message = b.toString();
                    if (token.startsWith("{"))
                        throw new Exception("error on requesting token: " + token + " with code: " + code);
                } catch (Exception e) {
                }%>
              <%=message%>
            <%}
            %>
    </body>
</html>
