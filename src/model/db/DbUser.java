package model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUser {

    private static String driverName = "com.mysql.cj.jdbc.Driver";   //驱动程序名
    private static String userName = "root";                      //数据库用户名
    private static String userPwd = "root";                     //密码
    private static String dbName = "orderfood";                    //数据库名

    public static Connection getDBconnection() {
        String url1 = "jdbc:mysql://localhost/" + dbName;
        String url2 = "?user=" + userName + "&password=" + userPwd;
        String url3 = "&useUnicode=true&characterEncoding=GB2312";
        String url = url1 + url2 + url3;
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url);
            return con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void closeDB(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

