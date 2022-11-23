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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center" >Data User</h1>
        <div class="container">
            <%
                String resp = request.getParameter("res");
                //Berhasil Ubah Data
                if (resp != null) {
                    if (resp.equals("Berhasil Tambah Data")) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Berhasil Tambah Data
                <a href="/JavaWebAppJDBC/index.jsp" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></a>
            </div>
            <%
            } else if (resp.equals("Berhasil Ubah Data")) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Berhasil Ubah Data
                <a href="/JavaWebAppJDBC/index.jsp" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></a>
            </div>
            <%
            } else if (resp.equals("Berhasil Hapus Data")) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Berhasil Hapus Data
                <a href="/JavaWebAppJDBC/index.jsp" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></a>
            </div>
            <%
            } else if (resp.equals("Gagal Tambah Data")) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Gagal Tambah Data
                <a href="/JavaWebAppJDBC/index.jsp" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></a>
            </div> 
            <%
                    }
                }
            %>


            <%
                try {
                    DAO.UserDAO dao = new DAO.UserDAO();
                    List<User> list = dao.readAll();
                    out.print("<form action='form_user.jsp' method='post'>"
                            + "<input type='hidden' name='action' value='insert'/>"
                            + "<input class='btn btn-primary' type='submit' value='Tambah Data'/></form>");
                    out.print("<table class='table table-hover' >");
                    out.print("<tr><td width=100px><strong>ID</strong>");
                    out.print("</td><td width=200px><strong>Nama</strong>");
                    out.print("</td><td width=300px><strong>Alamat</strong>");
                    out.print("</td><td width=300px><strong>Ubah</strong>");
                    out.print("</td><td width=300px><strong>Delete</strong>");
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
                        out.print("</td><td>");
                        out.print("<form action='form_user.jsp' method='post'>"
                                + "<input type='hidden' name='action' value='edit'/>"
                                + "<input type='hidden' name='id' value='" + i + "'/>"
                                + "<input class='btn btn-warning' type='submit' value='Ubah'/></form>");
                        out.print("</td><td><form action='UserService' method='post'>"
                                + "<input type='hidden' name='id' value='" + i + "'/>"
                                + "<input type='hidden' name='action' value='delete'/>");
            %>
            <input onclick="return confirm('apakah anda yakin ingin menghapus <%= n%> ');" class='btn btn-danger' type='submit' value='Hapus'/>
            <%
                        out.print("</form></td></tr>");
                    }
                    out.print("</table>");
                } catch (Exception e) {
                    e.printStackTrace(new java.io.PrintWriter(out));
                }
            %>
        </div>
    </body>
</html>
