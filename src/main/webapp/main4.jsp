<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주차 예약 웹사이트</title>
</head>
<body>

    	<button id="openPaymentWindow" onclick="openPaymentWindow()">결제 받을 정보 등록하기</button>

<script>
function openPaymentWindow() {
    // 새 창을 열고 창의 속성을 설정합니다.
    var paymentWindow = window.open("", "_blank", "width=400, height=300");
    
    // 새 창에 표시할 HTML을 작성합니다.
    var paymentFormHTML = `
        <html>
        <head>
            <title>결제 정보 입력</title>
        </head>
        <body>
            <h2>결제 정보 입력</h2>
            <%
		    // 세션에서 사용자 아이디 가져오기
		    String user_id = (String) session.getAttribute("user_id");
			%>
            <form id="paymentForm">
            <div id="user_id"><%= user_id %></div>
                <div id="tt">은행명</div>
                <input type="text" id="bankName" name="bankName" placeholder="은행명 입력">
                
                <div id="tt">예금주</div>
                <input type="text" id="accountHolder" name="accountHolder" placeholder="예금주 입력">
                
                <div id="tt">계좌 번호</div>
                <input type="text" id="accountNumber" name="accountNumber" placeholder="계좌 번호 입력">
                
                <button type="button" id="savePaymentInfo" onclick="savePaymentInfo()">저장</button>
            </form>
        </body>
        </html>
    `;

    // 새 창에 HTML을 쓰고 닫힘 이벤트를 처리합니다.
    paymentWindow.document.write(paymentFormHTML);
    paymentWindow.onunload = function() {
        // 새 창이 닫힐 때의 동작을 정의할 수 있습니다.
    };
}

function savePaymentInfo() {
    // 사용자가 입력한 결제 정보를 가져와서 처리
    var bankName = document.getElementById("bankName").value;
    var accountHolder = document.getElementById("accountHolder").value;
    var accountNumber = document.getElementById("accountNumber").value;

    // 여기에서 서버로 결제 정보를 전송 또는 저장하는 로직을 추가
    // 예를 들어, AJAX를 사용하여 서버에 데이터를 전송합니다.
    
    // 창을 닫습니다.
    window.close();
}
</script>
</body>
</html>
