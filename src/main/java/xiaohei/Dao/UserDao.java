package xiaohei.Dao;

import xiaohei.model.UserModel;
import xiaohei.tools.DBManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {
    public DBManager db;

    public UserDao() {
        db = new DBManager();
    }

    public Boolean LoginUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM User_user where username = '" + usermodel.GetUsername() + "'" +
                "and password = '" + usermodel.GetPassword() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next())
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean CreateUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM User_user where username = '" + usermodel.GetUsername() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        sql = "INSERT INTO User_user(id,username, password) VALUES ('" + usermodel.GetId() + "','" + usermodel.GetUsername() + "','" + usermodel.GetPassword() + "');";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public Boolean ForgetUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM User_user where username = '" + usermodel.GetUsername() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean ChangePasswordUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "UPDATE  User_user SET password = '" + usermodel.GetPassword() + "' where username ='" + usermodel.GetUsername() + "'";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public ArrayList<UserModel> ToUser() {
        String sql = "SELECT id,username,password,quanxian from User_user";
        ArrayList<UserModel> ArrayStudent = new ArrayList<>();
        ResultSet rs = db.executeQuery(sql);
        try {
            while (rs.next()) {
                UserModel user = new UserModel();
                user.SetId(rs.getString(1));
                user.SetUsername(rs.getString(2));
                user.SetPassword(rs.getString(3));
                user.SetPermissions(rs.getString(4));
                ArrayStudent.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ArrayStudent;
    }

    public boolean ChangeUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "" +
                "UPDATE User_user\n" +
                "SET username = '" + usermodel.GetUsername() + "',\n" +
                "    password = '" + usermodel.GetPassword() + "',\n" +
                "    quanxian = '" + usermodel.GetPermissions() + "'\n" +
                "where id = '" + usermodel.GetId() + "'";

        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }
}
