<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                IDかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>ログイン</h2>
        <form method="POST" action="<c:url value='/login' />">
            <label for="code">ID</label><br />
            <input type="text" name="code" value="${code}" />
            <br /><br />

            <label for="password">パスワード</label><br />
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit">ログイン</button>

            <p><a href="<c:url value='/students/new' />">初めてご利用の生徒はこちら</a></p>

        </form>

        <script type="text/javascript"><!--
      function myEnter(){
       myPassWord=prompt("パスワードを入力してください","");
       if ( myPassWord == "admin" ){
         location.href="<c:url value='/students/new2' />";
       }else{
         alert( "パスワードが違います!" );
        }
      }
     // --></script>

    <form>
     ここは教員専用です→
    <input type="button" value=" 教員新規登録 " onclick="myEnter()">
     </form>

    </c:param>
</c:import>