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
	<div>
		<button class="modify_tab selected" onclick="tabHandler(1)">アカウント</button>
		<button class="modify_tab" onclick="tabHandler(2)">住所一覧</button>
		<button class="modify_tab" onclick="tabHandler(3)">設定</button>
	</div>

	<div class="modifyDiv">
		<div class="modify_account">	<!-- アカウント tab -->
			<div class="modify_items">
				<form method="post">
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
							<input name="member_name1" class="account_insert" type="text" value="${loginInfo.member_name1 }" required></label>
						</div>
						<div>
							<label>姓 (フリガナ)　例：ヤマダ
							<input name="member_name1_furigana" class="account_insert" type="text" value="${loginInfo.member_name1_furigana }" required></label>
						</div>
						<div>
							<label>名　例：太郎
							<input name="member_name2" class="account_insert" type="text" value="${loginInfo.member_name2 }" required></label>
						</div>
						<div>
							<label>名 (フリガナ)　例：タロウ
							<input name="member_name2_furigana" class="account_insert" type="text" value="${loginInfo.member_name2_furigana }" required></label>
						</div>
						<div>
							<label>誕生日 (YYYY-MM-DD)　例：1990-07-03
							<input name="member_birth" class="account_insert" type="date" value="${loginInfo.member_birth }" required></label>
						</div>
						<div>
							<span>性別</span>
							<div class="genderRadio">
								<div>
									<input id="radio_M" name="member_gender" type="radio" value="M" ${loginInfo.member_gender == 'M' ? 'checked' : '' } required>
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
				</form>
			</div>
			<hr>
			<div class="modify_items">
				<form method="post">
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
							<input name="member_pnum" class="account_insert" type="text" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"></label>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_pnum').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>新しい電話番号を登録</span>
						</button>
					</div>
				</form>
			</div>
			<hr>
			<div class="modify_items">
				<form method="post">
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
							<input id="input_email" name="member_email" class="account_insert" type="email" required></label>
							<div id="mailCheck" class="checkMsg"></div>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_email').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>新しいメールアドレスを登録</span>
						</button>
					</div>
				</form>
			</div>
			<hr>
			<div class="modify_items">
				<form method="post">
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
							<input id="password1" name="member_pw" type="password" class="pw_insert" required onkeyup="pwChecker1()">
							<img id="eyeIcon1" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(1)">
							<div id="pwCheck1" class="checkMsg">*特殊文字(!@#$%^&*)を含め、8~16文字</div>
						</div>
						<div>
							<label for="password2">新しいパスワード再入力（確認用）</label><br>
							<input id="password2" type="password" class="pw_insert" required onkeyup="pwChecker2()">
							<img id="eyeIcon2" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(2)">
							<div id="pwCheck2" class="checkMsg"></div>
						</div>
						<div>
							<label for="password3">古いパスワードで変更を確認*</label><br>
							<input id="password3" type="password" class="pw_insert" required onkeyup="pwChecker3()">
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
				</form>				
			</div>
			<hr>
			<div class="interest">
				<img class="home_icon" src="${cpath }/IKEA_image/interesting_home.svg">
				<div>
					<b>あなたについてもう少し教えてください</b>
					<p>よりあなたに合ったヒントやアイデアを提供できるよう、あなたの家について教えてください。</p><br>
					<a href="#none">始めましょう！</a>
				</div>
			</div>
		</div>
		
		<div class="modify_address displayNone">	<!-- 住所一覧 tab -->
			<div class="modify_items">
				<form method="post">
					<div class="modify_item">
						<b>メインの住所</b>
						<span class="account_modify" id="modify_addr">編集</span>
					</div>
					<div id="modify_addr_preview">
						<p>${loginInfo.member_zipcode }</p>
						<p>${loginInfo.member_address1 } ${loginInfo.member_address2 }</p>
						<p>${loginInfo.member_address3 } ${loginInfo.member_address4 }</p>
					</div>
					<div class="displayNone" id="modify_addr_toggle">
						<div>
							<label>郵便番号 (半角)
							<input name="member_zipcode" class="account_insert" type="text" value="${loginInfo.member_zipcode }" required></label>
						</div>
						<div>
							<label for="modi_addr1">都道府県</label>
							<div class="account_insert">
								<select id="modi_addr1" name="member_address1" class="modify_selectBox" required>
									<option value="北海道" ${loginInfo.member_address1 == '北海道' ? 'selected' : '' }>北海道</option>
									<option value="青森県" ${loginInfo.member_address1 == '青森県' ? 'selected' : '' }>青森県</option>
									<option value="岩手県" ${loginInfo.member_address1 == '岩手県' ? 'selected' : '' }>岩手県</option>
									<option value="宮城県" ${loginInfo.member_address1 == '宮城県' ? 'selected' : '' }>宮城県</option>
									<option value="秋田県" ${loginInfo.member_address1 == '秋田県' ? 'selected' : '' }>秋田県</option>
									<option value="山形県" ${loginInfo.member_address1 == '山形県' ? 'selected' : '' }>山形県</option>
									<option value="福島県" ${loginInfo.member_address1 == '福島県' ? 'selected' : '' }>福島県</option>
									<option value="茨城県" ${loginInfo.member_address1 == '茨城県' ? 'selected' : '' }>茨城県</option>
									<option value="栃木県" ${loginInfo.member_address1 == '栃木県' ? 'selected' : '' }>栃木県</option>
									<option value="群馬県" ${loginInfo.member_address1 == '群馬県' ? 'selected' : '' }>群馬県</option>
									<option value="埼玉県" ${loginInfo.member_address1 == '埼玉県' ? 'selected' : '' }>埼玉県</option>
									<option value="千葉県" ${loginInfo.member_address1 == '千葉県' ? 'selected' : '' }>千葉県</option>
									<option value="東京都" ${loginInfo.member_address1 == '東京都' ? 'selected' : '' }>東京都</option>
									<option value="神奈川県" ${loginInfo.member_address1 == '神奈川県' ? 'selected' : '' }>神奈川県</option>
									<option value="新潟県" ${loginInfo.member_address1 == '新潟県' ? 'selected' : '' }>新潟県</option>
									<option value="富山県" ${loginInfo.member_address1 == '富山県' ? 'selected' : '' }>富山県</option>
									<option value="石川県" ${loginInfo.member_address1 == '石川県' ? 'selected' : '' }>石川県</option>
									<option value="福井県" ${loginInfo.member_address1 == '福井県' ? 'selected' : '' }>福井県</option>
									<option value="山梨県" ${loginInfo.member_address1 == '山梨県' ? 'selected' : '' }>山梨県</option>
									<option value="長野県" ${loginInfo.member_address1 == '長野県' ? 'selected' : '' }>長野県</option>
									<option value="岐阜県" ${loginInfo.member_address1 == '岐阜県' ? 'selected' : '' }>岐阜県</option>
									<option value="静岡県" ${loginInfo.member_address1 == '静岡県' ? 'selected' : '' }>静岡県</option>
									<option value="愛知県" ${loginInfo.member_address1 == '愛知県' ? 'selected' : '' }>愛知県</option>
									<option value="三重県" ${loginInfo.member_address1 == '三重県' ? 'selected' : '' }>三重県</option>
									<option value="滋賀県" ${loginInfo.member_address1 == '滋賀県' ? 'selected' : '' }>滋賀県</option>
									<option value="京都府" ${loginInfo.member_address1 == '京都府' ? 'selected' : '' }>京都府</option>
									<option value="大阪府" ${loginInfo.member_address1 == '大阪府' ? 'selected' : '' }>大阪府</option>
									<option value="兵庫県" ${loginInfo.member_address1 == '兵庫県' ? 'selected' : '' }>兵庫県</option>
									<option value="奈良県" ${loginInfo.member_address1 == '奈良県' ? 'selected' : '' }>奈良県</option>
									<option value="和歌山県" ${loginInfo.member_address1 == '和歌山県' ? 'selected' : '' }>和歌山県</option>
									<option value="鳥取県" ${loginInfo.member_address1 == '鳥取県' ? 'selected' : '' }>鳥取県</option>
									<option value="島根県" ${loginInfo.member_address1 == '島根県' ? 'selected' : '' }>島根県</option>
									<option value="岡山県" ${loginInfo.member_address1 == '岡山県' ? 'selected' : '' }>岡山県</option>
									<option value="広島県" ${loginInfo.member_address1 == '広島県' ? 'selected' : '' }>広島県</option>
									<option value="山口県" ${loginInfo.member_address1 == '山口県' ? 'selected' : '' }>山口県</option>
									<option value="徳島県" ${loginInfo.member_address1 == '徳島県' ? 'selected' : '' }>徳島県</option>
									<option value="香川県" ${loginInfo.member_address1 == '香川県' ? 'selected' : '' }>香川県</option>
									<option value="愛媛県" ${loginInfo.member_address1 == '愛媛県' ? 'selected' : '' }>愛媛県</option>
									<option value="高知県" ${loginInfo.member_address1 == '高知県' ? 'selected' : '' }>高知県</option>
									<option value="福岡県" ${loginInfo.member_address1 == '福岡県' ? 'selected' : '' }>福岡県</option>
									<option value="佐賀県" ${loginInfo.member_address1 == '佐賀県' ? 'selected' : '' }>佐賀県</option>
									<option value="長崎県" ${loginInfo.member_address1 == '長崎県' ? 'selected' : '' }>長崎県</option>
									<option value="熊本県" ${loginInfo.member_address1 == '熊本県' ? 'selected' : '' }>熊本県</option>
									<option value="大分県" ${loginInfo.member_address1 == '大分県' ? 'selected' : '' }>大分県</option>
									<option value="宮崎県" ${loginInfo.member_address1 == '宮崎県' ? 'selected' : '' }>宮崎県</option>
									<option value="鹿児島県" ${loginInfo.member_address1 == '鹿児島県' ? 'selected' : '' }>鹿児島県</option>
									<option value="沖縄県" ${loginInfo.member_address1 == '沖縄県' ? 'selected' : '' }>沖縄県</option>
								</select>
							</div>
						</div>
						<div>
							<label>市区町村
							<input name="member_address2" class="account_insert" type="text" value="${loginInfo.member_address2 }" required></label>
						</div>
						<div>
							<label>丁番地
							<input name="member_address3" class="account_insert" type="text" value="${loginInfo.member_address3 }" required></label>
						</div>
						<div>
							<label>建物名・部屋番号 （任意）
							<input name="member_address4" class="account_insert" type="text" value="${loginInfo.member_address4 }"></label>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_addr').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>変更を保存</span>
						</button>
					</div>
				</form>
			</div>
			<hr>
			<div class="space"></div>
		</div>
		
		<div class="modify_setting displayNone">	<!-- 設定 tab -->
			<div class="modify_items">
				<form method="post">
					<div class="modify_item">
						<b>お近くのイケア店舗</b>
						<span class="account_modify" id="modify_nearbystore">編集</span>
					</div>
					<div id="modify_nearbystore_preview">
						<p>${loginInfo.member_nearbystore }</p>
					</div>
					<div class="displayNone" id="modify_nearbystore_toggle">
						<div class="account_insert">
							<select id="modi_nbs" name="member_nearbystore" class="modify_selectBox" required>
								<option value="IKEA福岡新宮" ${loginInfo.member_nearbystore == 'IKEA福岡新宮' ? 'selected' : '' }>IKEA福岡新宮</option>
								<option value="IKEA原宿" ${loginInfo.member_nearbystore == 'IKEA原宿' ? 'selected' : '' }>IKEA原宿</option>
								<option value="IKEA神戸" ${loginInfo.member_nearbystore == 'IKEA神戸' ? 'selected' : '' }>IKEA神戸</option>
								<option value="IKEA港北" ${loginInfo.member_nearbystore == 'IKEA港北' ? 'selected' : '' }>IKEA港北</option>
								<option value="IKEA長久手" ${loginInfo.member_nearbystore == 'IKEA長久手' ? 'selected' : '' }>IKEA長久手</option>
								<option value="IKEA仙台" ${loginInfo.member_nearbystore == 'IKEA仙台' ? 'selected' : '' }>IKEA仙台</option>
								<option value="IKEA渋谷" ${loginInfo.member_nearbystore == 'IKEA渋谷' ? 'selected' : '' }>IKEA渋谷</option>
								<option value="IKEA新宿" ${loginInfo.member_nearbystore == 'IKEA新宿' ? 'selected' : '' }>IKEA新宿</option>
								<option value="IKEA新三郷" ${loginInfo.member_nearbystore == 'IKEA新三郷' ? 'selected' : '' }>IKEA新三郷</option>
								<option value="IKEA立川" ${loginInfo.member_nearbystore == 'IKEA立川' ? 'selected' : '' }>IKEA立川</option>
								<option value="IKEA Tokyo-Bay" ${loginInfo.member_nearbystore == 'IKEA Tokyo-Bay' ? 'selected' : '' }>IKEA Tokyo-Bay</option>
								<option value="IKEA鶴浜" ${loginInfo.member_nearbystore == 'IKEA鶴浜' ? 'selected' : '' }>IKEA鶴浜</option>
							</select>
						</div>
						<button type="button" class="modify_cancel" onclick="document.getElementById('modify_nearbystore').click()">
							<span>キャンセル</span>
						</button>
						<button type="submit" class="modify_submit">
							<span>変更を保存</span>
						</button>
					</div>
				</form>
			</div>
			<hr>			
			<div class="modify_items">
				<div class="modify_item">
					<b>プロフィールの削除</b>
				</div>
				<p>お客様情報はいつでも削除できます。プロフィールの他に、関連付けられた情報が削除されます。</p>
				<a href="${cpath }/member/delete"
					onclick="return confirm('以下のアカウントを削除してもよろしいでしょうか？\n${loginInfo.member_email }') ? alert('個人情報と欲しいものリストをすべて消去します。 \n'
							+ 'また、IKEA Familyの特典も利用できなくなります。\n'
							+ '税金やその他の法的な理由により、購入履歴は引き続き保持されます。'
							+ 'ご利用いただきありがとうございました。またのご利用お待ちしております。') : false">アカウントを削除しますか?</a>
			</div>
			<div class="space"></div>
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