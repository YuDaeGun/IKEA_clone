<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    <link type='text/css' rel="stylesheet" href="${cpath }/resources/css/view.css">

    <article id="detail_container">
        <div class="cartSpace"></div>
        <div class="view">
            <div class="cart_container">
        		<div class="dgcontents"></div>
            </div>
            
            <div class="cart_module">
                <div class="view_module_container">
                	<div class="cart_sect1_wrap">
						<div><b>ご注文内容</b></div>
						<div>
							<span>配送</span>
							<span>配送料などは含まれていません。</span>
						</div>
						<hr>
						<div>
							<b>小計</b>
							<b class="cart_sect1_wrap_price">¥3,197</b>
						</div>
                	</div>
					
					<div class="purchase_button">
						<span>購入にすすむ</span>
						<div><img src="${cpath }/IKEA_image/arrow2.svg"></div>
					</div>
					
					<div class="checkout_wrapper__FYF9N" data-cs-show="true">
						<button type="button"
							class="cart-ingka-btn cart-ingka-btn--emphasised cart-ingka-btn--fluid orderCaptureRedirect_hideLg__3IhIW"
							data-testid="checkoutButton__mobile">
							<span class="cart-ingka-btn__inner"><span
								class="cart-ingka-btn__label">購入にすすむ</span></span>
						</button>
						<button type="button"
							class="cart-ingka-jumbo-btn cart-ingka-jumbo-btn--emphasised orderCaptureRedirect_onlyLg__F+8cy"
							data-testid="checkoutButton__default">
							<span class="cart-ingka-jumbo-btn__inner"><span
								class="cart-ingka-jumbo-btn__label">購入にすすむ</span><span
								class="cart-ingka-jumbo-btn__icon"><svg focusable="false"
										viewBox="0 0 24 24" class="cart-ingka-svg-icon"
										aria-hidden="true">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg></span></span>
						</button>
					</div>


				</div>
            </div>
        </div>
        
        <div class="viewPageNewProduct"></div>
		<section class="home_sect3">
			<div class="sect3_title">
				<h2>イケアの新商品</h2>
			</div>
			<div class="sect3_product"></div>
			<div class="sect3_main">
				<div class="swiper sect3_teaser">
					<div class="swiper-wrapper">
						<c:forEach var="p" items="${newProducts }">
							<div class="sect3_slide swiper-slide">
								<div class="sect3_teaser_container">
									<div class="sect3_teaser_img">
										<img src="${cpath }/IKEA_productImage/${p.image_filename1 }">
										<a href="${cpath }/product/view/${p.product_idx }">
											<img id="hover_img" class="sect3_banner2" src="${cpath }/IKEA_productImage/${p.image_filename2 }">
										</a>
									</div>
									<div class="sect3_teaser_content">
										<div class="sect3_product_name">
											<h3>${p.product_name }</h3>
										</div>
										<div class="sect3_product_desc">
											<span>${p.product_desc }, ${p.product_length } x ${p.product_width }cm</span>
										</div>
										<div class="sect3_product_price">
											<span>￦</span><h2><fmt:formatNumber value="${p.product_price }" /></h2>
										</div>
										<div class="sect3_product_star">
											<span id="rating"> <img src="${cpath }/IKEA_image/${p.product_star >= 1 ? 'star.jpg' : p.product_star >= 0.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
												<img src="${cpath }/IKEA_image/${p.product_star >= 2 ? 'star.jpg' : p.product_star >= 1.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
												<img src="${cpath }/IKEA_image/${p.product_star >= 3 ? 'star.jpg' : p.product_star >= 2.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
												<img src="${cpath }/IKEA_image/${p.product_star >= 4 ? 'star.jpg' : p.product_star >= 3.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
												<img src="${cpath }/IKEA_image/${p.product_star >= 5 ? 'star.jpg' : p.product_star >= 4.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
											</span>
											<span>(${p.product_star })</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
					<div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
		</section>
		
    </article>
    
<script src="${cpath }/resources/js/product.js"></script>

<%@ include file="../footer.jsp" %>