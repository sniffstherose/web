package model.DAO;

import java.sql.*;
import model.db.DbUser;

public class UserDAO implements IUserDAO {

    private String email;
    private String username;
    private String password;

    public UserDAO(String email, String username, String password) {
        this.email = email;
        this.username = username;
        this.password = password;
    }

    @Override
    
    public boolean isEmailRegistered() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isRegistered = false;

        try {
            conn = DbUser.getDBconnection();
            String query = "SELECT * FROM userinfo WHERE email = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            isRegistered = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUser.closeDB(rs, stmt, conn);
        }

        return isRegistered;
    }

    @Override
    public boolean checkPassword() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean isMatched = false;

        try {
            conn = DbUser.getDBconnection();

            String query = "SELECT * FROM userinfo WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            isMatched = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DbUser.closeDB(rs, stmt, conn);
        }

        return isMatched;
    }

    @Override
    public void insertUserInfo() {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DbUser.getDBconnection();
            conn.setAutoCommit(false);

            String query = "INSERT INTO userinfo (email, username, password) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, username);
            stmt.setString(3, password);
            stmt.executeUpdate();

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            closeResources(null, stmt, conn);
        }
    }

    private void closeResources(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                DbUser.closeDB(null, stmt, conn);  // 使用DbUser类的closeDB方法关闭连接
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

