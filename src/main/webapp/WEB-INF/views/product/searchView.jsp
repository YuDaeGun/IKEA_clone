<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/categoryView.css">

<body>
    <article id="list_container">
        <section class="cateView_sect1">
        	<div></div>
            <h1 class="cateView_title">
            	<c:if test="${numberOfResults != 0 }">「${keyword }」の検索結果</c:if>
            	<c:if test="${numberOfResults == 0 }">"${keyword }"の結果はありません</c:if>
            </h1><br>
            <span>
            	<c:if test="${numberOfResults != 0}">${numberOfResults }の商品が見つかりました。</c:if>
            	<c:if test="${numberOfResults == 0 }">別の言葉で試してください。</c:if>
           	</span>
        </section>
        
        <div class="cateView_sect4_productList">
			<c:forEach var="p" items="${productList }">
				<div class="cateView_sect4_main">
					<div class="cateView_sect4_teaser_container">
						<div class="cateView_sect4_teaser_img">
							<img id="hover_img" class="cateView_sect4_banner1" src="${cpath }/IKEA_productImage/${p.image_filename1 }">
							<a href="${cpath }/product/view/${p.product_idx }">
								<img id="hover_img" class="cateView_sect4_banner2" src="${cpath }/IKEA_productImage/${p.image_filename2 }">
							</a>
						</div>
						<div class="cateView_sect4_teaser_content">
							<div class="cateView_sect4_product_name">
								<h3>${p.product_name }</h3>
							</div>
                            <div class="cateView_sect4_product_smallcategory">
                            	<span>${p.product_desc }
                            		<c:if test="${p.product_length != 0}">, ${p.product_length }x${p.product_width } cm</c:if>
                           		</span>
                            </div>
                            <div class="cateView_sect4_product_price">
                            	<span>¥</span><h2><fmt:formatNumber value="${p.product_price }"/></h2>
                           	</div>
                           	<div class="cateView_sect4_product_star">
								<span id="rating">
					            	<img src="${cpath }/IKEA_image/${p.product_star >= 1 ? 'star.jpg' : p.product_star >= 0.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
					            	<img src="${cpath }/IKEA_image/${p.product_star >= 2 ? 'star.jpg' : p.product_star >= 1.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
					            	<img src="${cpath }/IKEA_image/${p.product_star >= 3 ? 'star.jpg' : p.product_star >= 2.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
					            	<img src="${cpath }/IKEA_image/${p.product_star >= 4 ? 'star.jpg' : p.product_star >= 3.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
					            	<img src="${cpath }/IKEA_image/${p.product_star >= 5 ? 'star.jpg' : p.product_star >= 4.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
								</span>
								<span>(${p.product_star })</span>
							</div>
							<div class="cateView_sect4_product_addcart">
								<a href="${cpath }/addCart/${p.product_idx }/${p.product_name }"><img src="${cpath }/IKEA_image/addCartIcon.jpg"></a>
							</div>
						</div>
					</div>
				</div>			
			</c:forEach>	        
        </div>
    </article>
    
    <c:if test="${numberOfResults == 0 }">
    <div id="leng">
	    <div class="space"></div>
	    
    	<section class="home_sect6">
            <div class="sect6_title">
                <h2>人気のカテゴリを見てみよう</h2>
            </div>
            <div class="swiper sect6_slide">
                <div class="swiper-wrapper">
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_ベッド"><img src="${cpath }/IKEA_image/ベッド.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_ソファ"><img src="${cpath }/IKEA_image/ソファ.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_椅子・チェア"><img src="${cpath }/IKEA_image/椅子・チェア.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_棚・ラック"><img src="${cpath }/IKEA_image/棚・ラック.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_チェスト・引き出し収納"><img src="${cpath }/IKEA_image/チェスト・引き出し収納.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_テレビ台・テレビボード"><img src="${cpath }/IKEA_image/テレビ台・テレビボード.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/照明_照明器具・ランプ"><img src="${cpath }/IKEA_image/照明器具・ランプ.png"></a></div>
                    <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/照明_イルミネーションライト"><img src="${cpath }/IKEA_image/イルミネーションライト.png"></a></div>
                </div>
                <div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
                <div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
                <div class="swiper-scrollbar"></div>
            </div>
        </section>
        
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
											<span>￦</span><h2><fmt:formatNumber value="${p.product_price }"/></h2>
										</div>
										<div class="sect3_product_star">
											<span id="rating">
								            	<img src="${cpath }/IKEA_image/${p.product_star >= 1 ? 'star.jpg' : p.product_star >= 0.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
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
    </div>
    </c:if>

<%@ include file="../footer.jsp" %>