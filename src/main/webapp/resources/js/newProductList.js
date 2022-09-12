'use strict';

function convert(dto) {
    const item = document.createElement('div')
    item.classList.add('sect3_slide')
    item.classList.add('swiper-slide')
    
    const sect3_teaser_container = document.createElement('div')
    const sect3_teaser_img = document.createElement('div')
    const sect3_teaser_content = document.createElement('div') 

    sect3_teaser_img.classList.add('sect3_teaser_img')
    sect3_teaser_content.classList.add('sect3_teaser_content')
    sect3_teaser_container.classList.add('sect3_teaser_container')
    item.innerHTML = ''
    sect3_teaser_container.appendChild(sect3_teaser_img)
    sect3_teaser_container.appendChild(sect3_teaser_content)
    item.appendChild(sect3_teaser_container)
    const rating = `${dto.product_star}`
    
	sect3_teaser_img.innerHTML += `<img id="hover_img" class="sect3_banner1" src="${cpath}/IKEA_productImage/${dto.image_filename1}">`
    sect3_teaser_img.innerHTML += `<a href="https://www.naver.com/"><img id="hover_img" class="sect3_banner2" src="${cpath}/IKEA_productImage/${dto.image_filename2}"></a>`
    	
    sect3_teaser_content.innerHTML += `<div class="sect3_product_name"><h3>${dto.product_name}</h3></div>
        <div class="sect3_product_desc"><span>${dto.product_desc}, ${dto.product_length}x${dto.product_width}cm</span></div>                                                 
        <div class="sect3_product_price"><span>￦</span><h2>${dto.product_price}</h2></div>
        <div class="sect3_product_allAvg">
            <span id="rating"> 
    			${rating >= 1 ? '<img src="IKEA_image/star.jpg">' : rating >= 0.5 ? '<img src="IKEA_image/halfstar.jpg">' : '<img src="IKEA_image/nostar.jpg">'}
		    	${rating >= 2 ? '<img src="IKEA_image/star.jpg">' : rating >= 1.5 ? '<img src="IKEA_image/halfstar.jpg">' : '<img src="IKEA_image/nostar.jpg">'}
		    	${rating >= 3 ? '<img src="IKEA_image/star.jpg">' : rating >= 2.5 ? '<img src="IKEA_image/halfstar.jpg">' : '<img src="IKEA_image/nostar.jpg">'}
		    	${rating >= 4 ? '<img src="IKEA_image/star.jpg">' : rating >= 3.5 ? '<img src="IKEA_image/halfstar.jpg">' : '<img src="IKEA_image/nostar.jpg">'}
		    	${rating >= 5 ? '<img src="IKEA_image/star.jpg">' : rating >= 4.5 ? '<img src="IKEA_image/halfstar.jpg">' : '<img src="IKEA_image/nostar.jpg">'}
            </span>
            <span>${dto.product_star}</span>
        </div>`
        	
    return item
}
async function selectNewProducts(event) {
	const wrapper = document.querySelector('.sect3_main .swiper-wrapper')
    const url = cpath + '/newProductList'
    await fetch(url)
    .then(resp => resp.json())
    .then(json => {
        json.forEach(dto => wrapper.appendChild(convert(dto)))
    })
}
