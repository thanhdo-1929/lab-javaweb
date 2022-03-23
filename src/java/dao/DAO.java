/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.TimeTable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import entity.Class;
import entity.Room;
import entity.Slot;

/**
 *
 * @author Hùng
 */
public class DAO {

    Connection conn = null;
    PreparedStatement pre = null;
    ResultSet rs = null;
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    public int checkExistTeacher(String teacher) {
        try {
            String sql = "select * from Teacher where teacherName = ?";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, teacher);
            rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Loi checkExistTeacher " + e.getMessage());
        }
        return -1;
    }

    public boolean checkRoom(String date, String room, String slot) {
        try {
            String sql = "select * from Timetable where date=? and slotID=? and roomID = ?";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, date);
            pre.setString(2, slot);
            pre.setString(3, room);
            rs = pre.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Loi checkRoom" + e.getMessage());
        }
        return true;
    }

    public boolean checkTeacherTeach(String date, int teacherID, String slot) {
        try {
            String sql = "select * from Timetable where date=? and slotID=? and teacherID = ?";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, date);
            pre.setString(2, slot);
            pre.setInt(3, teacherID);
            rs = pre.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Loi checkTeacherTeach " + e.getMessage());
        }
        return true;
    }

    public void insertTimeTable(String date, int slotID, int classID, int teacherID, int roomID) {
        try {
            String sql = "insert into Timetable values (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, date);
            pre.setInt(2, slotID);
            pre.setInt(3, classID);
            pre.setInt(4, teacherID);
            pre.setInt(5, roomID);
            pre.execute();
        } catch (Exception e) {
            System.out.println("Loi insertTimeTable "+e.getMessage());
        }
    }

    public List<TimeTable> getListTimetable(String from, String to) {
        List<TimeTable> list = new ArrayList<>();
        try {
            String sql = "select a.date,a.slotID,b.time,c.className,d.teacherName,e.RoomName from Timetable a \n"
                    + "join Slot b on a.slotID = b.slotID \n"
                    + "join Class c on a.classID = c.classID\n"
                    + "join Teacher d  on a.teacherID = d.teacherID\n"
                    + "join Room e   on a.roomID = e.roomID\n"
                    + "where a.date between ? and ? order by a.date ";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, from);
            pre.setString(2, to);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TimeTable(
                        sdf.format(rs.getDate(1)),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }

        } catch (Exception e) {
            System.out.println("Loi listTimetable " + e.getMessage());
        }
        return list;
    }

    public List<Class> getAllClass() {
        List<Class> list = new ArrayList<>();
        try {
            String sql = "Select * from Class";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Class(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Loi getAllClass " + e.getMessage());
        }
        return list;
    }

    public List<Room> getAllRoom() {
        List<Room> list = new ArrayList<>();
        try {
            String sql = "Select * from Room";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Room(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Loi getAllRoom " + e.getMessage());
        }
        return list;
    }

    public List<Slot> getAllSlot() {
        List<Slot> list = new ArrayList<>();
        try {
            String sql = "Select * from Slot";
            conn = new DBContext().getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Slot(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("Loi getAllSlot " + e.getMessage());
        }
        return list;
    }

}
