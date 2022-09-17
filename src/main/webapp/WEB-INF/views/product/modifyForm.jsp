<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/product.css">

	
	<div class="insert_wrap all">
	    <h1>[${p.product_name}] 상품 수정 (관리자 페이지)</h1><br>
	    <div class="input_wrap">
	        <form id="addForm" method="post" enctype="multipart/form-data">
            	<div class="inputProduct section1">
	                <div class="selectInputChild">
	                    <label for="largeCategory">대분류</label>
	                    <select id="largeCategory" name="product_largecategory" required></select>
	                </div>
	                <div class="selectInputChild">
	                    <label for="mediumCategory">중분류</label>
	                    <select id="mediumCategory" name="product_mediumcategory" required></select>
	                </div>
            	    <div class="selectInputChild">
	                    <label for="smallCategory">소분류</label>
	                    <select id="smallCategory" name="product_smallcategory" required></select>
	                </div>
            	</div>
	            <div class="inputProduct section2">
	                <div class="inputChild">
	                    <label for="inputProductName">*상품명</label>
	                    <input id="inputProductName" type="text" name="product_name" value="${p.product_name }" required>
	                </div>
	                <div class="inputChild">
	                    <label for="inputProductDesc">상품 구성</label>
	                    <input id="inputProductDesc" type="text" name="product_desc" value="${p.product_desc }">
	                </div>
	            </div>
	            <div class="inputProduct section3">
	                <div class="inputChild">
	                	<div>
		                    <label for="inputProductPrice">*상품 가격</label>
		                    <input id="inputProductPrice" type="text" name="product_price_String" onkeyup="inputNumberFormat(this)" 
		                    value="<fmt:formatNumber value='${p.product_price}'/>" required>
		                </div>
		                <div><br>원</div>
	                </div>
	                <div class="inputChild">                
	                    <label for="inputProductStock">*상품 재고</label>
	                    <input id="inputProductStock" type="number" name="product_stock" value="${p.product_stock }" required>
	                </div>
	            </div>
	            <div class="inputProduct section4">
	                <div class="inputChild"> 
	                    <label for="inputProductColor">상품 색상</label>
	                    <input id="inputProductColor" type="text" name="product_color" value="${p.product_color }">
	                </div>
	                <div class="inputChild">
		                <div>
		                    <label for="inputProductLength">상품 길이</label>
		                    <input id="inputProductLength" type="number" name="product_length" value="${p.product_length}">
		                </div>
		                <div>                    
		                    <label for="inputProductWidth">상품 너비</label>
		                    <input id="inputProductWidth" type="number" name="product_width" value="${p.product_width}">
		                </div>
		                <div>                    
		                    <label for="inputProductHeight">상품 높이</label>
		                    <input id="inputProductHeight" type="number" name="product_height" value="${p.product_height}">
		                </div>
	                </div>
	            </div>
	            <div class="inputProduct section5">
	                <div class="inputChild">
	                    <label for="inputProductSummary">상품 간단 설명</label>
	                    <textarea id="inputProductSummary" name="product_summary" rows="3" >${p.product_summary}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section6">   
	                <div class="inputChild">         
	                    <label for="inputProductDetails">상품 상세 설명</label>
	                    <textarea id="inputProductDetails" name="product_details" rows="5" >${p.product_details}</textarea>
	                </div>
	            </div>
	            
	            <div class="inputProduct section7">
	            	<div>
		            	<label for="thumbnail1">*대표 이미지1</label>
		                <input id="thumbnail1" type='file' name='imageFile' accept="image/*" required />
		                <div></div>
	                </div>
	                <div>
		            	<label for="thumbnail2">대표 이미지2</label>
		                <input id="thumbnail2" type='file' name='imageFile' accept="image/*" required />
		                <div></div>
	                </div>
		            <div>
		                <br><input type="button" value="이미지 개수 추가" onclick="addMoreImageFile()"><br>
		            </div>
	            </div>
          	    <div id="d_file"></div>
          	    <div class="section8">
        	        <span></span> 
          	    	<span><input type="submit" value="상품 수정 완료"></span> 
	            </div>
	        </form>
	    </div>
	</div>

<script src="${cpath }/resources/js/product.js"></script>

<script>
	window.addEventListener('load', loadHandler2('${p.product_largecategory}', '${p.product_mediumcategory}', '${p.product_smallcategory}'))
	window.addEventListener('load', addMoreImageFile)
	document.getElementById('addForm').addEventListener('submit', formSubmitHandler)
	document.querySelectorAll('input[type="file"]').forEach(e => e.addEventListener('change', setThumbnail))
	document.getElementById('largeCategory').addEventListener('change', getSubCategory)
	document.getElementById('mediumCategory').addEventListener('change', getSubCategory)
</script>

<%@ include file="../footer.jsp" %>