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

        <%-- 検索ボックス配置 --%>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <div class="search-area">
            <%--<script src="search.js"></script>--%>
            <form method="get" action="">
                <select id="grade" name="">
                        <option value="">学年を選んでください
                        <option value="1年">1年
                        <option value="2年">2年
                        <option value="3年">3年
                        <option value="4年">4年
                </select>
                <select id="faculty" name="">
                        <option value="">学部を選んでください
                        <option value="文学部">文学部
                        <option value="経済学部">経済学部
                        <option value="法学部">法学部
                        <option value="教育学部">教育学部
                </select>
            <input type="button" value="絞り込む" id="button"> <input type="button" value="すべて表示" id="button2">
            </form>
        </div>


        <script>$(function(){
            $("#button").bind("click",function(){

                var abc , def;
                            abc = $("#grade").val();
                            def = $("#faculty").val();
                            re = new RegExp(abc);
                            re2 = new RegExp(def);

            $("#student_list tbody tr").each(function(){
                var txt = $(this).find("td").text();
                if(txt.match(re) != null){

                      if(txt.match(re2) != null){
                          $(this).show();

                          }else{
                              $(this).hide();
                              }
                        }else{
                            $(this).hide();
                            }
                });
            });

            $("#button2").bind("click",function(){
                $("#student_list tr").show();
                });
    });</script>






        <%-- ここからテーブル --%>
        <table id="student_id">
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
                </tbody>
        </table>

        <table id="student_list">
            <tbody>

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
                            <c:choose>
                                 <c:when test="${student.delete_flag == 1}">
                                    （削除済み）
                                 </c:when>
                                 <c:otherwise>

                                     <a href="<c:url value='/students/follow?id=${student.id}' />">フォローする</a>

                                 </c:otherwise>
                             </c:choose>
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

        <p><a href="<c:url value='/login' />">マイページに戻る</a></p>

    </c:param>
</c:import>