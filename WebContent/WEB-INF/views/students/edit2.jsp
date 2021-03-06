<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${student != null}">
                <h2>id : ${student.id} のmy情報　編集ページ</h2>
                <p>（パスワードは変更する場合のみ入力してください）</p>
                <p>（学科を変更する際は学部から選択しなおしてください）</p>
                <form method="POST" action="<c:url value='/students/update2' />">
                    <c:import url="_form2.jsp" />
                </form>

                <p><a href="#" onclick="confirmDestroy();">この情報を削除する</a></p>
                <form method="POST" action="<c:url value='/students/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/' />">トップページに戻る</a></p>
    </c:param>
</c:import>