package xiaohei.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xiaohei.Dao.UserDao;
import xiaohei.model.UserModel;
import xiaohei.tools.MD5Encryption;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String operateName = request.getParameter("operate");
        Method method;
        try {
            method = getClass().getDeclaredMethod(operateName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    }


    protected void doLoginUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        MD5Encryption md = new MD5Encryption();
        Password = md.getEncryption(Password);

        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);

        UserDao userdao = new UserDao();
        boolean flag = userdao.LoginUser(usermodel);

        if (!flag) {
            request.setAttribute("message", "账号或密码错误！");
            request.getRequestDispatcher("views/Home/Login.jsp").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("views/SysManage/home.jsp");
            rd.forward(request, response);
        }
    }

    protected void doCreateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        String id = request.getParameter("id");

        if (Username.equals("")) {
            request.setAttribute("message", "账号不能为空");
            request.getRequestDispatcher("views/Home/CreateUser.jsp").forward(request, response);
        }
        if (Password.equals("")) {
            request.setAttribute("message", "密码不能为空");
            request.getRequestDispatcher("views/Home/CreateUser.jsp").forward(request, response);
        }
        if (id.equals("")) {
            request.setAttribute("message", "id不能为空");
            request.getRequestDispatcher("views/Home/CreateUser.jsp").forward(request, response);
        }

        MD5Encryption md = new MD5Encryption();
        Password = md.getEncryption(Password);

        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);
        usermodel.SetId(id);

        UserDao userdao = new UserDao();
        boolean flag = userdao.CreateUser(usermodel);

        if (!flag) {
            request.setAttribute("message", "用户名或id已被占用");
            request.getRequestDispatcher("views/Home/CreateUser.jsp").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("views/Home/Login.jsp");
            rd.forward(request, response);
        }
    }

    protected void doForgetUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Username = request.getParameter("Username");
        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);

        UserDao userdao = new UserDao();
        boolean flag = userdao.ForgetUser(usermodel);

        if (!flag) {
            request.setAttribute("message", "查找不到用户");
            request.getRequestDispatcher("views/Home/ForgetPassword.jsp?Username=" + Username + "").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("views/Home/ChangePassword.jsp?Username=" + Username + "");
            rd.forward(request, response);
        }
    }

    protected void doChangePasswordUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        MD5Encryption md = new MD5Encryption();
        Password = md.getEncryption(Password);

        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);

        UserDao userdao = new UserDao();
        boolean flag = userdao.ChangePasswordUser(usermodel);

        if (flag) {
            response.sendRedirect("views/Home/Login.jsp");
        } else {
            System.out.println("更改失败");
        }
    }

    protected void doToUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDao studentDAO = new UserDao();
        ArrayList ArrayUser = studentDAO.ToUser();
        request.setAttribute("ArrayUser", ArrayUser);
        RequestDispatcher rd = request.getRequestDispatcher("views/SysManage/user.jsp");
        rd.forward(request, response);
    }

    protected void doChangeUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        String id = request.getParameter("mid");
        String Permissions = request.getParameter("Permissions");

        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);
        usermodel.SetId(id);
        usermodel.SetPermissions(Permissions);

        UserDao userdao = new UserDao();
        boolean flag = userdao.ChangeUser(usermodel);

        if (flag) {
            response.sendRedirect("views/SysManage/handle.jsp");
        } else {
            System.out.println("更改失败");
        }
    }

    protected void doAddUser(HttpServletRequest request, HttpServletResponse response) {

    }
}
