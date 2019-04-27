<%--
  Created by IntelliJ IDEA.
  User: wenjie
  Date: 2019-03-05
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>bug列表页面</title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <style>
        .container {
            width :700px;
            margin:0px auto;
            text-align:center;
        }
        form { width:500px; margin:0px auto;   }
        form .add{ float : right;}
        table{ margin:0px auto; width:100%;}
        .content{ width:100%; border:1px solid black; margin-top:10px;}
    </style>
</head>
<body>
    <div class="container">
        <form method="get" action="${pageContext.request.contextPath}/bug/buglist">
            所属项目：<select name="projectId">
                        <option value="0">全部</option>
                        <c:forEach var="pro" items="${bugProjectList}">
                            <option value="${pro.id}">${pro.name}</option>
                        </c:forEach>
                      </select>
            <input type="submit" value="查询"/>
            <a class="add" href="${pageContext.request.contextPath}/bug/toAdd">新增BUG</a>
        </form>

        <div class="content">
            <h1>BUG列表</h1>
            <table border="1" cellspacing="0">
                <tr>
                    <th>BUG编号</th>
                    <th>严重性</th>
                    <th>标题</th>
                    <th>报告人</th>
                    <th>报告时间</th>
                </tr>
                <c:forEach var="detail" items="${bugDetailList}">
                    <tr>
                        <td>${detail.id}</td>
                        <td>${detail.severity}</td>
                        <td>${detail.title}</td>
                        <td>${detail.reportUser}</td>
                        <td><fmt:formatDate value="${detail.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</body>
</html>
