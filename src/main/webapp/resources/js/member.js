'use strict';

function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if (document.getElementById(answerId).style.display === 'block') {
        document.getElementById(answerId).style.display = 'none';
        document.getElementById(this.id + '-toggle').textContent = '수정';
    } else {
        document.getElementById(answerId).style.display = 'block';
        document.getElementById(this.id + '-toggle').textContent = '닫기';
    }
}

function pwChecker1(event) {
    let pw = document.getElementById('input_pw').value;
    let sc = ["!", "@", "#", "$", "%", "^", "&", "*"];
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
        input_pw.value = "";
        input_pw.focus();
        return;
    }
    if (!checkSC) {
        document.getElementById('pwCheck1').innerHTML = '一つ以上の特殊文字(!@#$%^&*)を含めて下さい';
        document.getElementById('pwCheck1').style.color = 'red';
        input_pw.value = "";
        input_pw.focus();
        return;
    }
	document.getElementById('pwCheck1').innerHTML = '使用可能';
	document.getElementById('pwCheck1').style.color = 'blue';
}
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

function allCheck(event) {
    const input_pw = document.getElementById('input_pw')
    const input_pw_re = document.getElementById('input_pw_re')
    
    if (input_pw.value == input_pw_re.value) {
    	alert('登録成功')
    } else {
    	alert('登録失敗')
//    	event.preventDefault()
    }
}

function changeEye(event) {
    if (password.getAttribute("type") == "password") {
        password.setAttribute("type", "text")
        eyeIcon.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
    } else if (password.getAttribute("type") == "text") {
        password.setAttribute("type", "password")
        eyeIcon.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
    }
}

function submitHandler(event) {
    event.preventDefault()
    const formData = new FormData(event.target)
    const ob = {}
    for (let key of formData.keys()) {
        ob[key] = formData.get(key)
    }

    fetch(cpath + '/member/IKEA_Pw_find', {
            method: 'POST',
            body: JSON.stringify(ob),
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            }
        })

        .then(resp => resp.text())
        .then(text => {
            alert(text)
            location.href = 'http://localhost:8080/' + cpath + '/member/IKEA_Login'
        })
}