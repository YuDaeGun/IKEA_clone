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
					<p>マイページ</p>
					<span class="small">こちらでは、IKEA Familyの特典をすべてご確認いただけます。</span>
				</div>
				<div>
					<span><img class="myfamily_go1" src="${cpath }/IKEA_image/go1.svg"></span>
				</div>
			</div>
			<div class="tab_list">
				<a href="${cpath }/member/IKEA_Account_Manage">
					<button class="account_tab_list">アカウント</button>
				</a>
				<a href="${cpath }/member/IKEA_Add_Modify">
					<button class="account_tab_list">住所一覧</button>
				</a>
				<a href="${cpath }/member/IKEA_Deleted">
					<button class="account_tab_list">設定</button>
				</a>
			</div>
			<form method="POST">
				<div class="account_manage_list1">
					<div class="account_info">
						<div class="faq-content">
							<div class="account_manage_info">
								<div><strong>お名前</strong></div>
								<span class="account_modify" id="modify_name">編集</span>
							</div>
							<div id="modify_name_preview">
								<p>${loginInfo.member_name1 } ${loginInfo.member_name2 }</p>
								<p>${loginInfo.member_birth }</p>
								<p>${loginInfo.member_gender}</p>
							</div>
							<br>
							<div class="answer" id="modify_name_toggle">
								<input type="text" class="hidden" value="${loginInfo.member_idx }">
								<div>姓　例：山田
									<input name="member_name1" class="account_insert" type="text" value="${loginInfo.member_name1 }">
								</div><br><br>
								<div>姓 (フリガナ)　例：ヤマダ
									<input name="member_name1_furigana" class="account_insert" type="text" value="${loginInfo.member_name1_furigana }">
								</div><br><br>
								<div>名　例：太郎
									<input name="member_name2" class="account_insert" type="text" value="${loginInfo.member_name2 }">
								</div><br><br>
								<div>名 (フリガナ)　例：タロウ
									<input name="member_name2_furigana" class="account_insert" type="text" value="${loginInfo.member_name2_furigana }">
								</div><br><br>
								<div id="member_birth2">誕生日 (YYYY-MM-DD)　例：1990-07-03
									<input name="member_birth" class="account_insert" type="date" value="${loginInfo.member_birth }">
								</div><br><br>
								<div>성별
									<select class="account_insert" name="member_gender" id="member_gender2">
										<option value="M">남자</option>
										<option value="F">여자</option>
										<option value="X">응답거부</option>
									</select>
								</div>
								<button type="submit" class="family_submit" id="family_submit">
									<span id="save" class="profile__btn__label">저장</span>
								</button>
							</div>
							<hr class="account_manage_line">
						</div>
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_tel">
									<strong>連絡先</strong>
								</div>
								<span class="account_modify" id="modify_pnum">編集</span>
							</div>
							<div>
								<span>+82</span><span>${loginInfo.member_pnum }</span>
							</div>
						</div>
						<hr class="account_manage_line">
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_email">
									<strong>メールアドレス</strong>
								</div>
								<span class="account_modify" id="modify_email">編集</span>
							</div>
							<div class="account_manage_email2">
								<span>${loginInfo.member_email }</span>
							</div>
						</div>
						<hr class="account_manage_line">
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_pw">
									<strong>パスワード</strong>
								</div>
								<span class="account_modify" id="modify_pw">編集</span>
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
		console.log(items)
		items.forEach(item => item.addEventListener('click', modifyHandler));
	</script>
	
<%@ include file="../footer.jsp" %>