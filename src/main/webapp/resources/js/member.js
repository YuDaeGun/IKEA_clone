'use strict';

//	tab変更（アカウント　<->　住所一覧　<->　設定）
function tabHandler(n) {
	const tabs = document.querySelectorAll('.modify_tab');
	const modify_account = document.querySelector('.modify_account')
	const modify_address = document.querySelector('.modify_address')
	const modify_setting = document.querySelector('.modify_setting')
	
	tabs.forEach(tab => tab.classList.remove('selected'))
	
	if (n == 1) {
		tabs[0].classList.add('selected')
		modify_account.classList.remove('displayNone')
		modify_address.classList.add('displayNone')
		modify_setting.classList.add('displayNone')
	} else if (n == 2) {
		tabs[1].classList.add('selected')
		modify_account.classList.add('displayNone')
		modify_address.classList.remove('displayNone')
		modify_setting.classList.add('displayNone')
	} else {
		tabs[2].classList.add('selected')
		modify_account.classList.add('displayNone')
		modify_address.classList.add('displayNone')
		modify_setting.classList.remove('displayNone')
	}
}

//	編集<->閉じる
function modifyHandler() {
    const eventElement = document.getElementById(event.target.id)
    const toggleMenu1 = document.getElementById(event.target.id + '_toggle')
    const toggleMenu2 = document.getElementById(event.target.id + '_preview')
    
    if (toggleMenu1.style.display == 'block') {
    	toggleMenu1.style.display = 'none';
    	toggleMenu2.style.display = 'block';
    	eventElement.textContent = '編集';
    } else {
    	toggleMenu1.style.display = 'block';
    	toggleMenu2.style.display = 'none';
    	eventElement.textContent = '閉じる';
    }
}
//	目玉アイコンをクリックすると、パスワードを表示<->非表示
function changeEye(n) {
	const element = document.getElementById('password' + n)
	const icon = document.getElementById('eyeIcon' + n)
	
	if (element.getAttribute("type") == "password") {
		element.setAttribute("type", "text")
		icon.setAttribute("src", cpath + "/IKEA_image/closeeye.jpg")
	} else {
		element.setAttribute("type", "password")
		icon.setAttribute("src", cpath + "/IKEA_image/openeye.jpg")
	}
}
//	メールアドレス重複チェック
function emailChecker() {
	const email = document.getElementById('input_email').value
	
	document.getElementById('mailCheck').innerHTML = ''
	document.getElementById('mailCheck').style.color = 'blue'
	
	const url = cpath + '/member/emailDupCheck/' + email.replace('.', '_')
	fetch(url).then(resp => resp.json())
	.then(json => {
        if (json != null) {
        	document.getElementById('mailCheck').innerHTML = '既に登録済みのメールアドレスです'
    		document.getElementById('mailCheck').style.color = 'red';
        }
    })
}
//	パスワードの制約条件チェック
function pwChecker1() {
	document.getElementById('password2').value = ''
	document.getElementById('pwCheck2').innerHTML = ''
	
    const pw = document.getElementById('password1').value
    const sc = ["!", "@", "#", "$", "%", "^", "&", "*"]
    let checkSC = false;

    for (let i = 0; i < sc.length; i++) {
    	if (pw.indexOf(sc[i]) != -1) {
            checkSC = true;
            continue;
    	}
    }
    if (pw.length < 8 || pw.length > 16) {
        document.getElementById('pwCheck1').innerHTML = 'パスワードは８文字以上、16文字以下で入力してください'
        document.getElementById('pwCheck1').style.color = 'red'
        return;
    }
    if (!checkSC) {
        document.getElementById('pwCheck1').innerHTML = '一つ以上の特殊文字(!@#$%^&*)を含めて下さい'
        document.getElementById('pwCheck1').style.color = 'red'
        return;
    }
	document.getElementById('pwCheck1').innerHTML = '使用可能'
	document.getElementById('pwCheck1').style.color = 'blue'
}
//	再入力パスワードか原本パスワードと一致するかチェック
function pwChecker2() {
    if (document.getElementById('password1').value != '' && document.getElementById('password2').value != '') {
        if (document.getElementById('password1').value == document.getElementById('password2').value) {
            document.getElementById('pwCheck2').innerHTML = 'パスワードが一致します'
            document.getElementById('pwCheck2').style.color = 'blue'
            return;
        }
        document.getElementById('pwCheck2').innerHTML = 'パスワードが一致しません'
        document.getElementById('pwCheck2').style.color = 'red'
    }
}
//	現在のパスワードと一致するかチェック
function pwChecker3() {
	const pw = document.getElementById('password3').value
	
	document.getElementById('pwCheck3').innerHTML = 'パスワードが一致しません'
	document.getElementById('pwCheck3').style.color = 'red'

	const url = cpath + '/member/pwMatchCheck/' + pw
	fetch(url).then(resp => resp.json())
	.then(json => {
        if (json != null) {
        	document.getElementById('pwCheck3').innerHTML = 'パスワードが一致します'
    		document.getElementById('pwCheck3').style.color = 'blue';
        }
    })
}
//	メールアドレスやパスワードの入力に問題があった場合、登録完了に進ませない (会員登録ページ)
function joinHandler() {
	const mail = document.getElementById('mailCheck').style.color
	const pw1 = document.getElementById('pwCheck1').style.color
	const pw2 = document.getElementById('pwCheck2').style.color
	
	if (input_email.value != '' && mail != 'blue') {
		alert('メールアドレスをもう一度確認してください')
		event.preventDefault()
		return
	}
	if (pw1 == 'red' || pw2 == 'red') {
		alert('パスワードをもう一度確認してください')
		event.preventDefault()
		return
	}
}
//	メールアドレスに問題があった場合、情報変更不可 (マイページ)
function modifyEmailHandler() {
	const mail = document.getElementById('mailCheck').style.color
	
	if (input_email.value != '' && mail != 'blue') {
		alert('新しいメールアドレスをもう一度確認してください')
		event.preventDefault()
		return
	}
}
//	パスワードに問題があった場合、情報変更不可 (マイページ)
function modifyPwHandler() {
	const pw1 = document.getElementById('pwCheck1').style.color
	const pw2 = document.getElementById('pwCheck2').style.color
	const pw3 = document.getElementById('pwCheck3').style.color
	
	if (pw1 == 'red' || pw2 == 'red' || pw3 == 'red') {
		alert('パスワードをもう一度確認してください')
		event.preventDefault()
		return
	}
}
//	ログインページの画面転換
function forgetPw() {
	const toggle_left = document.querySelector('.toggle_left')
	toggle_left.innerHTML = '<h1 class="login_title">パスワードリセット</h1>'
						  + '<p class="login_white">'
						      + 'メールアドレスを入力し、臨時パスワードを受信する。'
						  + '</p>'
						
	const toggle_right = document.querySelector('.toggle_right')
	toggle_right.innerHTML = '<form>'
							   + '<div class="pwResetSpace"></div>'
							   + '<div class="toggle_right_Id">'
							       + '<label for="input_mail">確認済みのメールアドレス</label><br>'
							       + '<input id="input_mail" type="email" class="username" required>'
							   + '</div>'
							   + '<div>'
							       + '<button class="login_bt" onclick="sendMail()">'
							           + '<span>パスワードをリセットする</span>'
							       + '</button>'
							   + '</div>'
						   + '</form>'
}
// sendMail() functionを作成 -> msg : 送信されるメール本文にある説明にしたがってパスワードを再登録してください。　メール受信には10分少々かかることがあります。





