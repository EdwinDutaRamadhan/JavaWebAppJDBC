<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="DAO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Data User</h1>
        <%
            try {
                DAO.UserDAO dao = new DAO.UserDAO();
                List<User> list =  dao.readAll();
                out.print("<form action='form_user.jsp' method='post'>"
                        + "<input type='hidden' name='action' value='insert'/>"
                        + "<input type='submit' value='Tambah Data'/></form>");
                out.print("<table>");
                out.print("<tr><td width=100px><strong>ID</strong>");
                out.print("</td><td width=200px><strong>Nama</strong>");
                out.print("</td><td width=300px><strong>Alamat</strong>");
                out.print("</td><td width=300px><strong>Olah Data</strong>");
                out.print("</td></tr>");
                for (User u : list) {
                    String i = u.getId();
                    String n = u.getNama();
                    String a = u.getAlamat();
                    out.print("<tr><td>");
                    out.print(i);
                    out.print("</td><td>");
                    out.print(n);
                    out.print("</td><td>");
                    out.print(a);
                    out.print("</td><td nowrap>");
                    out.print("<form action='form_user.jsp' method='post'>"
                            + "<input type='hidden' name='action' value='edit'/>"
                            + "<input type='hidden' name='id' value='"+i+"'/>"
                            + "<input type='submit' value='Ubah'/></form>");
                    out.print("<form action='UserService' method='post'>"
                            + "<input type='hidden' name='id' value='"+i+"'/>"
                            + "<input type='hidden' name='action' value='delete'/>"
                            + "<input type='submit' value='Hapus'/></form>");
                    out.print("</td></tr>");
                }
                out.print("</table>");
            } catch (Exception e){
                e.printStackTrace(new java.io.PrintWriter(out));
            } 
        %>
    </body>
</html>
