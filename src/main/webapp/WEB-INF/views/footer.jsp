<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<footer>
        <div class="footer_container">
            <div class="footer_main">
                <div class="footer_main_left">
                    <h3>IKEA Family</h3>
                    <p>
                    	지금 IKEA Family에 무료로 가입하고<br>
                     	다양한 멤버 전용 혜택을 누리세요.
                    </p>
                    <p><a href="#none">자세히 보기</a></p>
                    <a class="footer_ikea_join" href="#none">IKEA Family 가입하기</a>
                </div>
                <div class="footer_main_right">
                    <ul class="footer_right_big">
                        <li>
                            <h3>고객문의</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">고객지원</a></li>
                                <li><a href="#none">자주 묻는 질문</a></li>
                                <li><a href="#none">문의하기</a></li>
                                <li><a href="#none">배송조회</a></li>
                                <li><a href="#none">교환환불</a></li>
                                <li><a href="#none">품질보증</a></li>
                                <li><a href="#none">제품리콜</a></li>
                                <li><a href="#none">피드백</a></li>
                                <li><a href="#none">부품 신청</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3>쇼핑하기</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">쇼핑하기</a></li>
                                <li><a href="#none">전화 주문</a></li>
                                <li><a href="#none">IKEA for Business</a></li>
                                <li><a href="#none">셀프 플래닝</a></li>
                                <li><a href="#none">IKEA 모바일 앱</a></li>
                                <li><a href="#none">제품 사용 팁/ 가이드</a></li>
                                <li><a href="#none">제품 구매 가이드</a></li>
                                <li><a href="#none">결제 옵션</a></li>
                                <li><a href="#none">기프트 카드</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3>서비스</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">IKEA 서비스</a></li>
                                <li><a href="#none">배송 서비스</a></li>
                                <li><a href="#none">조립 서비스</a></li>
                                <li><a href="#none">설치 서비스</a></li>
                                <li><a href="#none">주방 서비스</a></li>
                                <li><a href="#none">플래닝 서비스</a></li>
                                <li><a href="#none">인테리어 디자인 서비스</a></li>
                                <li><a href="#none">바이백 서비스</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3>IKEA 이야기</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">브랜드 소개</a></li>
                                <li><a href="#none">집에서의 삶</a></li>
                                <li><a href="#none">지속 가능한 생활</a></li>
                                <li><a href="#none">내가 아끼는 집, 나를 아끼는 집</a></li>
                                <li><a href="#none">뉴스룸</a></li>
                                <li><a href="#none">채용정보</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer_icon_menu">
                <div class="footer_media_icon">
                    <ul>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/facebook.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/insta.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/youtube.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/kakao.svg"></a></li>
                    </ul>
                </div>
                <div class="footer_language_icon">
                    <ul>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/global.svg"><span>국가 변경</span></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/global.svg"><span>한국어</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="annotation">
                <span>© Inter IKEA Systems B.V 1999-2022</span>
                <div>
                    <ul>
                        <li>개인정보처리방침</li>
                        <li>쿠키 정책</li>
                        <li>쿠키 설정</li>
                        <li>웹사이트 이용약관</li>
                        <li>Responsible disclosure</li>
                    </ul>
                </div>
            </div>
            <div class="legal_inform">
                <p>
                	IKEA 코리아<br>
                	주소 : (우) 14352  경기도 광명시 일직로 17 IKEA광명점<br>
                   	사업자 등록번호 : 106-86-82871 <a href="#none">사업자정보확인</a><br>
                   	대표자 : 프레드릭 요한손<br>
					통신판매업 신고 : 2018-경기광명-0209<br>
					TEL : 1670-4532
				</p>
            </div>
        </div>
    </footer>

	<aside class="allmenu_popup">
		<div class="allmenu_popup_container">
			<div class="allmenu_popup_top">
				<div class="allmenu_popup_close">
					<img src="${cpath }/IKEA_image/closepopup.svg" alt="">
				</div>
				<div class="allmenu_popup_logo">
					<a href="${cpath }/"> <img src="${cpath }/IKEA_image/ikea.svg"
						alt="">
					</a>
				</div>
			</div>
			<div class="allmenu_popupmenu">
				<div class="backspace_popup">
					<img src="${cpath }/IKEA_image/backspace.svg" alt="">
				</div>
				<div class="popupmenu_depth1_wrap">
					<div class="popupmenu_depth1">
						<h1>모든 제품</h1>
						<ul class="popupmenu_depth2">
							<li id="가구" onclick="getSubCategory(event)">가구</li>
							<li id="침대/매트리스" onclick="getSubCategory(event)">침대/매트리스</li>
							<li id="조명" onclick="getSubCategory(event)">조명</li>
							<li id="수납/정리" onclick="getSubCategory(event)">수납/정리</li>
							<li id="러그/매트/데크" onclick="getSubCategory(event)">러그/매트/데크</li>
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
							<h3>가구</h3>
							<ul id="가구Sub"></ul>
							<div class="list_image"><img src="${cpath }/IKEA_image/furnitureList.png"></div>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>침대/매트리스</h3>
							<ul id="침대/매트리스Sub"></ul>
							<div class="list_image"><img src="${cpath }/IKEA_image/mattressList.png"></div>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>조명</h3>
							<ul id="조명Sub"></ul>
							<div class="list_image"><img src="${cpath }/IKEA_image/lightList.png"></div>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>수납/정리</h3>
							<ul id="수납/정리Sub"></ul>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>러그/매트/데크</h3>
							<ul id="러그/매트/데크Sub"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="allmenu_dim"></div>
	</aside>

	<script src="${cpath }/resources/js/header.js"></script>
	<script src="${cpath }/resources/js/swiper.js"></script>
		
</body>
</html>