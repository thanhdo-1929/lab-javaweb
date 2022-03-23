package dao.impl;

import context.DBContext;
import dao.ResultDAO;
import entity.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * This class has methods for retrieving data from Result tables in database.
 * The method will return an object of the class <code> java.lang.Exception</code>
 * when there is any error querying the data.
 */
public class ResultDAOImpl extends DBContext implements ResultDAO{
    
    /**
     * Insert result object into Result table. After taking the quiz, the 
     * results will be saved in Resutl table in database.

     */
    @Override
    public void addResult (Result result) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "insert into resultTest(uId, mark, startTime, "
                    + "endTime, isPassed) values(?, ?, ?, ?, ?)";           
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setObject(1, result.getUserID());
            ps.setObject(2, result.getMark());
            ps.setObject(3, new java.sql.Timestamp(result.getStart().getTime()));            
            ps.setObject(4, new java.sql.Timestamp(result.getEnd().getTime()));
            ps.setObject(5, result.isPassed());
            ps.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
    }
  
}
