<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="header.jsp" %>

<div class="account_manage">
	<div class="account_title">
		<h1 class="account_big_title">登録内容を更新する</h1>
		<span class="account_small_title">別のアカウントでログインしますか？
			<a class="account_manage_logout" href="${cpath }/member/logout">ログアウト</a>
		</span>
	</div>
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

	<div class="modifyDiv">
		<form method="POST">
		
			<div class="modify_account">	<!-- 한 덩이 -->
				<div class="modify_items">
					<div class="modify_item">
						<b>お名前</b>
						<span class="account_modify" id="modify_name">編集</span>
					</div>
					<div id="modify_name_preview">
						<p>${loginInfo.member_name1 } ${loginInfo.member_name2 }</p>
						<p>${loginInfo.member_birth }</p>
						<p>${loginInfo.member_gender == 'M' ? '男性' : loginInfo.member_gender == 'F' ? '女性' : '応答拒否'}</p>
					</div>
					<div class="displayNone" id="modify_name_toggle">
						<div>
							<label>姓　例：山田
							<input name="member_name1" class="account_insert" type="text" value="${loginInfo.member_name1 }"></label>
						</div>
						<div>
							<label>姓 (フリガナ)　例：ヤマダ
							<input name="member_name1_furigana" class="account_insert" type="text" value="${loginInfo.member_name1_furigana }"></label>
						</div>
						<div>
							<label>名　例：太郎
							<input name="member_name2" class="account_insert" type="text" value="${loginInfo.member_name2 }"></label>
						</div>
						<div>
							<label>名 (フリガナ)　例：タロウ
							<input name="member_name2_furigana" class="account_insert" type="text" value="${loginInfo.member_name2_furigana }"></label>
						</div>
						<div>
							<label>誕生日 (YYYY-MM-DD)　例：1990-07-03
							<input name="member_birth" class="account_insert" type="date" value="${loginInfo.member_birth }"></label>
						</div>
						<div>
							<span>性別</span>
							<div class="genderRadio">
								<div>
									<input id="radio_M" name="member_gender" type="radio" value="M" ${loginInfo.member_gender == 'M' ? 'checked' : '' }>
									<label for="radio_M">男性</label>
								</div>
								<div>
									<input id="radio_F" name="member_gender" type="radio" value="F" ${loginInfo.member_gender == 'F' ? 'checked' : '' }>
									<label for="radio_F">女性</label>
								</div>
								<div>
									<input id="radio_X" name="member_gender" type="radio" value="X" ${loginInfo.member_gender == 'X' ? 'checked' : '' }>
									<label for="radio_X">言わないでおく</label>
								</div>
							</div>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_name').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>変更を保存</span>
						</button>
					</div>
				</div>
				<hr>
				<div class="modify_items">
					<div class="modify_item">
						<b>連絡先</b>
						<span class="account_modify" id="modify_pnum">編集</span>
					</div>
					<div id="modify_pnum_preview">
						<p>+82 ${loginInfo.member_pnum }</p>
					</div>
					<div class="displayNone" id="modify_pnum_toggle">
						<div>
							<label>新しい電話番号
							<input name="member_pnum" class="account_insert" type="text"></label>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_pnum').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>新しい電話番号を登録</span>
						</button>
					</div>
				</div>
				<hr>
				<div class="modify_items">
					<div class="modify_item">
						<b>メールアドレス</b>
						<span class="account_modify" id="modify_email">編集</span>
					</div>
					<div id="modify_email_preview">
						<p>${loginInfo.member_email }</p>
					</div>
					<div class="displayNone" id="modify_email_toggle">
						<div>
							<label>新しいメールアドレス
							<input id="input_email" name="member_email" class="account_insert" type="email"></label>
							<div id="mailCheck" class="checkMsg"></div>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_email').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>新しいメールアドレスを登録</span>
						</button>
					</div>
				</div>
				<hr>
				<div class="modify_items">
					<div class="modify_item">
						<b>パスワード</b>
						<span class="account_modify" id="modify_pw">編集</span>
					</div>
					<div id="modify_pw_preview">
						<p>••••••••</p>
					</div>
					<div class="displayNone" id="modify_pw_toggle">
						<div>
							<label for="password1">新しいパスワード</label><br>
							<input id="password1" name="member_pw" type="password" class="pw_insert" onkeyup="pwChecker1()">
							<img id="eyeIcon1" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(1)">
							<div id="pwCheck1" class="checkMsg">*特殊文字(!@#$%^&*)を含め、8~16文字</div>
						</div>
						<div>
							<label for="password2">新しいパスワード再入力（確認用）</label><br>
							<input id="password2" type="password" class="pw_insert" onkeyup="pwChecker2()">
							<img id="eyeIcon2" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(2)">
							<div id="pwCheck2" class="checkMsg"></div>
						</div>
						<div>
							<label for="password3">古いパスワードで変更を確認*</label><br>
							<input id="password3" type="password" class="pw_insert" onkeyup="pwChecker3()">
							<img id="eyeIcon3" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(3)">
							<div id="pwCheck3" class="checkMsg"></div>
						</div>
						
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_pw').click()">
							<span>キャンセル</span>
						</button>
						<button id="modyfyPw_complete" type="submit" class="modify_submit">
							<span>新しいパスワードを登録</span>
						</button>
					</div>					
					
				</div>
				<hr>
			</div>
			
			<div class="modify_address"></div>
			<div class="modify_setting"></div>
			

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
	const items = document.querySelectorAll('.modify_item');
	const input_email = document.getElementById('input_email')
// 	const modyfyPw_complete = document.getElementById('modyfyPw_complete')
	
	items.forEach(item => item.addEventListener('click', modifyHandler));
	input_email.addEventListener('keyup', emailChecker)
	input_email.addEventListener('blur', emailChecker)
	
// 	join_complete.addEventListener('click', submitHandler)
</script>
	
	
<%@ include file="../footer.jsp" %>