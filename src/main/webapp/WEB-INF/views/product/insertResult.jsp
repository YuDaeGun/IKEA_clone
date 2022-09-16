<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/product.css">

	<div class="insert_wrap all">
	    <h1>[${p.product_name}] 상품의 등록/수정이 완료되었습니다 (관리자 페이지)</h1><br>
	    <div class="input_wrap">
	        <form>
            	<div class="inputProduct section1">
	                <div class="selectInputChild">
	                    <label for="largeCategory">대분류</label>
	                    <input id="largeCategory" value="${p.product_largecategory}" readonly>
	                </div>
	                <div class="selectInputChild">
	                    <label for="mediumCategory">중분류</label>
	                    <input id="mediumCategory" value="${p.product_mediumcategory}" readonly>
	                </div>
            	    <div class="selectInputChild">
	                    <label for="smallCategory">소분류</label>
	                    <input id="smallCategory" value="${p.product_smallcategory}" readonly>
	                </div>
            	</div>
	            <div class="inputProduct section2">
	                <div class="inputChild">
	                    <label for="inputProductName">상품명</label>
	                    <input id="inputProductName" value="${p.product_name}" readonly>
	                </div>
	                <div class="inputChild">
	                    <label for="inputProductDesc">상품 구성</label>
	                    <input id="inputProductDesc" value="${p.product_desc}" readonly>
	                </div>
	            </div>
	            <div class="inputProduct section3">
	                <div class="inputChild">
	                	<div>
		                    <label for="inputProductPrice">상품 가격</label>
		                    <input id="inputProductPrice" value="<fmt:formatNumber value='${p.product_price}'/>" readonly>
		                </div>
		                <div><br>원</div>
	                </div>
	                <div class="inputChild">                
	                    <label for="inputProductStock">상품 재고</label>
	                    <input id="inputProductStock" value="${p.product_stock}" readonly>
	                </div>
	            </div>
	            <div class="inputProduct section4">
	                <div class="inputChild"> 
	                    <label for="inputProductColor">상품 색상</label>
	                    <input id="inputProductColor" value="${p.product_color}" readonly>
	                </div>
	                <div class="inputChild">
		                <div>
		                    <label for="inputProductLength">상품 길이</label>
		                    <input id="inputProductLength" value="${p.product_length != 0 ? p.product_length : ''}" readonly>
		                </div>
		                <div>
		                    <label for="inputProductWidth">상품 너비</label>
		                    <input id="inputProductWidth" value="${p.product_width != 0 ? p.product_width : ''}" readonly>
		                </div>
		                <div>
		                    <label for="inputProductHeight">상품 높이</label>
		                    <input id="inputProductHeight" value="${p.product_height != 0 ? p.product_height : ''}" readonly>
		                </div>
	                </div>
	            </div>
	            <div class="inputProduct section5">
	                <div class="inputChild">
	                    <label for="inputProductSummary">상품 간단 설명</label>
	                    <textarea id="inputProductSummary" rows="3" readonly>${p.product_summary}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section6">
	                <div class="inputChild">
	                    <label for="inputProductDetails">상품 상세 설명</label>
	                    <textarea id="inputProductDetails" rows="5" readonly>${p.product_details}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section7">
	          	    <c:forEach var="image" items="${imageList}">
	          	    <div>
	          	    	<div>
	    	      	    	<c:if test="${image.image_isthumbnail == 'Y'}">
		          	    		<img src="${cpath }/IKEA_productImage/${image.image_filename1 }">
		          	    		<img src="${cpath }/IKEA_productImage/${image.image_filename2 }">
	    	      	    	</c:if>
	          	    	</div>
	          	    	<div class="thumbnailMassege">
	    	      	    	<c:if test="${image.image_isthumbnail == 'Y'}">대표 이미지</c:if>
			            </div>
		            </div>
		    		</c:forEach>
	    		</div>
	    	</form>
	        <div class="section8">
	        	<div>
		        	<button onclick="location.href='${cpath }/product_list/productInsertForm'">상품 추가등록</button>
		        	<button onclick="location.href='${cpath }/product_list/productModify/${p.product_idx}'">수정하기</button>
	        	</div>
	        	<div>
		        	<button onclick="location.href='${cpath }/product_list/product_view/${p.product_idx}'"> 상품 상세 페이지로</button>
	        	</div>
           </div>
	    </div>
	</div>

<script src="${cpath }/resources/js/product.js"></script>

<%@ include file="../footer.jsp" %>