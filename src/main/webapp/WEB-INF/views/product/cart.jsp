<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/view.css">

    <article id="detail_container">
        <div class="cartSpace"></div>
        <div class="displayFlex">
            <div class="cart_container">
				<div><h1>カート</h1></div>            
				<div>ご注文の品をどのように受取りますか？</div>
				<div class="howToReceive">
					<div>
						<a href="#none">
							<img src="${cpath }/IKEA_image/truck2.svg"><span>配送する</span>
						</a>
					</div>
					<div>
						<a href="#none">
							<img src="${cpath }/IKEA_image/offline.svg"><span>店舗・商品受取りセンターで受取る</span>
						</a>
					</div>
				</div>
				<c:forEach var="p" items="${productList }" varStatus="st">
				<div class="cartList">
					<div><img src="${cpath }/IKEA_productImage/${p.image_filename1 }"></div>
					<div>
						<div class="cartList_firstRow">
							<a>${p.product_name }</a>
							<a>${productNumber[st.index] }</a>
							<span>¥<fmt:formatNumber value="${p.product_price}"/></span>
						</div>
						<div>${p.product_desc}<c:if test="${p.product_color != null}">, ${p.product_color}</c:if></div>
						<div><c:if test="${p.product_length != 0}">${p.product_length} x ${p.product_width} cm</c:if></div>
						<br>
						<a class="delete">商品を削除する</a>
					</div>
				</div>
				</c:forEach>
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
					<hr>
					<div class="purchase_info">
						<div>
							<img src="${cpath }/IKEA_image/couponIcon.jpg">
							<a href="#none">クーポンコードをお持ちですか？</a>
						</div>
						<div>
							<img src="${cpath }/IKEA_image/recycleIcon.jpg">
							<a href="#none">365日 返品可能</a>
						</div>
						<div>
							<img src="${cpath }/IKEA_image/padlockIcon.jpg">
							<a href="#none">安全なショッピング SSLデータ暗号化</a>
						</div>
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
											<span>¥</span><h2><fmt:formatNumber value="${p.product_price }" /></h2>
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