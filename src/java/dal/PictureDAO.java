/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import entity.Picture;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PictureDAO {

    public List<Picture> getPictures(int idGallery) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List<Picture> list = new ArrayList<>();
            String query = "select p.id, p.picture \n"
                    + "from Gallery_Picture gp, Gallery g, Picture p \n"
                    + "where gp.galleryId = g.id and gp.pictureId = p.id and g.id = ?";
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idGallery);
            rs = ps.executeQuery();
            while (rs.next()) {
                Picture p = new Picture(rs.getInt("id"),
                        db.getResource() + rs.getString("picture"));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }

    public int countPicture(int idGallery) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select COUNT(p.id) \n"
                    + "from Gallery_Picture gp,Gallery g,Picture p\n"
                    + "where gp.galleryId = g.id and gp.pictureId = p.id and g.id = ?";
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idGallery);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }

    public List<Picture> getListPicture(int id, int pageIndex, int pageSize) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List<Picture> list = new ArrayList<>();
            String query = "select *from(\n"
                    + "select ROW_NUMBER() over(order by p.id asc) as rn,p.id,p.picture \n"
                    + "from Gallery_Picture gp,Gallery g,Picture p\n"
                    + "where gp.galleryId = g.id and gp.pictureId = p.id and g.id = ?) as x\n"
                    + "where rn >=(?-1)*?+1 and rn<=?*?";
            conn = db.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageIndex);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Picture k = new Picture(rs.getInt("id"),
                        db.getResource() + rs.getString("picture"));
                list.add(k);

                //  list.add(d);
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, conn);
        }
    }
}
