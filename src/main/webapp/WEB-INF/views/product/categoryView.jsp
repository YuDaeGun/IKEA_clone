<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/categoryView.css">

<body>
    <article id="list_container">
        <nav class="navigation">
            <ol class="goods_category">
                <li class="goods_category_item"><a href=""><span>${p.product_largecategory }</span></a></li>
                <li class="goods_category_item"><a href=""><span>${p.product_mediumcategory }</span></a></li>
            </ol>
        </nav>
        <section class="plm_sect1">
            <div class="plm_sect1_title">
                <h1 class="plm_title_h2" mediumcategory="${product_mediumcategory}">${product_mediumcategory}</h1>
            </div>
            <div class="plm_sect1_order"></div>
        </section>

        <section class="plm_sect2">
            <p class="plm_sect2_intro">
               	${p.product_details }
            </p>
        </section>
        <section class="plm_sect3">
            <div class="plm_sect3_filter">
                <span class="plm_sect3_filter_count">840개 항목</span>
                <div class="plm_sect3_filter_btn">
                    <button class="plm_sect3_toggle">제품</button>
                    <button class="plm_sect3_toggle">공간</button>
                </div>
            </div>
            <div class="plm_sect3_pillOption">
                <button class="plm_sect3_pill">정렬</button>
                <button class="plm_sect3_pill">사이즈</button>
                <button class="plm_sect3_pill">카테고리</button>
                <button class="plm_sect3_pill">가격</button>
                <button class="plm_sect3_pill">색상</button>
            </div>
        </section>
        <section class="plm_sect4"></section>
	        <div class="plm_sect4_productList">
				<c:forEach var="p" items="${productList }">
					<div class="plm_sect4_main">
						<div class="plm_sect4_teaser_container">
							<div class="plm_sect4_teaser_img">
								<img id="hover_img" class="plm_sect4_banner1" src="${cpath }/IKEA_productImage/${p.image_filename1 }">
								<img id="hover_img" class="plm_sect4_banner2" src="${cpath }/IKEA_productImage/${p.image_filename2 }">
							</div>
							<div class="plm_sect4_teaser_content">
								<div class="plm_sect4_product_name">
									<h3>${p.product_name }</h3>
								</div>
	                            <div class="plm_sect4_product_smallcategory">
	                            	<span>${p.product_mediumcategory }</span>
	                            </div>
	                            <div class="plm_sect4_product_price">
	                            	<span>￦</span><h2><fmt:formatNumber value="${p.product_price }"/></h2>
	                           	</div>
	                           	<div class="plm_sect4_product_star">
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
	        <div></div>
        <section class="plm_sect5"></section>
        <section class="plm_sect6"></section>
    </article>

<%@ include file="../footer.jsp" %>