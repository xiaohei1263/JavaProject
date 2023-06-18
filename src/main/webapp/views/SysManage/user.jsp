<%@ page import="java.util.ArrayList" %>
<%@ page import="xiaohei.model.UserModel" %>
<%@ page import="java.util.Objects" %>
<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/17
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <%String path = request.getContextPath(); %>
    <%
        ArrayList ArrayUser = (ArrayList) request.getAttribute("ArrayUser");
    %>
    <style>
        @import url(<%=path%>/views/css/home.css);
        @import url(<%=path%>/views/css/Login.css);

    </style>
    <script type="text/javascript">
    </script>
</head>
<body>
<div id="app">
    <div class="main-wrapper">
        <!--顶部-->
        <div class="navbar-bg">
            <nav class="navbar navbar-expand-lg main-navbar">
                <ul class="navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user"
                           aria-expanded="false">
                            <div class="d-sm-none ">
                                Hi, xiaohei
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="<%=path%>/views/Home/Login.jsp" class="dropdown-item text-danger"
                               style="font-size: 18px">
                                <i class="fas fa-sign-out-alt"></i>
                                退出登录
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <!--主侧边栏-->
        <div class="main-sidebar sidebar-style-2" style="overflow: hidden; outline: none;" tabindex="1">
            <aside id="sidebar-wrapper">
                <!--侧边栏-->
                <div class="sidebar-brand">
                    <!--侧边顶部标签-->
                    <a href="#">nepu教务管理系统</a>
                </div>
                <ul class="sidebar-menu">
                    <li>
                        <a href="<%=path%>/views/SysManage/home.jsp" class="nav-link">
                            <span>首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/views/SysManage/handle.jsp" class="nav-link">
                            <span>用户管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/views/SysManage/student.jsp" class="nav-link">
                            <span>学生管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/views/SysManage/teacher.jsp" class="nav-link">
                            <span>教师管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/views/SysManage/classes.jsp" class="nav-link">
                            <span>基本课程管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/views/SysManage/classInfo.jsp" class="nav-link">
                            <span>课程信息(管理员)</span>
                        </a>
                    </li>
                </ul>
            </aside>
        </div>
        <!--中心-->
        <div class="main-content" style="min-height: 684px;">
            <section class="section">
                <div class="section-header">
                    <h1>用户管理</h1>
                </div>
                <div class="section-body">
                    <h2 class="section-title">
                        提示
                    </h2>
                    <p class="section-lead">学生,教师权限:查看; 管理员权限:查看,更改</p>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-md">
                                            <tbody>
                                            <tr>
                                                <th>ID</th>
                                                <th>姓名</th>
                                                <th>密码</th>
                                                <th>权限</th>
                                            </tr>
                                            <%
                                                for (Object o : ArrayUser) {
                                                    UserModel user = (UserModel) o;
                                            %>
                                            <tr>
                                                <td><%=user.GetId()%>
                                                </td>
                                                <td><%=user.GetUsername()%>
                                                </td>
                                                <td><%=user.GetPassword()%>
                                                </td>
                                                <td><%
                                                    String per = user.GetPermissions();
                                                    if (Objects.equals(per, "1")) {
                                                        out.println("查看");
                                                    } else {
                                                        out.println("管理员权限");
                                                    }%>
                                                </td>
                                                <td>

                                                    <input type="button" name="popBox" value="修改" onclick="popBox()"
                                                           class="button"/>
                                                    <div id="popBox" class="change-box">
                                                        <div class="close">
                                                            <a href="javascript:void(0)" onclick="closeBox()">关闭</a>
                                                        </div>
                                                        <div class="login_div_4">
                                                            <form action="<%=path%>/UserServlet" method="post">
                                                                <input type="hidden" name="operate"
                                                                       value="doChangeUser"/>
                                                                ID
                                                                <div class="login_div_7">
                                                                    <label>
                                                                        <input type="text" name="mid"
                                                                               class="login_form_1" value=<%=user.GetId()%>>
                                                                    </label>
                                                                </div>
                                                                姓名
                                                                <div class="login_div_7">
                                                                    <label>
                                                                        <input type="text" name="Username"
                                                                               class="login_form_1" value=<%=user.GetUsername()%>>
                                                                    </label>
                                                                </div>
                                                                密码
                                                                <div class="login_div_7">
                                                                    <label>
                                                                        <input type="text" name="Password"
                                                                               class="login_form_1" value=<%=user.GetPassword()%> >
                                                                    </label>
                                                                </div>
                                                                权限
                                                                <div class="login_div_7">
                                                                    <label>
                                                                        <input type="text" name="Permissions"
                                                                               class="login_form_1" />
                                                                    </label>
                                                                </div>
                                                                <div class="login_div_5">
                                                                    <input type="submit" value="确认"
                                                                           class="login_form_2"/>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <input type="button" value="删除" class="button"/>
                                                </td>
                                                <%}%>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination-render float-right">
                                        <ul class="pagination">
                                            <li><a type="button" onclick="popBox1()">添加</a></li>
                                            <li><a href="#">«</a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">»</a></li>
                                        </ul>
                                    </div>
                                    <div id="popBox1" class="change-box">
                                        <div class="close">
                                            <a href="javascript:void(0)" onclick="closeBox1()">关闭</a>
                                        </div>
                                        <div class="login_div_4">
                                            <form action="<%=path%>/UserServlet" method="post">
                                                <input type="hidden" name="operate"
                                                       value="doAddUser"/>
                                                ID
                                                <div class="login_div_7">
                                                    <label>
                                                        <input type="text" name="Username"
                                                               class="login_form_1"/>
                                                    </label>
                                                </div>
                                                姓名
                                                <div class="login_div_7">
                                                    <label>
                                                        <input type="text" name="Username"
                                                               class="login_form_1" />
                                                    </label>
                                                </div>
                                                密码
                                                <div class="login_div_7">
                                                    <label>
                                                        <input type="text" name="Username"
                                                               class="login_form_1"/>
                                                    </label>
                                                </div>
                                                权限
                                                <div class="login_div_7">
                                                    <label>
                                                        <input type="text" name="Username"
                                                               class="login_form_1"/>
                                                    </label>
                                                </div>
                                                <div class="login_div_5">
                                                    <input type="submit" value="添加"
                                                           class="login_form_2"/>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
<script>
    /*点击弹出按钮*/
    function popBox() {
        const popBox = document.getElementById("popBox");
        const popLayer = document.getElementById("popLayer");
        popBox.style.display = "block";
        popLayer.style.display = "block";
    }

    /*点击关闭按钮*/
    function closeBox() {
        const popBox = document.getElementById("popBox");
        const popLayer = document.getElementById("popLayer");
        popBox.style.display = "none";
        popLayer.style.display = "none";
    }
    function popBox1() {
        const popBox1 = document.getElementById("popBox1");
        const popLayer1 = document.getElementById("popLayer1");
        popBox1.style.display = "block";
        popLayer1.style.display = "block";
    }

    /*点击关闭按钮*/
    function closeBox1() {
        const popBox1 = document.getElementById("popBox1");
        const popLayer1 = document.getElementById("popLayer1");
        popBox1.style.display = "none";
        popLayer1.style.display = "none";
    }
</script>
</html>