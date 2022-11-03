<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/categoryView.css">

<body>
    <article id="list_container">
        <nav class="navigation">
            <ol class="goods_category">
                <li class="goods_category_item"><a href="${cpath }/product/categoryView/${largecate }"><span>${largecate }</span></a></li>
                <c:if test="${mediumcate != null }">
	                <li>&nbsp;>&nbsp;</li>
	                <li class="goods_category_item"><a href="${cpath }/product/categoryView/${largecate }_${mediumcate }"><span>${mediumcate }</span></a></li>
                </c:if>
                <c:if test="${smallcate != null }">
	                <li>&nbsp;>&nbsp;</li>
	                <li class="goods_category_item"><a href="${cpath }/product/categoryView/${largecate }_${mediumcate }_${smallcate }"><span>${smallcate }</span></a></li>                
                </c:if>
            </ol>
        </nav>
        <section class="cateView_sect1">
            <div>
                <h1 class="cateView_title">${smallcate != null ? smallcate : mediumcate != null ? mediumcate : largecate }</h1>
            </div>
            <div class="cateView_sect1_order">
            	<c:forEach var="cate" items="${smallcateList != null ? smallcateList : mediumcateList }">
            	<div class="cateItem">
					<a href="${cpath }/product/categoryView/${largecate }${mediumcate != null ? '_' : '' }${mediumcate != null ? mediumcate : '' }_${cate.category_name}">
						<img src="${cpath }/IKEA_image/${cate.category_image_filename}"><br>
						${cate.category_name}
					</a><br>
				</div>
            	</c:forEach>
            </div>
            <div class="cateView_cateDesc">
            	<p>${cateDesc }</p>
            </div>
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
							<img onclick="addCart(${p.product_idx })" src="${cpath }/IKEA_image/addCartIcon.jpg">
							<span id="addCartMsg${p.product_idx }" class="displayNone">✔カートに追加されました。</span>
						</div>
					</div>
				</div>
			</div>			
			</c:forEach>	        
        </div>
    </article>

<%@ include file="../footer.jsp" %>