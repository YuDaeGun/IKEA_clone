<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/insertStyle.css">
	<script src="${cpath }/resources/js/insertFunction.js"></script>
    <script src = "http://code.jquery.com/jquery-latest.js"></script> 
	
	<div class="insert_wrap all">
	    <h1>[${product.product_name}] 상품 수정 (관리자 페이지)</h1>
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
	                    <input id="inputProductName" type="text" name="product_name" value="${product.product_name }" required>
	                </div>
	                <div class="inputChild">
	                    <label for="inputProductDesc">상품 구성</label>
	                    <input id="inputProductDesc" type="text" name="product_desc" value="${product.product_desc }">
	                </div>
	            </div>
	            <div class="inputProduct section3">
	                <div class="inputChild">
	                	<div>
		                    <label for="inputProductPrice">*상품 가격</label>
		                    <input id="inputProductPrice" type="text" name="product_price_String" onkeyup="inputNumberFormat(this)" 
		                    value="<fmt:formatNumber value='${product.product_price}'/>" required>
		                </div>
		                <div><br>원</div>
	                </div>
	                <div class="inputChild">                
	                    <label for="inputProductStock">*상품 재고</label>
	                    <input id="inputProductStock" type="number" name="product_stock" value="${product.product_stock }" required>
	                </div>
	            </div>
	            <div class="inputProduct section4">
	                <div class="inputChild"> 
	                    <label for="inputProductColor">상품 색상</label>
	                    <input id="inputProductColor" type="text" name="product_color" value="${product.product_color }">
	                </div>
	                <div class="inputChild">
		                <div>
		                    <label for="inputProductLength">상품 길이</label>
		                    <input id="inputProductLength" type="number" step="0.01"  name="product_length" value="${product.product_length}">
		                </div>
		                <div>                    
		                    <label for="inputProductWidth">상품 너비</label>
		                    <input id="inputProductWidth" type="number" step="0.01"  name="product_width" value="${product.product_width}">
		                </div>
		                <div>                    
		                    <label for="inputProductHeight">상품 높이</label>
		                    <input id="inputProductHeight" type="number" step="0.01"  name="product_height" value="${product.product_height}">
		                </div>
	                </div>
	            </div>
	            <div class="inputProduct section5">
	                <div class="inputChild">
	                    <label for="inputProductSummary">상품 간단 설명</label>
	                    <textarea id="inputProductSummary" name="product_summary" rows="3" >${product.product_summary}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section6">   
	                <div class="inputChild">         
	                    <label for="inputProductDetails">상품 상세 설명</label>
	                    <textarea id="inputProductDetails" name="product_details" rows="5" >${product.product_details}</textarea>
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
		                <input id="thumbnail2" type='file' name='imageFile' accept="image/*" />
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

<script>
	window.addEventListener('load', loadHandler2('${product.product_largecategory}', '${product.product_mediumcategory}', '${product.product_smallcategory}'))
	window.addEventListener('load', addMoreImageFile)
	document.getElementById('addForm').addEventListener('submit', formSubmitHandler)
	document.querySelectorAll('input[type="file"]').forEach(e => e.addEventListener('change', setThumbnail))
	document.getElementById('largeCategory').addEventListener('change', getSubCategory)
	document.getElementById('mediumCategory').addEventListener('change', getSubCategory)
</script>

<%@ include file="../footer.jsp" %>