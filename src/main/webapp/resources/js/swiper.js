'use strict';

const swiper_button1 = document.querySelector('.swiper-button-next')
const swiper_button2 = document.querySelector('.swiper-button-prev')
const sect3_filename = document.querySelector('.sect3_teaser_img')

var sect2_teaser = new Swiper(".sect2_teaser", {
	slidesPerView : 3,
	spaceBetween : 30,
	slidesPerGroup : 3,
	freeMode : true,
	navigation : {
		nextEl : ".swiper-button-next",
		prevEl : ".swiper-button-prev",
	},
	pagination : {
		el : ".swiper-pagination",
		clickable : true,
	},
});

async function newProductListSwiper() {
	await selectNewProducts();	// newProductList.js
	var sect3_teaser = new Swiper(".sect3_teaser", {
	    slidesPerView: 3.5,
	    spaceBetween: 30,
	    slidesPerGroup: 3,
	    freeMode: true,
	    scrollbar: {
	    	el: ".swiper-scrollbar",
	    },
    });
};
newProductListSwiper()

var slide_icon = new Swiper(".slide_icon", {
	slidesPerView : 6.5,
	spaceBetween : 30,
	slidesPerGroup : 3,
	freeMode : true,
	navigation : {
		nextEl : ".swiper-button-next",
		prevEl : ".swiper-button-prev",
	},
	pagination : {
		el : ".swiper-pagination",
		clickable : true,
	},
});

var sect6_slide = new Swiper(".sect6_slide_icon", {
	slidesPerView : 6.5,
	spaceBetween : 30,
	slidesPerGroup : 3,
	freeMode : true,
	navigation : {
		nextEl : ".swiper-button-next",
		prevEl : ".swiper-button-prev",
	},
	scrollbar : {
		el : ".swiper-scrollbar",
	},
});

var sect8_slide = new Swiper(".sect8_slide_icon", {
	slidesPerView : 6.5,
	spaceBetween : 30,
	slidesPerGroup : 3,
	freeMode : true,
	navigation : {
		nextEl : ".swiper-button-next",
		prevEl : ".swiper-button-prev",
	},
	scrollbar : {
		el : ".swiper-scrollbar",
	},
});
