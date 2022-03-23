package dao.impl;

import context.DBContext;
import dao.AnswerDAO;
import entity.Answer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAOImpl extends DBContext implements AnswerDAO{
    
    /**
     * Get list answer from answer table in database. All the answer matched 
      */
    @Override
    public List<Answer> getAnswerByQuestionId(int quesId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Answer> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [answer] where questionId = ?";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, quesId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Answer aswer = new Answer();
                aswer.setId(rs.getInt("id"));
                aswer.setQuestionId(rs.getInt("questionId"));
                aswer.setAnswer(rs.getString("answer"));
                aswer.setIsTrue(rs.getBoolean("isTrue"));
                list.add(aswer);
            }
            return list;      
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
    }
    /**
     * Get answer from answer table in database. All answer has id matched with 
     */
    @Override
    public Answer getAnswerById(int answerId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from answer where id = ?";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, answerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Answer answer = new Answer();
                answer.setId(rs.getInt("id"));
                answer.setQuestionId(rs.getInt("questionId"));
                answer.setAnswer(rs.getString("answer"));
                answer.setIsTrue(rs.getBoolean("isTrue"));
                return answer;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return null;
    }
   
    /**
     * Get total of true answer from answer table in database. Number of true 
     * answer matched with questionId will be return. The result contain an int number
     */
    @Override
    public int getTotalTrueAnswerByQuestionId(int questionId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Answer> list = new ArrayList<>();
        int count = 0;
        try {
            String sql = "select count (*) from answer where questionId = ? and isTrue = 1";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return count;
    }
    
    
}
