package model.DAO;
import java.sql.*;
import java.util.*;
import model.db.DbFood;
import model.domain.food;

public class FoodDAO implements IFoodDAO{
    protected static final String FILE_INSERT="id,fName,feature,material,fPrice,fType";
    protected static String SELECT_SQL="select"+FILE_INSERT+"from food where id=?";

    public List<food> search(String keyword) throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        List<food> results = new ArrayList<>();
        try {
            con = DbFood.getDBconnection();
            String sql = "SELECT * FROM food WHERE fName LIKE ? OR feature LIKE ? OR material LIKE ? OR fType LIKE ?";
            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1, "%" + keyword + "%");
            prepStmt.setString(2, "%" + keyword + "%");
            prepStmt.setString(3, "%" + keyword + "%");
            prepStmt.setString(4, "%" + keyword + "%");
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                food fd2 = new food();
                fd2.setId(rs.getInt(1));
                fd2.setfName(rs.getString(2));
                fd2.setFeature(rs.getString(3));
                fd2.setMaterial(rs.getString(4));
                fd2.setfPrice(rs.getDouble(5));
                fd2.setfType(rs.getString(6));
                results.add(fd2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbFood.closeDB(con, prepStmt, rs);
        }
        return results;
    }
    public List<food> findAll() throws Exception {
        Connection con = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        List<food> results = new ArrayList<>();
        try {
            con = DbFood.getDBconnection();
            String sql = "SELECT * FROM food";
            prepStmt = con.prepareStatement(sql);
            rs = prepStmt.executeQuery();
            while (rs.next()) {
                food fd2 = new food();
                fd2.setId(rs.getInt(1));
                fd2.setfName(rs.getString(2));
                fd2.setFeature(rs.getString(3));
                fd2.setMaterial(rs.getString(4));
                fd2.setfPrice(rs.getDouble(5));
                fd2.setfType(rs.getString(6));
                results.add(fd2);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbFood.closeDB(con, prepStmt, rs);
        }
        return results;
    }


}