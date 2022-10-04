'use strict';

//	メインページ2段階モーダルウィンドウ
const body_overflow = document.querySelector('body')
const hnf_hamburger = document.querySelector('.hnf_hamburger')
const allmenu_popup = document.querySelector('.allmenu_popup')
const allmenu_popup_close = document.querySelector('.allmenu_popup_close')
const depth1 = document.querySelectorAll('.popupmenu_depth1')
const depth2Wrap = document.querySelector('.popupmenu_depth2_wrap')
const eventmenu = document.querySelector('.eventmenu')
const allmenu_dim = document.querySelector('.allmenu_dim')
const backspace = document.querySelector('.backspace_popup')

hnf_hamburger.addEventListener('click', () => {
    allmenu_popup.style.display = 'flex'
    body_overflow.style.overflowY = 'clip'
})
depth1.forEach((item, i) => {
    item.addEventListener('click', (e) => {
        backspace.style.display = 'flex'
        depth1.forEach((dep1) => (dep1.style.display = 'none'),(eventmenu.style.display = 'none'))
        {item === e.currentTarget ? (item.classList.add('on'), (item.style.display = 'block')) : null}
    })
    item.querySelectorAll('li').forEach((dep2, ind) => {
        dep2.addEventListener('click', (e) => {
            depth2Wrap.querySelectorAll('.popupmenu_depth3').forEach((dep3) => {
                dep3.querySelectorAll('.popupmenu_depth3_menu').forEach((dep3Div) => dep3Div.classList.remove('on'))
            })
            depth2Wrap.classList.add('on')
            depth2Wrap.querySelectorAll('.popupmenu_depth3')[i].classList.add('on')
            depth2Wrap.querySelectorAll('.popupmenu_depth3')[i].querySelectorAll('.popupmenu_depth3_menu')[ind].classList.add('on')
            console.log(ind)
        })
    })
})
const popup_close = () => {
    allmenu_popup.style.display = 'none'
    body_overflow.style.overflowY = 'scroll'
    depth1.forEach((dep1) => {
        dep1.style.display = 'block'
        dep1.classList.remove('on')
    })
    depth2Wrap.classList.remove('on')
    backspace.style.display = 'none'
    eventmenu.style.display = 'block'
}

allmenu_dim.addEventListener('click', popup_close)
allmenu_popup_close.addEventListener('click', popup_close)

backspace.addEventListener('click', () => {
    depth2Wrap.classList.remove('on')
    depth1.forEach((dep1) => {
        dep1.style.display = 'block'
        dep1.classList.remove('on')
    })
    backspace.style.display = 'none'
    eventmenu.style.display = 'block'
})

function getSubCategory(event) {	    	
	const subCateId = event.target.id + 'Sub'
	const subCate = document.getElementById(subCateId)
	subCate.innerHTML = "<li><a href='" + cpath + "/product/categoryView/" + event.target.id + "'>すべて見る</a></li>"
	const url = cpath + '/getSubCategory/' + event.target.id
	fetch(url).then(resp => resp.json())
	.then(arr => {
		for (let i = 0; i < arr.length; i++) {
			const li = document.createElement('li')
			li.innerHTML = "<a href='" + cpath + "/product/categoryView/" + event.target.id + "_" +arr[i] + "'>" + arr[i] + "</a>"
			subCate.appendChild(li)
		}
	})
}

