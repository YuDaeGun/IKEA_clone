<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<main>
	<div class="root">
		<div class="left">
			<div class="back">
				<a class="backicon" href="javascript:history.go(-1)"><img src="${cpath }/IKEA_image/back.svg"></a>
			</div>
			<div class="login_main">
				<div class="login_ex_img">
					<div class="login_logo">
						<a href="${cpath }"><img src="${cpath }/IKEA_image/white_Logo.svg"></a>
					</div>
				</div>
				<div class="login_ex">
					<h1>マイページへログイン</h1>
					<p class="login_white">
						パスワードの管理にお困りですか？<br>
						ワンタイムコードをメールで受け取るか携帯番号を確認してください。<br><br>
						メールアドレスでログイン後、マイページから携帯番号を確認してください。
					</p>
				</div>
				<div class="login_white2">
					<span>IKEA.jp - <a class="cookie_pol" href="#none">クッキー ポリシー、</a>
					<a class="per_info" href="#none">プライバシーポリシー</a></span>
					<div>© Inter IKEA Systems B.V. 1999-2022</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="login_act">
				<form method="POST">
					<div class="login_act_Id">
						<label for="input_mail">メールアドレス</label><br>
						<input id="input_mail" type="text" class="username" name="member_email" required value="${member_email}">
					</div>
					<div class="login_act_pw">
						<label for="password">パスワードを入力</label><br>
						<div class="pwbt">
							<div>
								<div class="d1">
									<input id="password" type="password" class="password_input_vi" name="member_pw" required>
									<img id="eyeIcon" class="eye_visible" src="${cpath }/IKEA_image/pw_show.svg">
								</div>
							</div>
							<a href="IKEA_Pw_find" class="find_pw">パスワードをお忘れですか?</a>
						</div><br><br>
						<div>
							<button type="submit" class="login_bt">
								<span>続ける</span>
							</button>
						</div>
					</div>
				</form>
				<p>イケアのアカウントをお持ちではありませんか？今すぐ作成：</p>
				<div>
					<button type="button" class="join_bt" onclick="location.href='${cpath }/member/join'">
						<span>一般のお客さまはこちら</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	</main>
	
	<script>
		const b1 = document.getElementById('eyeIcon')
		const password = document.getElementById('password')
	
		b1.addEventListener('click', chan)
	</script>

</body>
</html>















