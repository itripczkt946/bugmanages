<%--
  Created by IntelliJ IDEA.
  User: wenjie
  Date: 2019-03-05
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增页面</title>

    <style>

        table{ margin:0px auto;width:700px;}
        table tr:nth-of-type(1) {
            background-color:#F5F2F9;
        }
    </style>

</head>
<body>
    <form action="${pageContext.request.contextPath}/bug/saveAdd" method="post">
        <table border="1" cellspacing="0">
            <tr>
                <td colspan="2" align="center">
                    <h1>BUG列表</h1>
                </td>
            </tr>
            <tr>
                <td>所属项目</td>
                <td>
                    <select name="projectId">
                        <option value="0">全部</option>
                        <c:forEach var="pro" items="${bugProjectList}">
                            <option value="${pro.id}">${pro.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>严重性</td>
                <td>
                    <select name="severity">
                        <option value="10">文字错误</option>
                        <option value="20">次要错误</option>
                        <option value="30">严重错误</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>BUG标题(*)</td>
                <td>
                    <input type="text" name="title" />
                </td>
            </tr>

            <tr>
                <td>报告人</td>
                <td>
                    <input type="text" name="reportUser" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交"/>
                    <input  type="button" src="${pageContext.request.contextPath}/bug/buglist" value="返回"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
