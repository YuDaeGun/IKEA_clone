'use strict';

//	編集<->閉じる
function modifyHandler(event) {
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
function changeEye(event) {
    if (password.getAttribute("type") == "password") {
        password.setAttribute("type", "text")
        eyeIcon.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
    } else if (password.getAttribute("type") == "text") {
        password.setAttribute("type", "password")
        eyeIcon.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
    }
}
//	メールアドレス重複チェック
function emailChecker(event) {
	const email = document.getElementById('input_email').value;
	
	document.getElementById('mailCheck').innerHTML = ''
	document.getElementById('mailCheck').style.color = 'blue';
	
	const url = cpath + '/member/emailDupCheck/' + email.replace('.', '_')
	fetch(url).then(resp => resp.json())
	.then(json => {
        if(json != null)
        	document.getElementById('mailCheck').innerHTML = '既に登録済みのメールアドレスです'
    		document.getElementById('mailCheck').style.color = 'red';
    })
}
//	パスワードの制約条件チェック
function pwChecker1(event) {
	document.getElementById('input_pw_re').value = ''
	document.getElementById('pwCheck2').innerHTML = ''
	
    const pw = document.getElementById('input_pw').value;
    const sc = ["!", "@", "#", "$", "%", "^", "&", "*"];
    let checkSC = false;

    for (let i = 0; i < sc.length; i++) {
    	if (pw.indexOf(sc[i]) != -1) {
            checkSC = true;
            continue;
    	}
    }
    if (pw.length < 8 || pw.length > 16) {
        document.getElementById('pwCheck1').innerHTML = 'パスワードは８文字以上、16文字以下で入力してください';
        document.getElementById('pwCheck1').style.color = 'red';
        return;
    }
    if (!checkSC) {
        document.getElementById('pwCheck1').innerHTML = '一つ以上の特殊文字(!@#$%^&*)を含めて下さい';
        document.getElementById('pwCheck1').style.color = 'red';
        return;
    }
	document.getElementById('pwCheck1').innerHTML = '使用可能';
	document.getElementById('pwCheck1').style.color = 'blue';
}
//	再入力パスワードか原本パスワードと一致するかチェック
function pwChecker2(event) {
    if (document.getElementById('input_pw').value != '' && document.getElementById('input_pw_re').value != '') {
        if (document.getElementById('input_pw').value == document.getElementById('input_pw_re').value) {
            document.getElementById('pwCheck2').innerHTML = 'パスワードが一致します'
            document.getElementById('pwCheck2').style.color = 'blue';
            return;
        }
        document.getElementById('pwCheck2').innerHTML = 'パスワードが一致しません';
        document.getElementById('pwCheck2').style.color = 'red';
    }
}
//	メールアドレスやパスワードの入力に問題があった場合、登録完了に進ませない
function submitHandler(event) {
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







