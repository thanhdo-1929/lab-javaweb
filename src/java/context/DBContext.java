package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
     public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    private final String serverName = "DESKTOP-TN5JD8L\\SQLEXPRESS";
    private final String dbName = "Timetable";
    private final String portNumber = "1433";
    private final String userID = "sa1";
    private final String password = "123456";
    public static void main(String[] args) {
        DBContext dc = new DBContext();
         try {
             dc.getConnection();
             System.out.println("sus");
         } catch (Exception ex) {
             Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
}