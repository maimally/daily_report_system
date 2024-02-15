<!-- このページがJava言語を使っていること、文字はUTF-8で書かれていることを教える部分です。 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- このページで使う特別な道具（タグ）の箱を開けるようなものです。 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 画面の項目値等を定義するEnumクラス -->
<%@ page import="constants.AttributeConst"%>

<!--リクエストパラメーターの変数名、変数値、jspファイルの名前等画面遷移に関わる値を定義するEnumクラス -->
<%@ page import="constants.ForwardConst"%>

<!-- ここからは、ページにどんな情報を表示するか、どんな動きをするかの設定をしています。 -->
<!-- 「動作」の種類を設定しています。ACT_EMP("Employee") -->
<c:set var="action" value="${ForwardConst.ACT_EMP.getValue()}" />
<!-- 「動作」の種類を設定しています。CMD_INDEX("index") -->
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />

<!-- 「動作」の種類を設定しています。CMD_UPDATE("update")-->
<c:set var="commUpd" value="${ForwardConst.CMD_UPDATE.getValue()}" />

<!-- 「動作」の種類を設定しています。CMD_DESTROY("destroy")-->
<c:set var="commDel" value="${ForwardConst.CMD_DESTROY.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>id : ${employee.id} の従業員情報 編集ページ</h2>
        <p>（パスワードは変更する場合のみ入力してください）</p>
        <!-- 更新するためのフォームです。どこにデータを送るか設定しています。 -->
        <form method="POST"
            action="<c:url value='?action=${action}&command=${commUpd}' />">
            <c:import url="_form.jsp" />
        </form>

        <p>
            <a href="#" onclick="confirmDestroy();">この従業員情報を削除する</a>
        </p>
        <!-- 実際に削除を行うためのフォームです。 -->
        <form method="POST"
            action="<c:url value='?action=${action}&command=${commDel}' />">
            <!-- どの従業員を削除するか識別するための隠れた部分です。 -->
            <input type="hidden" name="${AttributeConst.EMP_ID.getValue()}"
                value="${employee.id}" />
            <!-- セキュリティを保つための隠れた部分です。 -->
            <input type="hidden" name="${AttributeConst.TOKEN.getValue()}"
                value="${_token}" />
        </form>
        <script>
            function confirmDestroy() {
                if (confirm("本当に削除してよろしいですか？")) {
                    document.forms[1].submit();
                }
            }
        </script>

        <p>
            <a href="<c:url value='?action=${action}&command=${commIdx}' />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>