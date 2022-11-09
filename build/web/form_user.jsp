<%@page import="DAO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Olah Data</h1>
        <% User u = null;
            if (request.getParameter("action").toString().equalsIgnoreCase("edit")) {
            String id = request.getParameter("id");
            u = new DAO.UserDAO().readOne(id);        
        %>
            <form method="post" action="UserService">
            <input type="hidden" name="action" value="update"/><br/>
        <% } else if (request.getParameter("action").toString().equalsIgnoreCase("insert")) { %>
            <form method="post" action="UserService">
            <input type="hidden" name="action" value="insert"/><br/>
        <% } %>
        <%
            if (u==null) 
                out.write("ID : <input name='id' type='text'/><br/>");
            else {
                out.write("ID : "+ u.getId() + "<br/>");
                out.write("<input name='id' type='hidden' value='"+u.getId()+"'/>");
            }
        %>
            Nama : <input type="text" name="nama" <% if (u!=null) out.write("value='"+u.getNama()+"'"); %>/><br/>
            Alamat : <input type="text" name="alamat" <% if (u!=null) out.write("value='"+u.getAlamat()+"'"); %>><br/>
            <input type="submit" value="Simpan"/>
        </form>
    </body>
</html>
