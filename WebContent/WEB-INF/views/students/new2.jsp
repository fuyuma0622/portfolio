<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>課題提出広場　新規登録ページ</h2>

        <form method="POST" action="<c:url value='/students/create' />">
            <c:import url="_form2.jsp" />
        </form>

        <p><a href="<c:url value='/students/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>