'use strict';

function openCloseAnswer() {
  const answerId = this.id.replace('que', 'ans');

  if(document.getElementById(answerId).style.display === 'block') {
    document.getElementById(answerId).style.display = 'none';
    document.getElementById(this.id + '-toggle').textContent = '수정';
  } else {
    document.getElementById(answerId).style.display = 'block';
    document.getElementById(this.id + '-toggle').textContent = '닫기';
  }
}


function daumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== ''
					&& /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== ''
					&& data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("daum_postcode").value = data.zonecode;
			document.getElementById("daum_roadAddress").value = roadAddr;
			document.getElementById("daum_jibunAddress").value = data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if (roadAddr !== '') {
				document.getElementById("daum_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("daum_extraAddress").value = '';
			}

			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if (data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress
						+ extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : '
						+ expRoadAddr + ')';
				guideTextBox.style.display = 'block';

			} else if (data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : '
						+ expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			} else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
		}
	}).open();
}

function checkPassword1(event) {
    let pw = document.getElementById('new_pw').value;
    let sc = ["!","@","#","$","%","^","&","*"];
    let check_SC = 0;
    
    for(let i=0;i < sc.length; i++){
        if(pw.indexOf(sc[i]) != -1){
            check_SC = 1;
        }
    }
    if(pw.length < 8 || pw.length > 16){
        document.getElementById('check1').innerHTML='비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.';
        document.getElementById('check1').style.color='red';
        document.getElementById('check1').style.fontSize='15px';
        document.getElementById('check1').classList.add('impo')
        new_pw.value = "";
        new_pw.focus();
        return false;
        
     
    }
    if(check_SC == 0){
            document.getElementById('check1').innerHTML='특수문자가 들어가 있지 않습니다.';
            document.getElementById('check1').style.color='red';
            document.getElementById('check1').style.fontSize='15px';
            document.getElementById('check1').classList.add('impo')
            document.getElementById('new_pw').value='';
            new_pw.value = "";
            new_pw.focus();
            return false;
        }
    if(check_SC == 1){
       document.getElementById('check1').innerHTML='사용가능합니다.';
        document.getElementById('check1').style.color='blue';
        document.getElementById('check1').style.fontSize='15px';
        document.getElementById('check1').classList.remove('impo')
        return true;
    }
       
  }


  function checkPassword2(event) {
      if(document.getElementById('new_pw').value !='' && document.getElementById('new_pw_re').value!=''){
           if(document.getElementById('new_pw').value==document.getElementById('new_pw_re').value){
               document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
               document.getElementById('check2').style.color='blue';
               document.getElementById('check2').style.fontSize='15px';
               document.getElementById('check2').classList.remove('impo')
               return true;
           }
           else{
               document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
               document.getElementById('check2').classList.add('impo')
               document.getElementById('check2').style.color='red';
               document.getElementById('check2').style.fontSize='15px';
               return false;
           }
       }
  }
  function allCheck(event) {
	  const new_pw = document.getElementById('check1')
	  const new_pw_re = document.getElementById('check2')
	  const pw_reset_bt = document.getElementById('pw_reset_bt')
	  
	  let allflag = ''
	  
	  if(new_pw.classList.contains('impo') || new_pw_re.classList.contains('impo')){
		  allflag = false
	  }
	  else{
		  allflag = true
	  }
	  if(allflag == false){
		  
		  alert('실패')
		  event.preventDefault()
	  }
	  else{
		  
		  alert('성공')
	  }
	
}
  
  function chan(event) {
		console.log(password.getAttribute("type"))
		// password.setAttribute("type", "text")

		if (password.getAttribute("type") == "password") {
			password.setAttribute("type", "text")
			b1.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
		} else if (password.getAttribute("type") == "text") {
			password.setAttribute("type", "password")
			b1.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
		}

	}
  
	function submitHandler(event) {
		event.preventDefault()
		const formData = new FormData(event.target)
		const ob = {}
		for(let key of formData.keys()) {
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
	 function chan1(event) {
		  	console.log(new_pw.getAttribute("type"))

		  	if(new_pw.getAttribute("type") == "password"){
		  		new_pw.setAttribute("type", "text")
		  		b1.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
		  	}
		  	else if(new_pw.getAttribute("type") == "text"){
		  		new_pw.setAttribute("type", "password")
		  		b1.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
		  	}
		  	
		  } 
	
	function checkPassword1(event) {
	    let pw = document.getElementById('new_pw').value;
	    let sc = ["!","@","#","$","%"];
	    let check_SC = 0;
	    
	    for(let i=0;i < sc.length; i++){
	        if(pw.indexOf(sc[i]) != -1){
	            check_SC = 1;
	        }
	    }
	    
	    if(pw.length < 8 || pw.length > 16){
	        document.getElementById('check1').innerHTML='비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.';
	        document.getElementById('check1').style.color='red';
	        document.getElementById('check1').style.fontSize='15px';
	        document.getElementById('check1').classList.add('impo')
	        new_pw.value = "";
	        new_pw.focus();
	        return false;
	        
	     
	    }
	    if(check_SC == 0){
	            document.getElementById('check1').innerHTML='특수문자가 들어가 있지 않습니다.';
	            document.getElementById('check1').style.color='red';
	            document.getElementById('check1').style.fontSize='15px';
	            document.getElementById('check1').classList.add('impo')
	            document.getElementById('new_pw').value='';
	            new_pw.value = "";
	            new_pw.focus();
	            return false;
	        }
	    if(check_SC == 1){
	       document.getElementById('check1').innerHTML='사용가능합니다.';
	        document.getElementById('check1').style.color='blue';
	        document.getElementById('check1').style.fontSize='15px';
	        document.getElementById('check1').classList.remove('impo')
	        return true;
	    }
	       
	  }


	  function checkPassword2(event) {
	      if(document.getElementById('new_pw').value !='' && document.getElementById('new_pw_re').value!=''){
	           if(document.getElementById('new_pw').value==document.getElementById('new_pw_re').value){
	               document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
	               document.getElementById('check2').style.color='blue';
	               document.getElementById('check2').style.fontSize='15px';
	               document.getElementById('check2').classList.remove('impo')
	               return true;
	           }
	           else{
	               document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
	               document.getElementById('check2').classList.add('impo')
	               document.getElementById('check2').style.color='red';
	               document.getElementById('check2').style.fontSize='15px';
	               return false;
	           }
	       }
	  }
	  function allCheck(event) {
		  const new_pw = document.getElementById('check1')
		  const new_pw_re = document.getElementById('check2')
		  const pw_reset_bt = document.getElementById('pw_reset_bt')
		  
		  let allflag = ''
		  
		  if(new_pw.classList.contains('impo') || new_pw_re.classList.contains('impo')){
			  allflag = false
		  }
		  else{
			  allflag = true
		  }
		  if(allflag == false){
			  
			  alert('실패')
			  event.preventDefault()
		  }
		  else{
			  
			  alert('성공')
		  }
		
	}
	  
	  function chan2(event) {
		  	console.log(new_pw_re.getAttribute("type"))

		  	
		  	if(new_pw_re.getAttribute("type") == "password"){
		  		new_pw_re.setAttribute("type", "text")
		  		b2.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
		  	}
		  	else if(new_pw_re.getAttribute("type") == "text"){
		  		new_pw_re.setAttribute("type", "password")
		  		b2.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
		  	}
		  	
		  } 
		  
	  
	  function checkPassword1(event) {
		    let pw = document.getElementById('new_pw').value;
		    let sc = ["!","@","#","$","%"];
		    let check_SC = 0;
		    
		    for(let i=0;i < sc.length; i++){
		        if(pw.indexOf(sc[i]) != -1){
		            check_SC = 1;
		        }
		    }
		    
		    if(pw.length < 8 || pw.length > 16){
		        document.getElementById('check1').innerHTML='비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.';
		        document.getElementById('check1').style.color='red';
		        document.getElementById('check1').style.fontSize='15px';
		        document.getElementById('check1').classList.add('impo')
		        new_pw.value = "";
		        new_pw.focus();
		        return false;
		        
		     
		    }
		    if(check_SC == 0){
		            document.getElementById('check1').innerHTML='특수문자가 들어가 있지 않습니다.';
		            document.getElementById('check1').style.color='red';
		            document.getElementById('check1').style.fontSize='15px';
		            document.getElementById('check1').classList.add('impo')
		            document.getElementById('new_pw').value='';
		            new_pw.value = "";
		            new_pw.focus();
		            return false;
		        }
		    if(check_SC == 1){
		       document.getElementById('check1').innerHTML='사용가능합니다.';
		        document.getElementById('check1').style.color='blue';
		        document.getElementById('check1').style.fontSize='15px';
		        document.getElementById('check1').classList.remove('impo')
		        return true;
		    }
		       
		  }


		  function checkPassword2(event) {
		      if(document.getElementById('new_pw').value !='' && document.getElementById('new_pw_re').value!=''){
		           if(document.getElementById('new_pw').value==document.getElementById('new_pw_re').value){
		               document.getElementById('check2').innerHTML='비밀번호가 일치합니다.'
		               document.getElementById('check2').style.color='blue';
		               document.getElementById('check2').style.fontSize='15px';
		               document.getElementById('check2').classList.remove('impo')
		               return true;
		           }
		           else{
		               document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다.';
		               document.getElementById('check2').classList.add('impo')
		               document.getElementById('check2').style.color='red';
		               document.getElementById('check2').style.fontSize='15px';
		               return false;
		           }
		       }
		  }
		  function allCheck(event) {
			  const new_pw = document.getElementById('check1')
			  const new_pw_re = document.getElementById('check2')
			  const pw_reset_bt = document.getElementById('pw_reset_bt')
			  
			  let allflag = ''
			  
			  if(new_pw.classList.contains('impo') || new_pw_re.classList.contains('impo')){
				  allflag = false
			  }
			  else{
				  allflag = true
			  }
			  if(allflag == false){
				  
				  alert('실패')
				  event.preventDefault()
			  }
			  else{
				  
				  alert('성공')
			  }
			
		}
//		  b1.addEventListener('click', chan1)
		  function chan1(event) {
		  	console.log(new_pw.getAttribute("type"))
// password.setAttribute("type", "text")
		  	
		  	if(new_pw.getAttribute("type") == "password"){
		  		new_pw.setAttribute("type", "text")
		  		b1.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
		  	}
		  	else if(new_pw.getAttribute("type") == "text"){
		  		new_pw.setAttribute("type", "password")
		  		b1.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
		  	}
		  	
		  } 
		  
//		  const b2 = document.getElementById('b2')
//		  const new_pw_re = document.getElementById('new_pw_re')
//		  console.log(new_pw_re)

//		  b2.addEventListener('click', chan2)
		  function chan2(event) {
		  	console.log(new_pw_re.getAttribute("type"))

		  	
		  	if(new_pw_re.getAttribute("type") == "password"){
		  		new_pw_re.setAttribute("type", "text")
		  		b2.setAttribute("src", cpath + "/IKEA_image/pw_show2.svg")
		  	}
		  	else if(new_pw_re.getAttribute("type") == "text"){
		  		new_pw_re.setAttribute("type", "password")
		  		b2.setAttribute("src", cpath + "/IKEA_image/pw_show.svg")
		  	}
		  	
		  } 
	