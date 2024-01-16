<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 축제의 부스를 담다 - 부스락</title>
<style type="text/css">
	#termsModal {
    	width: 300px;
    	height: 300px;
    	margin: auto;
	}
	#close {
		width: 100px;
		height: 40px;
		border: 1px solid #757575;
		background-color: #fff;
		border-radius: 15px;
		text-align: center;
		margin-top: 25px;
		font-size: 15px;
		color: #757575;
		display: inline-block;
		vertical-align: top;
		box-sizing: border-box;
		line-height: 40px;
	}
	#close:hover {
		border-color: #876ed5;
		color: #876ed5;
		font-weight: bold;
	}
</style>
</head>
<body>

	<div id="termsModal" class="modal">
		<h2>개인정보 수집, 조회, 활용 동의서</h2>
		<p> 가. 관련법령 : 개인정보 보호법 제 15조, 제 17조 <br> ■ 개인정보 수집 및 이용 <br>
			부스樂(이하 '부스락'이라 한다.)는 '부스락'의 사이트 운영을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br>
			○ 개인정보를 제공받는 자 - 부스락의 회원 담당 부서 <br> ○ 개인정보의 이용 목적 - 부스락 사이트의 소비자
			회원과 판매자 회원의 원활한 이용을 위함 <br> ○ 이용 또는 제공하는 개인정보의 항목 - 성명, 휴대폰번호,
			이메일, 주소, 사업자등록번호(판매자 회원의 경우) <br> ○ 개인정보의 보유 및 이용기간 - 회원가입일로부터
			회원 탈퇴 1년 후까지 <br> ○ 개인정보 수집 동의 거부의 권리 - 신청자는 개인정보 수집 동의에 거부할 권리가
			있습니다. 다만 개인정보 수집을 거부할 경우 해당 사이트의 기능들의 이용이 제한될 수 있습니다.
		</p>
		<button id= "close" onclick="closeWindow()">창 닫기</button>
	</div>
	<script type="text/javascript">
    document.getElementById('termsCheckbox').addEventListener('change', function() {
      if (this.checked) {
        // 체크되면 모달을 보여줌
        openModal();
      } else {
        // 체크가 해제되면 모달을 닫음
        closeModal();
      }
    });

    // 모달 열기
    function openModal() {
      document.getElementById('termsModal').style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
      document.getElementById('termsModal').style.display = 'none';
    }
    function closeWindow() {
      window.close();
  	}
  </script>
</body>
</html>