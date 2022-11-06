//	イメージ追加欄を追加(3個ずつ)
function addMoreImageFile() {
	$("#d_file").append("<div class='inputProduct'>")
	for (let i = 0; i < 3; i++) {
		$("#d_file").append("<input type='file' name='imageFile' accept='image/*' />");
	}
	$("#d_file").append("</div>")
}

//	価格に自動的にコンマ(,)を挿入
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

//	length, width, heightを空欄に提出する際、自動的に -> 0
function formSubmitHandler(event) {
	event.preventDefault()
	event.target.querySelectorAll('input[type="number"]').forEach(input => {
		if(input.value == '') 
			input.value = 0
	})
	event.target.submit()
}

//	イメージ preview
function setThumbnail(event) {
	var reader = new FileReader()

	event.target.nextElementSibling.innerHTML = ''
		
    reader.onload = function(e) {
      var img = document.createElement("img")
      img.setAttribute("src", e.target.result)
      img.setAttribute("height", "180")
      img.setAttribute("width", "auto")
      event.target.nextElementSibling.appendChild(img)
    }
    reader.readAsDataURL(event.target.files[0])
}

//	商品追加ページの選択肢に最上位カテゴリーを出力
function loadHandler(event) {
	const largeCategory = document.getElementById('largeCategory')
	largeCategory.innerHTML = '<option value="">-- 選択してください --</option>'
	
	const url = cpath + '/getLargeCategory'
	fetch(url).then(resp => resp.json())
	.then(arr => {
		for (let i = 0; i < arr.length; i++) {
			const option = document.createElement('option')
			option.innerText = arr[i]
			largeCategory.appendChild(option)
		}
	})
}

//	商品追加ページの選択肢に下位カテゴリーを出力
function getSubCategory(event) {
	let subCategory = document.getElementById('smallCategory')
	if (event.target.id == 'largeCategory') {
		subCategory.innerHTML = ''
		subCategory = document.getElementById('mediumCategory')
	}
	subCategory.innerHTML = '<option value="">-- 選択してください --</option>'
		
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

//	商品修正ページの選択肢にカテゴリーを出力
function loadHandler2(largecate, midiumcate, smallcate) {
	
	const largeCategory = document.getElementById('largeCategory')
	largeCategory.innerHTML = '<option value="">-- 選択してください --</option>'
	const mediumCategory = document.getElementById('mediumCategory')
	mediumCategory.innerHTML = '<option value="">-- 選択してください --</option>'
	const smallCategory = document.getElementById('smallCategory')
	smallCategory.innerHTML = '<option value="">-- 選択してください --</option>'
	
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

//	矢印の方向転換
function changeArrow(event) {
	const toggleImage = document.getElementById('toggleImage')
	
	if (toggleImage.className == "img1") {
		toggleImage.classList.remove("img1");
		toggleImage.classList.add("img2");
		toggleImage.setAttribute("src", cpath + "/IKEA_image/arrow4.png")
	} else {
		toggleImage.classList.remove("img2");
		toggleImage.classList.add("img1");
		toggleImage.setAttribute("src", cpath + "/IKEA_image/arrow3.png")
		
	}
}

//	カートの商品の数量変更
async function changeQuantity(idx) {
	const quantity = event.target.value
	
	url = cpath + '/modifyCartQuantity/' + idx + '/' + quantity
	await fetch(url)
	
	location.href = cpath + '/product/cart'
}













