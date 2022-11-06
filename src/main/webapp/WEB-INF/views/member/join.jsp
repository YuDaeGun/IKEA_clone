<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="root">
	<div class="join_left">
		<div class="back">
			<a class="backicon2" href="javascript:history.go(-1)"><img src="${cpath }/IKEA_image/back2.svg"></a>
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
				<h1 class="join_blue"><span>IKEA Family</span><span class="join_black1">に登録する</span></h1>
				<div class="join_black2">
					<span>既にアカウントをお持ちですか？&nbsp;</span><a href="${cpath }/member/login" class="join_try">ログインする</a>
				</div><br><br>
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
				<span>IKEA.jp - <a class="cookie_pol_black" href="#none">クッキー ポリシー、</a>
				<a class="per_info_black" href="#none">プライバシーポリシー</a></span>
				<div>© Inter IKEA Systems B.V. 1999-2022</div>
			</div>
		</div>
	</div>
	<div class="join_right"><p>IKEA Family への入会は無料です。</p>
		<form method="POST">
			<div>
				<label for="input_lastName">姓　例：山田</label><br>
				<input id="input_lastName" name="member_name1" class="join_inputbox" autofocus required>
			</div>
			<div>
				<label for="input_lastName_furigana">姓 (フリガナ)　例：ヤマダ</label><br>
				<input id="input_lastName_furigana" name="member_name1_furigana" class="join_inputbox" required>
			</div>
			<div>
				<label for="input_firstName">名　例：太郎</label><br>
				<input id="input_firstName" name="member_name2" class="join_inputbox" required>
			</div>
			<div>
				<label for="input_firstName_furigana">名 (フリガナ)　例：タロウ</label><br>
				<input id="input_firstName_furigana" name="member_name2_furigana" class="join_inputbox" required>
			</div>
			<div class="input_birth_gender">
				<div>
					<label for="input_birth">誕生日</label><br>
					<input id="input_birth" name="member_birth" type="date" class="join_inputbirth" required><br>
					YYYY-MM-DD
				</div>
				<div>
					<label for="input_gender">性別</label><br>
					<select id="input_gender" name="member_gender" class="join_inputbox_small" required>
						<option value="">選択してください</option>
						<option value="M">男性</option>
						<option value="F">女性</option>
						<option value="X">応答拒否</option>
					</select>
				</div>
			</div>
			<div class="phone_number1">携帯（または固定電話）<br>
				<div class="phone_numberdiv">
					<span>&nbsp;JP(+81)</span>
					<input name="member_pnum" class="phone_number2" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
				</div>
			</div>
			<div>
				<label for="input_zipcode">郵便番号 (半角)</label><br>
				<input id="input_zipcode" name="member_zipcode" class="join_inputbox" required oninput="this.value = this.value.replace(/[^0-9-.]/g, '').replace(/(\..*?)\..*/g, '$1');">
			</div>
			<div>
				<label for="input_address1">都道府県</label><br>
				<select id="input_address1" name="member_address1" class="join_inputbox" required>
					<option value="">選択してください</option>
					<option value="北海道">北海道</option>
					<option value="青森県">青森県</option>
					<option value="岩手県">岩手県</option>
					<option value="宮城県">宮城県</option>
					<option value="秋田県">秋田県</option>
					<option value="山形県">山形県</option>
					<option value="福島県">福島県</option>
					<option value="茨城県">茨城県</option>
					<option value="栃木県">栃木県</option>
					<option value="群馬県">群馬県</option>
					<option value="埼玉県">埼玉県</option>
					<option value="千葉県">千葉県</option>
					<option value="東京都">東京都</option>
					<option value="神奈川県">神奈川県</option>
					<option value="新潟県">新潟県</option>
					<option value="富山県">富山県</option>
					<option value="石川県">石川県</option>
					<option value="福井県">福井県</option>
					<option value="山梨県">山梨県</option>
					<option value="長野県">長野県</option>
					<option value="岐阜県">岐阜県</option>
					<option value="静岡県">静岡県</option>
					<option value="愛知県">愛知県</option>
					<option value="三重県">三重県</option>
					<option value="滋賀県">滋賀県</option>
					<option value="京都府">京都府</option>
					<option value="大阪府">大阪府</option>
					<option value="兵庫県">兵庫県</option>
					<option value="奈良県">奈良県</option>
					<option value="和歌山県">和歌山県</option>
					<option value="鳥取県">鳥取県</option>
					<option value="島根県">島根県</option>
					<option value="岡山県">岡山県</option>
					<option value="広島県">広島県</option>
					<option value="山口県">山口県</option>
					<option value="徳島県">徳島県</option>
					<option value="香川県">香川県</option>
					<option value="愛媛県">愛媛県</option>
					<option value="高知県">高知県</option>
					<option value="福岡県">福岡県</option>
					<option value="佐賀県">佐賀県</option>
					<option value="長崎県">長崎県</option>
					<option value="熊本県">熊本県</option>
					<option value="大分県">大分県</option>
					<option value="宮崎県">宮崎県</option>
					<option value="鹿児島県">鹿児島県</option>
					<option value="沖縄県">沖縄県</option>
				</select>
			</div>
			<div>
				<label for="input_address2">市区町村</label><br>
				<input id="input_address2" name="member_address2" class="join_inputbox" required>
			</div>
			<div>
				<label for="input_address3">丁番地</label><br>
				<input id="input_address3" name="member_address3" class="join_inputbox" required>
			</div>
			<div>
				<label for="input_address4">建物名・部屋番号 （オプション）</label><br>
				<input id="input_address4" name="member_address4" class="join_inputbox">
			</div>
			<div>
				<label for="input_nearbystore">お近くのイケア店舗</label><br>
				<select id="input_nearbystore" name="member_nearbystore" class="join_inputbox" required>
					<option value="">選択してください</option>
					<option value="IKEA福岡新宮">IKEA福岡新宮</option>
					<option value="IKEA原宿">IKEA原宿</option>
					<option value="IKEA神戸">IKEA神戸</option>
					<option value="IKEA港北">IKEA港北</option>
					<option value="IKEA長久手">IKEA長久手</option>
					<option value="IKEA仙台">IKEA仙台</option>
					<option value="IKEA渋谷">IKEA渋谷</option>
					<option value="IKEA新宿">IKEA新宿</option>
					<option value="IKEA新三郷">IKEA新三郷</option>
					<option value="IKEA立川">IKEA立川</option>
					<option value="IKEA Tokyo-Bay">IKEA Tokyo-Bay</option>
					<option value="IKEA鶴浜">IKEA鶴浜</option>
				</select>
			</div>
			<div>
				<label for="input_email">メールアドレス</label><br>
				<input id="input_email" name="member_email" type="email" class="join_inputbox2" required>
				<div id="mailCheck" class="checkMsg"></div>
			</div>
			<div>
				<label for="password1">パスワード</label><br>
				<input id="password1" name="member_pw" type="password" class="join_inputbox2" required onkeyup="pwChecker1()">
				<img id="eyeIcon1" class="eyeImg" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(1)">
				<div id="pwCheck1" class="checkMsg">*特殊文字(!@#$%^&*)を含め、8~16文字</div>
			</div>
			<div>
				<label for="password2">パスワード再入力（確認用）</label><br>
				<input id="password2" type="password" class="join_inputbox2" required onkeyup="pwChecker2()">
				<img id="eyeIcon2" class="eyeImg" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(2)">
				<div id="pwCheck2" class="checkMsg"></div>
			</div>
			<div>
				<input type="checkbox" required>私は<a href="#none">プライバシーポリシー</a>を読み、同意しました。
			</div>
			<div>
				<input type="checkbox" required>読んで了解しました。<a href="#none">利用規約</a>
			</div>
			<div>
				<button id="join_complete" type="submit" class="join_submit_button">登録完了</button>
			</div>
		</form>
	</div>
</div>
	
<script>
	const input_email = document.getElementById('input_email')
	const join_complete = document.getElementById('join_complete')
	
	input_email.addEventListener('keyup', emailChecker)
	input_email.addEventListener('blur', emailChecker)
	join_complete.addEventListener('click', joinHandler)
</script>

</body>
</html>