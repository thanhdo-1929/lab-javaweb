/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import entity.Gallery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GalleryDAO {

    public List<Gallery> getListTop3Menu() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Gallery> listGallery = new ArrayList<>();
        try {
            String query = "select TOP 3 * from Gallery order by id asc";
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery(rs.getInt("id"),
                        rs.getString("name"),
                        db.getResource() + rs.getString("pictureCover"),
                        rs.getString("description")
                );
                listGallery.add(gallery);
            }

        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return listGallery;
    }

    public Gallery getGalleryById(int id) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select * from Gallery where id = ?";
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery(rs.getInt("id"),
                        rs.getString("name"),
                        db.getResource() + rs.getString("pictureCover"),
                        rs.getString("description")
                );
                return gallery;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
        return null;
    }

}
