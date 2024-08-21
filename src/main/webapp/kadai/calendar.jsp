<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.DateTimeException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="ja_JP" />
<%!

  private static Map<String, String> eventMap = new HashMap<>();
  static {
    eventMap.put("20240101", "お正月");
    eventMap.put("20240108", "成人の日");
    eventMap.put("20240211", "建国記念の日");
    eventMap.put("20240223", "天皇誕生日");
    eventMap.put("20240320", "春分の日");
    eventMap.put("20240429", "昭和の日");
    eventMap.put("20240503", "憲法記念日");
    eventMap.put("20240504", "みどりの日");
    eventMap.put("20240505", "こどもの日");
    eventMap.put("20240715", "海の日");
    eventMap.put("20240811", "山の日");
    eventMap.put("20240916", "敬老の日");
    eventMap.put("20240922", "秋分の日");
    eventMap.put("20241014", "スポーツの日");
    eventMap.put("20241103", "文化の日");
    eventMap.put("20241123", "勤労感謝の日");
    eventMap.put("20241225", "クリスマス");
    eventMap.put("20241231", "大晦日");
  }
%>
<%
  // リクエストのパラメーターから日付を取り出す
  String year = (String)request.getParameter("year");
  String month = (String)request.getParameter("month");
  String day = (String)request.getParameter("day");
  if (year != null && !year.isEmpty()) {
    year = String.format("%04d", Integer.parseInt(year));
  }

  if (month != null && !month.isEmpty()) {
    month = String.format("%02d", Integer.parseInt(month));
  }

  if (day != null && !day.isEmpty()) {
    day = String.format("%02d", Integer.parseInt(day));
  }
  
  LocalDate localDate = null;
    
  if ((year == null || year.equals("")) && (month == null || month.equals("")) && (day == null || day.equals(""))) {
    // 日付が送信されていないので、現在時刻を元に日付の設定を行う
    localDate = LocalDate.now();
    year = String.valueOf(localDate.getYear());
    month = String.format("%02d", localDate.getMonthValue());
    day = String.format("%02d", localDate.getDayOfMonth());
  } else {

    try {
        // 送信された日付を元に、LocalDateのインスタンスを生成する
        localDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
    } catch (DateTimeException e) {
        // 無効な日付が入力された場合、現在時刻を元に日付の設定を行う
        localDate = LocalDate.now();
        year = String.valueOf(localDate.getYear());
        month = String.format("%02d", localDate.getMonthValue());
        day = String.format("%02d", localDate.getDayOfMonth());
    }
  }
  String[] dates = { year, month, day };

  // 画面で利用するための日付、イベント情報を保存
  session.setAttribute("dates", dates);
  session.setAttribute("date", Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
  
  String event = eventMap.getOrDefault(year + month + day, "該当する行事はありません");
  session.setAttribute("event", event);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
  <form method="POST" action="/tb-jsp/kadai/calendar.jsp">
    <ul>
      <li><input type="text" id="year" name="year" value="${param['year']}" /><label for="year">年</label><input type="text" id="month" name="month" value="${param['month']}" /><label for="month">月</label><input type="text" id="day" name="day" value="${param['day']}" /><label for="day">日</label></li>
      <li><button type="submit" id="submitButton">送信</button></li>
      <li><c:out value="${fn:join(dates, '/')}" /> (<fmt:formatDate value="${date}" pattern="E" />)</li>
      <li><c:out value="${event}" /></li>
    </ul>
  </form>
  <script>
    document.getElementById("submitButton").addEventListener("click", function(event) {
        const year = document.getElementById("year").value;
        const month = document.getElementById("month").value;
        const day = document.getElementById("day").value;

        const yearPattern = /^\d{4}$/;
        const monthPattern = /^\d{2}$/;
        const dayPattern = /^\d{2}$/;

        let valid = true;

        if (!yearPattern.test(year)) {
            alert("年はYYYY形式で入力してください");
            valid = false;
        }

        if (!monthPattern.test(month)) {
            alert("月はMM形式で入力してください");
            valid = false;
        }

        if (!dayPattern.test(day)) {
            alert("日はDD形式で入力してください");
            valid = false;
        }

        // フォーム送信を中止
        if (!valid) {
            event.preventDefault();
        }
    });
  </script>
</body>
</html>
