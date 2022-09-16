// 이미지 추가 (3개씩)
function addMoreImageFile() {
	$("#d_file").append("<div class='inputProduct'>")
	for (let i = 0; i < 3; i++) {
		$("#d_file").append("<input type='file' name='imageFile' accept='image/*' />");
	}
	$("#d_file").append("</div>")
}

// 가격 자동 콤마
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

// 길이, 너비, 높이 미입력 시 -> 0
function formSubmitHandler(event) {
	event.preventDefault()
	event.target.querySelectorAll('input[type="number"]').forEach(input => {
		if(input.value == '') 
			input.value = 0
	})
	event.target.submit()
}

// 이미지 미리보기
function setThumbnail(event) {
	var reader = new FileReader()

	event.target.nextElementSibling.innerHTML = ''
		
    reader.onload = function(e) {
      var img = document.createElement("img")
      img.setAttribute("src", e.target.result)
      img.setAttribute("height", "180")
      img.setAttribute("width", "auto")
      event.target.nextElementSibling.appendChild(img)
      // document.querySelector("div#preview1").appendChild(img)
    }
    reader.readAsDataURL(event.target.files[0])
}

// 상품 등록 선택지 최상위 카테고리 출력
function loadHandler(event) {
	const largeCategory = document.getElementById('largeCategory')
	largeCategory.innerHTML = '<option value="">-- 선택해 주세요 --</option>'
	
	const url = cpath + '/getLargeCategory'
	fetch(url).then(resp => resp.json())
	.then(arr => {
		console.log(arr)
		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			option.innerText = arr[i]
			largeCategory.appendChild(option)
		}
	})
}

// 상품 등록 선택지 하위 카테고리 출력
function getSubCategory(event) {
	let subCategory = document.getElementById('smallCategory')
	if (event.target.id == 'largeCategory') {
		subCategory.innerHTML = ''
		subCategory = document.getElementById('mediumCategory')
	}
	subCategory.innerHTML = '<option value="">-- 선택해 주세요 --</option>'
		
	const catename = event.target.value
	
	const url = cpath + '/getSubCategory/' + catename.replaceAll('/', '_')
	fetch(url).then(resp => resp.json())
	.then(arr => {
		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			option.innerText = arr[i]
			subCategory.appendChild(option)
		}
	})
}

// 상품 수정 선택지 카테고리 출력
function loadHandler2(largecate, midiumcate, smallcate) {
	
	const largeCategory = document.getElementById('largeCategory')
	largeCategory.innerHTML = '<option value="">-- 선택해 주세요 --</option>'
	const mediumCategory = document.getElementById('mediumCategory')
	mediumCategory.innerHTML = '<option value="">-- 선택해 주세요 --</option>'
	const smallCategory = document.getElementById('smallCategory')
	smallCategory.innerHTML = '<option value="">-- 선택해 주세요 --</option>'
	
	let url = cpath + '/getLargeCategory'
	fetch(url).then(resp => resp.json())
	.then(arr => {

		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			if (largecate == arr[i]) option.setAttribute('selected', true)
			option.innerText = arr[i]
			largeCategory.appendChild(option)
		}
	})
	
	url = cpath + '/getSubCategory/' + largecate.replaceAll('/', '_')
	fetch(url).then(resp => resp.json())
	.then(arr => {
		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			if (midiumcate == arr[i]) option.setAttribute('selected', true)
			option.innerText = arr[i]
			mediumCategory.appendChild(option)
		}
	})
	
	url = cpath + '/getSubCategory/' + midiumcate.replaceAll('/', '_')
	fetch(url).then(resp => resp.json())
	.then(arr => {
		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			if (smallcate == arr[i]) option.setAttribute('selected', true)
			option.innerText = arr[i]
			smallCategory.appendChild(option)
		}
	})
}






