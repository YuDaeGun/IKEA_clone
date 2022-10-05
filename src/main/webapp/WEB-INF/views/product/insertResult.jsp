<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/product.css">

	<div class="insert_wrap all">
	    <h1>[${p.product_name}] 商品の追加・修正が完了しました (管理者専用ページ)</h1><br>
	    <div class="input_wrap">
	        <form>
            	<div class="inputProduct section1">
	                <div class="selectInputChild">
	                    <label for="largeCategory">大分類</label>
	                    <input id="largeCategory" value="${p.product_largecategory}" readonly>
	                </div>
	                <div class="selectInputChild">
	                    <label for="mediumCategory">中分類</label>
	                    <input id="mediumCategory" value="${p.product_mediumcategory}" readonly>
	                </div>
            	    <div class="selectInputChild">
	                    <label for="smallCategory">小分類</label>
	                    <input id="smallCategory" value="${p.product_smallcategory}" readonly>
	                </div>
            	</div>
	            <div class="inputProduct section2">
	                <div class="inputChild">
	                    <label for="inputProductName">商品名</label>
	                    <input id="inputProductName" value="${p.product_name}" readonly>
	                </div>
	                <div class="inputChild">
	                    <label for="inputProductDesc">構成</label>
	                    <input id="inputProductDesc" value="${p.product_desc}" readonly>
	                </div>
	            </div>
	            <div class="inputProduct section3">
	                <div class="inputChild">
	                	<div>
		                    <label for="inputProductPrice">価格</label>
		                    <input id="inputProductPrice" value="<fmt:formatNumber value='${p.product_price}'/>" readonly>
		                </div>
		                <div><br>원</div>
	                </div>
	                <div class="inputChild">                
	                    <label for="inputProductStock">在庫</label>
	                    <input id="inputProductStock" value="${p.product_stock}" readonly>
	                </div>
	            </div>
	            <div class="inputProduct section4">
	                <div class="inputChild"> 
	                    <label for="inputProductColor">色</label>
	                    <input id="inputProductColor" value="${p.product_color}" readonly>
	                </div>
	                <div class="inputChild">
		                <div>
		                    <label for="inputProductLength">長さ(cm)</label>
		                    <input id="inputProductLength" value="${p.product_length != 0 ? p.product_length : ''}" readonly>
		                </div>
		                <div>
		                    <label for="inputProductWidth">幅(cm)</label>
		                    <input id="inputProductWidth" value="${p.product_width != 0 ? p.product_width : ''}" readonly>
		                </div>
		                <div>
		                    <label for="inputProductHeight">高さ(cm)</label>
		                    <input id="inputProductHeight" value="${p.product_height != 0 ? p.product_height : ''}" readonly>
		                </div>
	                </div>
	            </div>
	            <div class="inputProduct section5">
	                <div class="inputChild">
	                    <label for="inputProductSummary">商品説明（簡単）</label>
	                    <textarea id="inputProductSummary" rows="3" readonly>${p.product_summary}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section6">
	                <div class="inputChild">
	                    <label for="inputProductDetails">商品説明（詳細）</label>
	                    <textarea id="inputProductDetails" rows="5" readonly>${p.product_details}</textarea>
	                </div>
	            </div>
	            <div class="inputProduct section7">
	          	    <div class="printImages">
		          	    <c:forEach var="image" items="${imageList}">
		          	    <div>
	          	    		<img src="${cpath }/IKEA_productImage/${image.image_filename1 }">
	          	    	</div>
	          	    	<div>
	    	      	    	<c:if test="${image.image_filename2 != null}">
		          	    		<img src="${cpath }/IKEA_productImage/${image.image_filename2 }">
	    	      	    	</c:if>
	    	      	    </div>
			    		</c:forEach>
		            </div>
	    		</div>
	    	</form>
	        <div class="section8">
	        	<div>
		        	<button onclick="location.href='${cpath }/product/insertForm'">続いて追加</button>
		        	<button onclick="location.href='${cpath }/product/modifyForm/${p.product_idx}'">修正</button>
	        	</div>
	        	<div>
		        	<button onclick="location.href='${cpath }/product/view/${p.product_idx}'">商品詳細ページへ</button>
	        	</div>
           </div>
	    </div>
	</div>

<script src="${cpath }/resources/js/product.js"></script>

<%@ include file="../footer.jsp" %>