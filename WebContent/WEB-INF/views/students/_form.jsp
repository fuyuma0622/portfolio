<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="code">ID(半角数字)</label><br />
<input type="text" name="code" value="${student.code}" />
<br /><br />

<label for="grade">学年</label><br />
<select size="1" name="grade">
<option value="1年">1年</option>
<option value="2年">2年</option>
<option value="3年">3年</option>
<option value="4年">4年</option>
</select>
<br /><br />

<label for="faculty">学部</label><br />
<select size="1" name="faculty" id="genre" onchange="createMenu(this.value)">

<c:if test="${student.faculty == null}">
<option value="" selected>学部を選択してください</option>
</c:if>

<c:if test="${student.faculty != null}">
<option value="${student.faculty}" selected>${student.faculty}</option>
</c:if>

<option value="文学部">文学部</option>
<option value="経済学部">経済学部</option>
<option value="法学部">法学部</option>
<option value="教育学部">教育学部</option>
</select>
<br /><br />


<label for="department">学科</label><br />
<select size="1" name="department" id="departmentList">
<c:if test="${student.department == null}">
<option disabled selected>学科を選択してください</option>
</c:if>

<c:if test="${student.department != null}">
<option value="${student.department}" selected>${student.department}</option>
</c:if>
</select>
<br /><br />

<%-- javaの記述 --%>

<script>
const departmentMenu =
      {
        "文学部": ["日本文学科", "英文学科", "フランス文学科"],
        "経済学部": ["経済学科", "現代経済デザイン学科"],
        "法学部": ["法学科"],
        "教育学部": ["教育学科", "心理学科"]
      };


function createMenu(selectGenre){

  let departmentList = document.getElementById('departmentList');
  departmentList.disabled = false;
  departmentList.innerHTML = '';
  let option = document.createElement('option');
  option.innerHTML = '学科を選択してください';
  option.defaultSelected = true;
  option.disabled = true;
  departmentList.appendChild(option);

  departmentMenu[selectGenre].forEach( menu => {
    let option = document.createElement('option');
    option.innerHTML = menu;
    departmentList.appendChild(option);
  });
}
</script>

<label for="name">氏名</label><br />
<input type="text" name="name" value="${student.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="password" name="password" />
<br /><br />

<label for="admin_flag">権限</label><br />
<select name="admin_flag">
    <option value="0"<c:if test="${student.admin_flag == 0}"> selected</c:if>>生徒</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>