package dao.impl;

import context.DBContext;
import dao.QuestionDAO;
import entity.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * This class has methods for add and retrieving data from Question tables in
 * database. The method will return an object of the class
 * <code> java.lang.Exception</code> when there is any error querying the data.
 * <p>
 * Bugs: None
 */
public class QuestionDAOImpl extends DBContext implements QuestionDAO {

    /**
     * Insert data of question object and answer object into question table and 
     * answer table.
     * 
     *
     */
    @Override
    public void addQuestionAndAnswer(String question, String[] listAnswers,
            List<Integer> listPositionOfTrueAnswer) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        try {
            String sqlAddquestion = "insert into [question]([question], [dateCreate]) values(?, GETDATE())";
            conn = getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(sqlAddquestion, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, question);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            while (rs.next()) {
                id = rs.getInt(1);
            }
            String sqlAddAnswer = "insert into answer([questionId], answer, isTrue) "
                    + "values(?, ?, ?)";
            ps = conn.prepareStatement(sqlAddAnswer);
            for (int i = 0; i < listAnswers.length; i++) {
                ps.setInt(1, id);
                ps.setString(2, listAnswers[i].trim());
                if (listPositionOfTrueAnswer.contains(i)) {
                    ps.setBoolean(3, true);

                } else {
                    ps.setBoolean(3, false);
                }
                ps.executeUpdate();
            }
            conn.commit();
        } catch (Exception ex) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e2) {
                    throw e2;
                }
            }
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
    }

    /**
     * Get list question to paging from question table in database. All the
     * question matched with id order ascending, between param from and to will
     * be returned. The result contains a list of <code>entity.Question</code>
     * objects with id, question, dateCreate, list <code>entity.Answer</code>
     *
     */
    @Override
    public List<Question> getQuestion(int pageIndex, int pageSize) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ( SELECT ROW_NUMBER()OVER(ORDER BY id) "
                    + "as Number,* FROM question) as DataSearch where Number "
                    + "between ((? - 1)*? + 1) and ? * ?";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageIndex);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("id"));
                question.setQuestion(rs.getString("question"));
                question.setDateCreate(rs.getDate("dateCreate"));
                list.add(question);
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
     * Get number of question from question table in database. Number of
     * question will be return. The result contain an int number

     */
    @Override
    public int getTotalQuestion() throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(id) as total FROM question";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
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

    /**
     * Get list random question from question table in database. All the
     * question have id in top totalQuestion order by NEWID() will be returned.
     */
    @Override
    public List<Question> getRandomQuestion(int totalOfQuestion) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP (?) * FROM [question] ORDER BY NEWID()";
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, totalOfQuestion);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("id"));
                question.setQuestion(rs.getString("question"));
                question.setDateCreate(rs.getDate("dateCreate"));
                list.add(question);
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
}
