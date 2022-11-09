<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="root">
	<div class="left">
		<div class="back">
			<a class="backicon" href="javascript:history.go(-1)"><img src="${cpath }/IKEA_image/back.svg"></a>
		</div>
		<div class="login_main">
			<div class="toggle_left_img">
				<div class="login_logo">
					<a href="${cpath }"><img src="${cpath }/IKEA_image/white_Logo.svg"></a>
				</div>
			</div>
			
			<div class="toggle_left">
				<h1 class="login_title">マイページへログイン</h1>
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
		<div class="toggle_right">
			<form method="POST">
				<div class="toggle_right_Id">
					<label for="input_mail">メールアドレス</label><br>
					<input id="input_mail" type="email" class="username" name="member_email" required value="${member_email}">
				</div>
				<div class="toggle_right_pw">
					<label for="password">パスワードを入力</label><br>
					<div class="login_input_pw">
						<input id="password1" type="password" name="member_pw" required>
						<img id="eyeIcon1" src="${cpath }/IKEA_image/openeye.jpg" onclick="changeEye(1)">
					</div>
					<span class="forget_pw" onclick="forgetPw()">パスワードをお忘れですか?</span>
				</div>
				<div>
					<button type="submit" class="login_bt">
						<span>続ける</span>
					</button>
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

</body>
</html>















