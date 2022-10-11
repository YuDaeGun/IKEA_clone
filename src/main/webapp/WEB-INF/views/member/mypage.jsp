<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="header.jsp" %>

<body>
	<div class="account_manage">
		<div class="account_title">
			<h1 class="account_big_title">登録内容を更新する</h1>
			<span class="account_small_title">別のアカウントでログインしますか？
				<a class="account_manage_logout" href="${cpath }/member/logout">ログアウト</a>
			</span>
		</div>
		<div class="profile_tabs_panel">
			<div class="account_manage_mypage">
				<div>
					<div>マイページ</div>
					<div><small>こちらでは、IKEA Familyの特典をすべてご確認いただけます。</small></div>
				</div>
				<div>
					<span><img class="myfamily_go1" src="${cpath }/IKEA_image/go1.svg"></span>
				</div>
			</div>
			<div class="tab_list">
				<a href="${cpath }/member/IKEA_Account_Manage">
					<button class="account_tab_list">계정</button>
				</a> <a href="${cpath }/member/IKEA_Add_Modify"><button
						class="account_tab_list">주소</button></a> <a
					href="${cpath }/member/IKEA_Deleted"><button class="account_tab_list">탈퇴</button></a>
			</div>
			<form method="POST">

				<div class="account_manage_list1">
					<div class="account_info">

						<div>
							<div class="faq-content">

								<div class="account_manage_info" id="que-1">
									<div class="account_manage_privacy">
										<strong>개인정보</strong>
									</div>
									<span class="account_modify" id="que-1-toggle">수정</span>
								</div>
								<div>
									<span id="member_name1">${IKEA_Login.member_name }</span>
								</div>
								<div id="member_birth1">${IKEA_Login.member_birth }</div>
								<div id="member_gender1">${IKEA_Login.member_gender}</div>
								<br>
								<div class="answer" id="ans-1">
									<!-- 								<div> -->
									<!-- 									성 <br> <input class="account_insert" type="text" -->
									<!-- 										placeholder="안"> -->
									<!-- 								</div> -->
									<br> <input type="text" class="hidden"
										value="${IKEA_Login.member_idx }">
									<div id="member_name2">
										이름 <br> <input name="member_name" class="account_insert"
											type="text" placeholder="${IKEA_Login.member_name }">
									</div>
									<br>
									<div id="member_birth2">
										생일 <br> <input name="member_birth" class="account_insert"
											type="date">
									</div>
									<br>
									<div>
										성별 <br> <select class="account_insert"
											name="member_gender" id="member_gender2">
											<option value="M">남자</option>
											<option value="F">여자</option>
											<option value="X">응답거부</option>
										</select>
									</div>

									<button type="submit" class="family_submit" id="family_submit">

										<span id="save" class="profile__btn__label">저장</span>
									</button>
								</div>
							</div>

							<hr class="account_manage_line">
						</div>
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_tel">
									<strong>연락처</strong>
								</div>
								<a href="${cpath}/member/New_Tel" class="account_modify">수정</a>
							</div>
							<div>
								<span>+82</span><span>${IKEA_Login.member_pnum }</span>
							</div>

						</div>
						<hr class="account_manage_line">
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_email">
									<strong>메일</strong>
								</div>
								<a href="${cpath}/member/New_Email" class="account_modify">수정</a>
							</div>
							<div class="account_manage_email2">
								<span>${IKEA_Login.member_email }</span>
							</div>

						</div>
						<hr class="account_manage_line">
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_pw">
									<strong>비밀번호</strong>
								</div>
								<a href="${cpath}/member/IKEA_Pw_Reset" class="account_modify">수정</a>
							</div>
							<div>
								<span>*******</span>
							</div>
						</div>
						<hr class="account_manage_line">
					</div>
				</div>
			</form>
		</div>

		<div class="first_interest">
			<div class="interest">
				<img class="interesting_home" src="${cpath }/IKEA_image/interesting_home.svg">
				<div>
					<p>
						<strong>관심사를 설정해주세요</strong>
					</p>
					<p>집에 대한 정보를 입력하고 맞춤형 팁과 아이디어를 얻어보세요</p>
					<p class="interest_start">
						<strong>시작하기!</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		const items = document.querySelectorAll('.account_manage_info');
		items.forEach(item => item.addEventListener('click', openCloseAnswer));
	</script>
	
<%@ include file="../footer.jsp" %>