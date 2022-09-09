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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- swiper : https://swiperjs.com/get-started -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	
	<link type='text/css' rel="stylesheet" href="${cpath }/resources/css/header.css">
	<script>const cpath = '${cpath}'</script>
</head>
<body>
	<header>
		<div id="hnf_value" class="wrap">
			<div class="hnf_message wrap">
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/Truck.svg"><span>새로운 배송 요금</span></a>
				</div>
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/telephone.svg"><span>실시간 주문 서비스</span></a>
				</div>
				<div class="hnf_message_inner">
					<a href="#none"><img src="${cpath }/IKEA_image/basket.svg"><span>IKEA 인기제품</span></a>
				</div>
			</div>
		</div>
		<div class="hnf_hamburger">
			<div class="hnf_header_aside wrap">
				<button type="button" class="hnf_btn_hamburger"><span><img src="${cpath }/IKEA_image/hamburger.svg"></span></button>
				<button type="button" class="hnf_btn_menu"><span>메뉴</span></button>
			</div>
		</div>
		<div class="wrap">
			<div class="hnf_page_container wrap">
				<div class="hnf_header_container">
					<div class="hnf_head_cont_logo">
						<a href="${cpath }"><img src="${cpath }/IKEA_image/ikea.svg"></a>
					</div>
					<div class="hnf_header_search wrap">
						<div class="hnf_header_searchForm wrap">
							<form class="header_search">
								<img class="lense" src="${cpath }/IKEA_image/lense.svg">
								<input type="text" name="search" placeholder="검색어 입력"><span class="camera_btn">
									<button type="submit"><img src="${cpath }/IKEA_image/camera.svg"></button>
								</span>
							</form>
						</div>
					</div>
					<div class="hnf_loginUI wrap">
						<div class="hnf_login_container">
							<div class="hnf_login_profile">
								<c:if test="${not empty loginInfo}">
									<a href="${cpath }/member/logout">
										<span id="profile_span"><img src="${cpath }/IKEA_image/login.svg"><span>Hej! ${loginInfo.member_name }</span></span>
									</a>
									<a href="${cpath }/member/accountManagement" class="hnf_account">계정관리</a>
								</c:if>
								<c:if test="${empty loginInfo}">
									<li><a href="${cpath }/member/login">로그인하기 또는 회원가입</a>
								</c:if>
							</div>
							<div class="hnf_login_btn">
								<img src="${cpath }/IKEA_image/like.svg">
							</div>
							<div class="hnf_login_btn">
								<img src="${cpath }/IKEA_image/basket2.svg">
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
						<li><a href="#none">모든 제품</a></li>
						<li><a href="#none">온라인 쇼룸</a></li>
						<li><a href="#none">홈 액세서리</a></li>
						<li><a href="#none">서비스</a></li>
					</ul>
					<ul class="hnf_cont_nav_ul2">
						<li>
							<button class="hnf_nav_btn">
								<span><img src="${cpath }/IKEA_image/truck2.svg"><span>우편 번호 입력</span></span>
							</button>
						</li>
						<li>
							<button class="hnf_nav_btn">
								<span><img src="${cpath }/IKEA_image/offline.svg"><span>매장 찾기</span></span>
							</button>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	    <aside class="allmenu_popup">
	        <div class="allmenu_popup_container">
	            <div class="allmenu_popup_top">
	                <div class="allmenu_popup_close">
	                    <img src="${cpath }/IKEA_image/closepopup.svg" alt="">
	                </div>
	                <div class="allmenu_popup_logo">
	                	<a href="${cpath }/">
		                    <img src="${cpath }/IKEA_image/ikea.svg" alt="">
	                	</a>
	                </div>
	            </div>
	            <div class="allmenu_popupmenu">
	                <div class="backspace_popup"><img src="${cpath }/IKEA_image/backspace.svg" alt=""></div>
	                <div class="popupmenu_depth1_wrap">
	                    <div class="popupmenu_depth1">
	                        <h1>모든 제품</h1>
	                        <ul class="popupmenu_depth2">
	                            <li id="IKEA 여름상품" onclick="getSubCategory(event)">IKEA 여름상품</li>
	                            <li id="가구" onclick="getSubCategory(event)">가구</li>
	                            <li id="침대/매트리스" onclick="getSubCategory(event)">침대/매트리스</li>
	                            <li id="화분" onclick="getSubCategory(event)">화분</li>
	                            <li id="수납/정리" onclick="getSubCategory(event)">수납/정리</li>
	                            <li id="러그/매트/데크" onclick="getSubCategory(event)">러그/매트/데크</li>
	                            <li id="홈데코/장식품" onclick="getSubCategory(event)">홈데코/장식품</li>
	                        </ul>
	                    </div>
	                    <div class="popupmenu_depth1">
	                        <h1>온라인 쇼룸</h1>
	                    </div>
	                    <div class="popupmenu_depth1">
	                        <h1>홈 액세서리</h1>
	                    </div>
	                    <div class="eventmenu">
	                        <ul>
	                            <li><a href="#none">할인 중</a></li>
	                            <li><a href="#none">신제품</a></li>
	                            <li><a href="#none">아이디어</a></li>
	                            <li><a href="#none">새로운 소식</a></li>
	                            <li><a href="#none">브랜드 캠페인</a></li>
	                        </ul>
	                        <ul>
	                            <li><a href="#none">매장안내</a></li>
	                            <li><a href="#none">IKEA Family</a></li>
	                            <li><a href="#none">IKEA for Business</a></li>
	                            <li><a href="#none">IKEA Live</a></li>
	                            <li><a href="#none">고객지원</a></li>
	                            <li><a href="#none">배송조회</a></li>
	                            <li><a href="#none">내 프로필</a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="popupmenu_depth2_wrap">
	                    <div class="popupmenu_depth3">
	                        <div class="popupmenu_depth3_menu">
	                            <h3>IKEA 여름상품</h3>
	                            <ul id="IKEA 여름상품Sub"></ul>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>가구</h3>
	                            <ul id="가구Sub"></ul>
	                            <div class="draw_memo"></div>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>침대/매트리스</h3>
	                            <ul id="침대/매트리스Sub"></ul>
	                            <div class="draw_memo"></div>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>화분</h3>
	                            <ul id="화분Sub"></ul>
	                            <div class="draw_memo"></div>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>수납/정리</h3>
	                            <ul id="수납/정리Sub"></ul>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>러그/매트</h3>
	                            <ul id="러그/매트/데크Sub"></ul>
	                        </div>
	                        <div class="popupmenu_depth3_menu">
	                            <h3>홈데코/장식품</h3>
	                            <ul id="홈데코/장식품Sub"></ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        <div class="allmenu_dim"></div>
    </aside>
    
	</header>