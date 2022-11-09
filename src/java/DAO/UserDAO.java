/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class UserDAO {
    private Connection koneksi = null;
    public UserDAO() {
        this.koneksi = Koneksi.getConnection();
    }
    
    public User readOne(String id){
        User user = null;
        try {
            PreparedStatement ps = koneksi.prepareStatement("SELECT * FROM user WHERE id = '" + id + "'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                user = new User();
                user.setId(rs.getString(1));
                user.setNama(rs.getString(2));
                user.setAlamat(rs.getString(3));
                
            }
            rs.close();
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
    public List<User> readAll(){
        List<User> list = new ArrayList<User>();
        
        try {
            PreparedStatement ps = koneksi.prepareStatement("SELECT * FROM user");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getString(1));
                user.setNama(rs.getString(2));
                user.setAlamat(rs.getString(3));
                list.add(user);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    public int insertOne(User user){
        try {
            PreparedStatement ps = koneksi.prepareStatement("INSERT INTO user VALUES (?,?,?)");
            ps.setString(1, user.getId());
            ps.setString(2, user.getNama());
            ps.setString(3, user.getAlamat());
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    public int deleteOne(String id){
        try {
            PreparedStatement ps = koneksi.prepareStatement("DELETE FROM user WHERE id=?");
            ps.setString(1, id);
            int i = ps.executeUpdate();
            ps.close();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        
    }
    
    public int updateOne(User user){
        try {
            PreparedStatement ps = koneksi.prepareStatement("UPDATE user SET nama=?, alamat=? WHERE id=?");
            ps.setString(1, user.getNama());
            ps.setString(2, user.getAlamat());
            ps.setString(3, user.getId());
            int i = ps.executeUpdate();
            ps.close();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
}
