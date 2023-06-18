<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/17
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/views/css/home.css);
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
                        <a href="<%=path%>/views/Home/Login.jsp" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user"
                           aria-expanded="false">
                            <div class="d-sm-none ">
                                Hi, xiaohei
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="<%=path%>/views/Home/Login.jsp" class="dropdown-item text-danger" style="font-size: 18px">
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
                    <p class="section-lead"></p>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-md">
                                            <tbody>
                                            <tr>
                                                <th>ID</th>
                                                <th>类型</th>
                                                <th>IP</th>
                                                <th>地点</th>
                                                <th>日期</th>
                                                <th>User-Agent</th>
                                            </tr>
                                            <tr>

                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination-render float-right">
                                        <ul class="pagination">
                                            <li><a href="#">«</a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">»</a></li>
                                        </ul>
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
</script>
</html>
