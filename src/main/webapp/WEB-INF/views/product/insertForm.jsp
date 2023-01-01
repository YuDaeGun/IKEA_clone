<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/product.css">

<div class="insert_wrap all">
	<div class="space"></div>
	<h1>商品追加 (管理者専用ページ)</h1><br>
	<div class="insert_wrap_container">
	    <div class="input_wrap">
	        <form id="addForm" method="post" enctype="multipart/form-data">
            	<div class="inputProduct section1">
	                <div class="selectInputChild">
	                    <label for="largeCategory">*大分類</label>
	                    <select id="largeCategory" name="product_largecategory" required></select>
	                </div>
	                <div class="selectInputChild">
	                    <label for="mediumCategory">*中分類</label>
	                    <select id="mediumCategory" name="product_mediumcategory" required></select>
	                </div>
            	    <div class="selectInputChild">
	                    <label for="smallCategory">*小分類</label>
	                    <select id="smallCategory" name="product_smallcategory" required></select>
	                </div>
            	</div>
	            <div class="inputProduct section2">
	                <div class="inputChild">
	                    <label for="inputProductName">*商品名</label>
	                    <input id="inputProductName" name="product_name" required>
	                </div>
	                <div class="inputChild">
	                    <label for="inputProductDesc">*構成</label>
	                    <input id="inputProductDesc" name="product_desc" required>
	                </div>
	            </div>
	            <div class="inputProduct section3">
	                <div class="inputChild">
	                	<div>
		                    <label for="inputProductPrice">*価格</label>
		                    <input id="inputProductPrice" name="product_price_String" onkeyup="inputNumberFormat(this)" required>
		                </div>
		                <div><br>円</div>
	                </div>
	                <div class="inputChild">                
	                    <label for="inputProductStock">*在庫</label>
	                    <input id="inputProductStock" type="number" name="product_stock" required>
	                </div>
	            </div>
	            <div class="inputProduct section4">
	                <div class="inputChild"> 
	                    <label for="inputProductColor">色</label>
	                    <input id="inputProductColor" name="product_color">
	                </div>
	                <div class="inputChild">
		                <div>
		                    <label for="inputProductLength">長さ(cm)</label>
		                    <input id="inputProductLength" type="number" name="product_length">
		                </div>
		                <div>                    
		                    <label for="inputProductWidth">幅(cm)</label>
		                    <input id="inputProductWidth" type="number" name="product_width">
		                </div>
		                <div>                    
		                    <label for="inputProductHeight">高さ(cm)</label>
		                    <input id="inputProductHeight" type="number" name="product_height">
		                </div>
	                </div>
	            </div>
	            <div class="inputProduct section5">
	                <div class="inputChild">
	                    <label for="inputProductSummary">商品説明（簡単）</label>
	                    <textarea id="inputProductSummary" name="product_summary" rows="3"></textarea>
	                </div>
	            </div>
	            <div class="inputProduct section6">   
	                <div class="inputChild">         
	                    <label for="inputProductDetails">商品説明（詳細）</label>
	                    <textarea id="inputProductDetails" name="product_details" rows="5"></textarea>
	                </div>
	            </div>
	            
	            <div class="inputProduct section7">
	            	<div>
		            	<label for="thumbnail1">*代表イメージ１</label>
		                <input id="thumbnail1" type='file' name='imageFile' accept="image/*" required />
		                <div></div>
	                </div>
	                <div>
		            	<label for="thumbnail2">*代表イメージ２</label>
		                <input id="thumbnail2" type='file' name='imageFile' accept="image/*" required />
		                <div></div>
	                </div>
		            <div>
		                <br><input type="button" value="より多くのイメージ" onclick="addMoreImageFile()"><br>
		            </div>
	            </div>
          	    <div id="d_file"></div>
	        </form>
         	    <div class="section8">
       	        <span><button onclick="window.location.reload()">初期化</button></span> 
         	    	<span><input type="submit" form="addForm" value="商品追加完了"></span> 
            </div>
	    </div>
	</div>
</div>

<script src="${cpath }/resources/js/product.js"></script>

<script>
	window.addEventListener('load', loadHandler)
	window.addEventListener('load', addMoreImageFile)
	document.getElementById('addForm').addEventListener('submit', formSubmitHandler)
	document.querySelectorAll('input[type="file"]').forEach(e => e.addEventListener('change', setThumbnail))
	document.getElementById('largeCategory').addEventListener('change', getSubCategory)
	document.getElementById('mediumCategory').addEventListener('change', getSubCategory)
</script>

<%@ include file="../footer.jsp" %>