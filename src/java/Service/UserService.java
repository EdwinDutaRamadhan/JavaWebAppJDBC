/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import DAO.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author HP
 */
public class UserService extends javax.servlet.http.HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        String id = request.getParameter("id");
        String n = request.getParameter("nama");
        String a = request.getParameter("alamat");
        String resp="";
        if (request.getParameter("action").equals("insert")){
            user.setId(id);
            user.setNama(n);
            user.setAlamat(a);
            int r = new DAO.UserDAO().insertOne(user);
            resp=(r>0)?"Berhasil Tambah Data":"Gagal Tambah Data";
        }
        else if (request.getParameter("action").equals("update")){
            user.setId(id);
            user.setNama(n);
            user.setAlamat(a);
            int r = new DAO.UserDAO().updateOne(user);
            resp=(r>0)?"Berhasil Ubah Data":"Gagal Ubah Data";
        }
        else if (request.getParameter("action").equals("delete")){
            int r = new DAO.UserDAO().deleteOne(id);
            resp=(r>0)?"Berhasil Hapus Data":"Gagal Hapus Data";
        }        
        response.sendRedirect("index.jsp?res="+resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
