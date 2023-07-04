package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface IUserDAO {
    boolean isEmailRegistered()throws Exception;;
    boolean checkPassword()throws Exception;;
    void insertUserInfo()throws Exception;;
}

    