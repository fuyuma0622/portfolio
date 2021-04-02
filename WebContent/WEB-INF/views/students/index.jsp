<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>生徒　一覧</h2>
        <table id="student_list">
            <tbody>
                <tr>
                    <th>ID</th>
                    <th>学年</th>
                    <th>学部</th>
                    <th>学科</th>
                    <th>氏名</th>
                    <th>操作1</th>
                    <th>操作2</th>
                </tr>
                <c:forEach var="student" items="${students}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${student.code}" /></td>
                        <td><c:out value="${student.grade}" /></td>
                        <td><c:out value="${student.faculty}" /></td>
                        <td><c:out value="${student.department}" /></td>
                        <td><c:out value="${student.name}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${student.delete_flag == 1}">
                                    （削除済み）
                                </c:when>
                                <c:otherwise>

                                     <a href="<c:url value='/students/show?id=${student.id}' />">詳細を表示</a>

                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                             <a href="<c:url value='/students/follow?id=${student.id}' />">フォローする</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${students_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((students_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/students/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <%-- 後で表示の条件付ける --%>

        <p><a href="<c:url value='/login' />">ログイン画面に戻る</a></p>

    </c:param>
</c:import>