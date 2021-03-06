<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>生徒課題提出広場</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_menu">
                    <h1><a href="<c:url value='/' />">生徒課題広場</a></h1>&nbsp;&nbsp;&nbsp;

                        <c:if test="${sessionScope.login_student.admin_flag == 1}">
                            <a href="<c:url value='/students/index' />">生徒管理</a>&nbsp;

                            <a href="<c:url value='/reports/index' />">レポート管理</a>&nbsp;
                        </c:if>
                </div>
                <c:if test="${sessionScope.login_student != null}">
                    <div id="student_name">
                        <c:out value="${sessionScope.login_student.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </div>
                </c:if>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Kosei Eto.
            </div>
        </div>
    </body>
</html>