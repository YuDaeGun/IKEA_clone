<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    <link type='text/css' rel="stylesheet" href="${cpath }/resources/css/view.css">

    <article id="detail_container">
        <nav class="navigation">
            <ol class="detail_category">
                <li class="detail_category_item"><a href="${cpath }/product/categoryView/${p.product_largecategory}"><span>${p.product_largecategory}</span></a></li>
                <li>&nbsp;>&nbsp;</li>
                <li class="detail_category_item"><a href="${cpath }/product/categoryView/${p.product_largecategory}_${p.product_mediumcategory}"><span>${p.product_mediumcategory}</span></a></li>
                <li>&nbsp;>&nbsp;</li>
                <li class="detail_category_item"><a href="${cpath }/product/categoryView/${p.product_largecategory}_${p.product_mediumcategory}_${p.product_smallcategory}"><span>${p.product_smallcategory}</span></a></li>
                <li>&nbsp;>&nbsp;</li>
                <li class="detail_category_item"><a href="${cpath }/product/view/${p.product_idx}"><span>${p.product_name}</span></a></li>
            </ol>
        </nav>
        
        <div class="view">
            <div class="view_container">
                <section class="view_sect1_wrap">
					<c:forEach var="i" items="${imageList}">
						<img class="view_sect1_teaser" src="${cpath }/IKEA_productImage/${i.image_filename1 }">
						<c:if test="${i.image_isthumbnail == 'Y' }">
							<img class="view_sect1_teaser" src="${cpath }/IKEA_productImage/${i.image_filename2 }">
						</c:if>
					</c:forEach>
                </section>
        
                <section class="view_sect2">
                	<p class="view_sect2_intro">
                        ${p.product_summary}
                    </p>
                    <div class="view_sect2_infomation">
                       	<details>
                       		<summary onclick="changeArrow(event)">
                       			<span class="red">商品の詳細</span>
                       			<img id="toggleImage" class="img1" src="${cpath }/IKEA_image/arrow3.png"></summary><br>
                       		<pre>${p.product_details}</pre>
                       	</details>
                    </div>
                    <div class="view_sect2_infomation">
                        <details>
                       		<summary><span>サイズ</span><img src="${cpath }/IKEA_image/arrow2.svg"></summary>
                       	</details>
                    </div>
                    <div class="view_sect2_infomation">
                       	<details>
                       		<summary><span>レビュー</span><img src="${cpath }/IKEA_image/arrow2.svg"></summary>
                       	</details>
                    </div>
                </section>
            </div>
            
            <div class="view_module">
                <div class="view_module_container">
                    <div class="view_module_top">
                        <div class="view_module_section">
                            <h1 class="view_module_title">${p.product_name}</h1>
                            <span>
                            	${p.product_desc}
                            	<c:if test="${p.product_color != null}">, ${p.product_color}</c:if>
                           	</span>
                           	<c:if test="${p.product_length != 0}"><span>, ${p.product_length} x ${p.product_width} cm</span></c:if>
                        </div>
                    </div>
                    <div class="view_module_price"><span class="showPrice">¥<fmt:formatNumber value="${p.product_price}"/></span></div>
                    <div class="view_module_caption"><span>消費税込み。価格は店舗によって異なる場合があります</span></div>
                    <div class="view_module_point">
			            <span id="rating">
			            	<img src="${cpath }/IKEA_image/${p.product_star >= 1 ? 'star.jpg' : p.product_star >= 0.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
			            	<img src="${cpath }/IKEA_image/${p.product_star >= 2 ? 'star.jpg' : p.product_star >= 1.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
			            	<img src="${cpath }/IKEA_image/${p.product_star >= 3 ? 'star.jpg' : p.product_star >= 2.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
			            	<img src="${cpath }/IKEA_image/${p.product_star >= 4 ? 'star.jpg' : p.product_star >= 3.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
			            	<img src="${cpath }/IKEA_image/${p.product_star >= 5 ? 'star.jpg' : p.product_star >= 4.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
			            </span>
                        <span>(${p.product_star})</span>
                    </div>
                    <div class="view_module_buy">
                        <h4>購入方法</h4>
                        <div class="view_module_buyBorder">
                            <div class="view_module_delivery">
                                <div class="view_module_buyIcon"><img src="${cpath }/IKEA_image/truck2.svg" alt=""></div>
                                <div class="view_module_buyMeans">
                                    <h5>オンラインストア</h5>
                                    <a href="#none">xxx-xxxx</a>
                                    <span>へ配送可能</span>
                                </div>
                            </div>
                            <div class="view_module_delivery">
                                <div class="view_module_buyIcon"><img src="${cpath }/IKEA_image/offline.svg" alt=""></div>
                                <div class="view_module_buyMeans">
                                    <h5>イケア店舗</h5>
                                    <a href="#none">IKEAxx店</a>
                                    <span>に在庫があります</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="view_module_purchase">
                   		<button onclick="addCart(${p.product_idx })" class="view_module_btnLeft"><span>カートに追加</span></button>
                        <div class="view_module_btnRight"><img src="${cpath }/IKEA_image/like.svg" alt=""></div>
                    </div>
                    <span id="addCartMsg${p.product_idx }" class="addCartMsg displayNone">✔カートに追加されました。</span>
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