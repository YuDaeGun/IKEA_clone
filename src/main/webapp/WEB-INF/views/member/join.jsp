<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<main>
	<div class="root">
		<div class="join_left">
			<div class="back">
				<a href="javascript:history.go(-1)"><img src="${cpath }/IKEA_image/back2.svg" alt="뒤로가기" class="join_backicon"></a>
			</div>
			<div class="join_main">
				<div class="_img">
					<div class="join_logo">
						<a href="${cpath }">
							<img class="join_logo2" src="${cpath }/IKEA_image/Ikea_logo.svg.png">
						</a>
					</div>
				</div>
				<div class="family_join1">
					<h1 class="join_blue"><span>IKEA Family&nbsp;</span><span class="join_black1">회원가입</span></h1>
					<div class="join_black2">
						<span>이미 가입하셨나요?&nbsp;</span><a href="${cpath }/member/login" class="join_try">로그인하기</a>
					</div>
					<br>
					<div class="family_img">
						<div class="family_img1">
							<div class="signup_img1" style="background-image: url(${cpath }/IKEA_image/joinpage_1.jpg)"></div>
							<div class="signup_img2" style="background-image: url(${cpath }/IKEA_image/joinpage_2.jpg)"></div>
							<div class="signup_img3" style="background-image: url(${cpath }/IKEA_image/joinpage_3.jpg)"></div>
							<div class="signup_img4" style="background-image: url(${cpath }/IKEA_image/joinpage_4.jpg)"></div>
						</div>
						<div class="family_img2">
							<div class="signup_img5" style="background-image: url(${cpath }/IKEA_image/joinpage_5.jpg)"></div>
							<div class="signup_img6" style="background-image: url(${cpath }/IKEA_image/joinpage_6.jpg)"></div>
							<div class="signup_img7" style="background-image: url(${cpath }/IKEA_image/joinpage_7.jpg)"></div>
							<div class="signup_img8" style="background-image: url(${cpath }/IKEA_image/joinpage_8.jpg)"></div>
							<div class="signup_img9" style="background-image: url(${cpath }/IKEA_image/joinpage_9.jpg)"></div>
						</div>
					</div>
				</div>
				<div class="join_black3">
					<span>IKEA.kr - <a class="cookie_pol_black" href="#none">쿠키정책,</a>
					<a class="per_info_black" href="#none">개인정보처리방침</a></span>
					<div>© Inter IKEA Systems B.V. 1999-2022</div>
				</div>
			</div>
		</div>
		<div class="join_right">IKEA Family에 가입하시면 어떤 혜택이 있으신지 궁금하신가요?
			<div class="yorno_join">
				<a href="https://www.youtube.com/watch?v=FXpTfsJ8gIA" class="benefit_link" role="button">IKEA Family 혜택 보러가기</a>
			</div>
			<form method="POST">
				<div class="name">이름<br>
					<input name="member_name" type="text" class="name2">
				</div>
				<div class="birth1">생일<br>
					<input name="member_birth" type="date" class="birth2"><br>
					YYYY-MM-DD
				</div>
				<div class="phone_number1">휴대폰<br>
					<span class="KR_number">KR(+82)</span>
					<input name="member_pnum" type="tel" class="phone_number2">
				</div>
				<div class="gender1">성별(선택사항)<br>
					<select name="member_gender" class="gender2">
						<option value="M">남성</option>
						<option value="F">여성</option>
						<option value="X">응답거부</option>
					</select>
				</div>

				<div class="find_post"><br>
					<input type="button" class="find_postnum" onclick="daumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="member_zipcode" class="postnum2" id="daum_postcode" placeholder="우편번호" required="required"><br>
					<input type="text" name="member_address" class="street_address2" id="daum_roadAddress" placeholder="도로명주소" required="required"><br>
					<input type="text" name="member_address" class="jibun_address2" id="daum_jibunAddress" placeholder="지번주소"><br>
					<span id="guide" style="color: #999; display: none"></span>
					<input type="text" name="member_detailsaddress" class="details_address2" id="daum_detailAddress" placeholder="상세주소"><br>
					<input type="hidden" name="member_detailsaddress" class="extra_address2" id="daum_extraAddress" placeholder="참고항목"><br>
				</div>

				<div class="email_address1">이메일<br>
					<input name="member_email" id="emcheck" type="email" class="email_address2" required="required">
					<div id="emCheckMessage"></div>
				</div>
				<div class="join_pw1">비밀번호<br>
					<input id="new_pw" name="member_pw" type="password" class="join_pw2" required="required">
					<div id="check1" class="impo">*특수문자(!@#$%^&*)를 포함한 8~16글자</div>
				</div>
				<div class="join_pw1">비밀번호 확인<br>
					<input id="new_pw_re" name="remember_pw" type="password" class="join_pw2" required="required">
					<div id="check2" class="impo"></div>
				</div>
				<div class="join_success1">
					<button id="pw_reset_bt" type="submit" class="join_success2">가입완료하기</button>
				</div>
			</form>
		</div>
	</div>
	</main>

	<!-- daum 주소검색 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		const emx = document.getElementById('emcheck')
		const emCheckMessage = document.getElementById('emCheckMessage')
		const new_pw = document.getElementById('new_pw')
		console.log(new_pw)
	
		const new_pw_re = document.getElementById('new_pw_re')
		console.log(new_pw_re)
	
	 	const pw_reset_bt = document.getElementById('pw_reset_bt')
		new_pw.addEventListener('blur', checkPassword1)
		new_pw_re.addEventListener('blur', checkPassword2)
	 	pw_reset_bt.addEventListener('click', allCheck)
	</script>

</body>
</html>