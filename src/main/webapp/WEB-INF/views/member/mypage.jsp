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
					<p class="small">こちらでは、IKEA Familyの特典をすべてご確認いただけます。</p>
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
				<div class="modifyDiv">
					<div class="account_info">
						<div class="account_profile">
							<div class="account_manage_info">
								<b>お名前</b>
								<span class="account_modify" id="modify_name">編集</span>
							</div>
							<div id="modify_name_preview">
								<p>${loginInfo.member_name1 } ${loginInfo.member_name2 }</p>
								<p>${loginInfo.member_birth }</p>
								<p>${loginInfo.member_gender == 'M' ? '男性' : loginInfo.member_gender == 'F' ? '女性' : '応答拒否'}</p>
							</div>
							<div class="displayNone" id="modify_name_toggle">
								<input type="text" class="hidden" value="${loginInfo.member_idx }">
								<div>
									<label>姓　例：山田
										<input name="member_name1" class="account_insert" type="text" value="${loginInfo.member_name1 }">
									</label>
								</div>
								<div>
									<label>姓 (フリガナ)　例：ヤマダ
										<input name="member_name1_furigana" class="account_insert" type="text" value="${loginInfo.member_name1_furigana }">
									</label>
								</div>
								<div>
									<label>名　例：太郎
										<input name="member_name2" class="account_insert" type="text" value="${loginInfo.member_name2 }">
									</label>
								</div>
								<div>
									<label>名 (フリガナ)　例：タロウ
										<input name="member_name2_furigana" class="account_insert" type="text" value="${loginInfo.member_name2_furigana }">
									</label>
								</div>
								<div>
									<label>誕生日 (YYYY-MM-DD)　例：1990-07-03
										<input name="member_birth" class="account_insert" type="date" value="${loginInfo.member_birth }">
									</label>
								</div>
								<div>
									<span>성별</span>
									<div class="genderRadio">
										<div>
											<label><input name="member_gender" type="radio" value="M" ${loginInfo.member_gender == 'M' ? 'checked' : '' }>男性</label>
										</div>
										<div>
											<label><input id="radio_F" name="member_gender" type="radio" value="F" ${loginInfo.member_gender == 'F' ? 'checked' : '' }>女性</label>
										</div>
										<div>
											<label><input name="member_gender" type="radio" value="X" ${loginInfo.member_gender == 'X' ? 'checked' : '' }>言わないでおく</label>
										</div>
									</div>
								</div>
								<button type="submit" class="family_submit">
									<span id="save" class="profile__btn__label">変更を保存</span>
								</button>
							</div>
						</div>
						
						<hr>
						
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_tel">
									<b>連絡先</b>
								</div>
								<span class="account_modify" id="modify_pnum">編集</span>
							</div>
							<div>
								<span>+82</span><span>${loginInfo.member_pnum }</span>
							</div>
						</div>
						
						<hr>
						
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_email">
									<b>メールアドレス</b>
								</div>
								<span class="account_modify" id="modify_email">編集</span>
							</div>
							<div class="account_manage_email2">
								<span>${loginInfo.member_email }</span>
							</div>
						</div>
						
						<hr>
						
						<div class="account_profile">
							<div class="account_manage_info">
								<div class="account_manage_pw">
									<b>パスワード</b>
								</div>
								<span class="account_modify" id="modify_pw">編集</span>
							</div>
							<div>
								<span>*******</span>
							</div>
						</div>
						
						<hr>
						
					</div>
					
				</div>
			</form>
		</div>
		
		<div class="interest">
			<img class="home_icon" src="${cpath }/IKEA_image/interesting_home.svg">
			<div>
				<b>あなたについてもう少し教えてください</b>
				<p>よりあなたに合ったヒントやアイデアを提供できるよう、あなたの家について教えてください。</p><br>
				<a href="#none">始めましょう！</a>
			</div>
		</div>
	</div>
	
	<script>
		const items = document.querySelectorAll('.account_manage_info');
		items.forEach(item => item.addEventListener('click', modifyHandler));
	</script>
	
<%@ include file="../footer.jsp" %>