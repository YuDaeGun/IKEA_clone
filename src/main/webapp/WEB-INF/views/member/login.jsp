<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<main>
	<div class="root">
		<div class="left">
			<div class="back">
				<a class="backicon" href="javascript:history.go(-1)"><img src="${cpath }/IKEA_image/back.svg" alt="뒤로가기"></a>
			</div>
			<div class="login_main">
				<div class="login_ex_img">
					<div class="login_logo">
						<a href="${cpath }/"><img src="${cpath }/IKEA_image/white_Logo.svg"></a>
					</div>
				</div>
				<div class="login_ex">
					<h1 class="login_yellow"><span>로그인</span></h1>
					<p class="login_white">
						외워야 할 비밀번호가 많아 불편하셨죠?<br>
						이제 일회용 코드를 이용하여 간편하게 로그인하세요.<br><br>
						*이메일 또는 휴대폰 번호 최초 인증 후 사용가능
					</p>
				</div>
				<div class="login_white2">
					<span>IKEA.kr - <a class="cookie_pol" href="#none">쿠키정책,</a>
					<a class="per_info" href="#none">개인정보처리방침</a></span>
					<div>© Inter IKEA Systems B.V. 1999-2022</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="login_act">
				<form method="POST">
					<div class="login_act_Id">
						이메일<br>
						<input type="text" class="username" name="member_email" required value="${member_email}">
					</div>
					<div class="login_act_pw">
						비밀번호<br>
						<div class="pwbt">
							<div>
								<div id="d1">
									<input id="password" type="password" class="password_input_vi" autocomplete="current-password" name="member_pw" required>
										<img id="b1" class="eye_visible" src="${cpath }/IKEA_image/pw_show.svg">
								</div>
							</div>
							<a href="IKEA_Pw_find" class="find_pw">비밀번호 찾기</a>
						</div><br><br>
						<div>
							<button type="submit" class="login_bt" id="logincheck" value="로그인">
								<span>로그인</span>
								<div id="loginCheckMessage"></div>
							</button>
						</div>
				</form>
				<p class="testtt">IKEA 계정이 없으신가요? 지금 바로 만들어보세요.</p>
				<div><a class="join_member" href="join">개인회원 가입하기</a></div>
			</div>
		</div>
	</div>
	</main>
	
	<script>
		const b1 = document.getElementById('b1')
		const password = document.getElementById('password')
	
		b1.addEventListener('click', chan)
	</script>

</body>
</html>















