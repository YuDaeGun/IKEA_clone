<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IKEA_clone</title>
	<!-- google font : https://fonts.google.com/noto/specimen/Noto+Sans+KR -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">
	
	<!-- swiper : https://swiperjs.com/get-started -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	
	<script src = "http://code.jquery.com/jquery-latest.js"></script> 
	
	<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/header.css">
	<script>const cpath = '${cpath}'</script>
</head>
<body>
	<header>
		<div id="hnf_value" class="wrap">
			<div class="hnf_message">
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/Truck.svg"><span>小物配送サービスがお手ごろ料金に！￥500～</span></a>
				</div>
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/telephone.svg"><span>電話・チャット注文サービス</span></a>
				</div>
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/basket.svg"><span>IKEA 人気商品</span></a>
				</div>
			</div>
		</div>
		<div class="hnf_hamburger">
			<div class="hnf_header_aside">
				<button type="button" class="hnf_btn_hamburger"><span><img src="${cpath }/IKEA_image/hamburger.svg"></span></button>
				<button type="button" class="hnf_btn_menu"><span>メニュー</span></button>
			</div>
		</div>
		<div class="wrap">
			<div class="hnf_page_container">
				<div class="hnf_header_container">
					<div class="hnf_head_cont_logo">
						<a href="${cpath }/"><img src="${cpath }/IKEA_image/ikea.svg"></a>
					</div>
					<div class="hnf_header_search">
						<div class="hnf_header_searchForm">
							<input id="searchProduct" type="text" placeholder="商品・コンテンツを検索" onkeyup="if(window.event.keyCode == 13) enterkey()">
							<img src="${cpath }/IKEA_image/lense.png" onclick="enterkey()">
						</div>
					</div>
					<div class="hnf_loginUI">
						<div class="hnf_login_container">
							<c:if test="${empty loginInfo}">
								<div class="hnf_login_profile">
									<span><a href="${cpath }/member/login">ログイン・新規入会</a></span>
								</div>
							</c:if>
							
							<c:if test="${not empty loginInfo}">
								<div>
									<div id="profile_div"><img src="${cpath }/IKEA_image/login.svg"><span>こんにちは、${loginInfo.member_name1 }さん！</span></div>
									<div id="loggedInUserMenu">
										<div class="hnf_login_profile2">
											<a href="${cpath }/member/mypage">マイページ</a>
										</div>
										<div class="hnf_login_profile2">
											<a href="${cpath }/member/logout">ログアウト</a>
										</div>
									</div>
								</div>
							</c:if>
							
							<div class="hnf_login_btn">
								<img src="${cpath }/IKEA_image/like.svg">
							</div>
							<div class="hnf_login_btn">
								<a href="${cpath }/product/cart">
									<img src="${cpath }/IKEA_image/basket2.png">
								</a>
								<div class="cartNumber_circle displayNone">
									<a href="${cpath }/product/cart">
										<span id="cartNumber"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="hnf_page_container_2nd">
			<div class="hnf_cont_2nd">
				<nav class="hnf_cont_nav">
					<ul class="hnf_cont_nav_ul">
						<li><a href="#none">商品一覧</a></li>
						<li><a href="#none">部屋別</a></li>
						<li><a href="#none">いつでも、低価格</a></li>
						<li><a href="#none">お買い得情報</a></li>
					</ul>
					<ul class="hnf_cont_nav_ul2">
						<li>
							<a class="hnf_nav_btn" href="${cpath }/product/insertForm">
								<span class="adminpage">商品追加</span>
							</a>
						</li>
						<li>
							<a class="hnf_nav_btn" href="#none">
								<span><img src="${cpath }/IKEA_image/truck2.svg"><span>郵便番号を入力</span></span>
							</a>
						</li>
						<li>
							<a class="hnf_nav_btn" href="#none">
								<span><img src="${cpath }/IKEA_image/offline.svg"><span>ストアを選択</span></span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
	</header>