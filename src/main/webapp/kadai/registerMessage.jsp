<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // セッションの有効期限設定
  session.setMaxInactiveInterval(180);
  request.setCharacterEncoding("UTF-8");
  
  String logout = request.getParameter("logout");
  String message = request.getParameter("message");
  
  if (logout != null && logout.equals("true")) {
    // ログアウトを押したら、セッションの破棄
    session.invalidate();
  } else {
    
    if (message != null && message != "") {
      // 「メッセージ」が送信されていたら、セッションに保存
      session.setAttribute("message", message);
    } else {
      // 「メッセージ」が送信されていなかったら、セッションからメッセージを取得
      message = (String)session.getAttribute("message");
    }
  }
  if (message == null) message = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMessage</title>
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
  <form method="GET" action="/tb-jsp/kadai/registerMessage.jsp">
    <ul>
      <li><label for="message">メッセージ</label><input type="text" name="message" value="<%= message %>"/></li>
      <li>
        <input type="submit" value="登録" />
        <a href="/tb-jsp/kadai/registerMessage.jsp?logout=true">ログアウト</a>
      </li>
    </ul>
  </form>
</body>
</html>
