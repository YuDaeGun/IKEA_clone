<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<footer>
        <div class="footer_container">
            <div class="footer_main">
                <div class="footer_main_left">
                    <h3>IKEA Familyに入会する</h3>
                    <p>IKEA Familyメンバーになると、お買い得な商品や便利なサービスなど、さまざまな会員特典をご利用いただけます。入会費・年会費無料。</p>
                    <p><a href="#none">詳しく見る</a></p>
                    <a class="footer_ikea_join" href="${cpath }/member/login">入会する</a>
                </div>
                <div class="footer_main_right">
                    <ul class="footer_right_big">
                        <li>
                            <h3>お買い物＆サービス</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">配送</a></li>
                                <li><a href="#none">配送状況の確認</a></li>
                                <li><a href="#none">お支払方法</a></li>
                                <li><a href="#none">プランニング</a></li>
                                <li><a href="#none">アプリ</a></li>
                                <li><a href="#none">店舗検索</a></li>
                                <li><a href="#none">すべて見る</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3>サポート</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">よくある質問</a></li>
                                <li><a href="#none">お問い合わせ</a></li>
                                <li><a href="#none">返品</a></li>
                                <li><a href="#none">品質保証</a></li>
                                <li><a href="#none">ご意見・ご感想</a></li>
                            </ul>
                        </li>
                        <li>
                            <h3>イケアについて</h3>
                            <ul class="footer_right_small">
                                <li><a href="#none">イケアの概念</a></li>
                                <li><a href="#none">サステナビリティ</a></li>
                                <li><a href="#none">採用情報</a></li>
                                <li><a href="#none">ニュースルーム</a></li>
                                <li><a href="#none">IKEAカタログ（出版物）</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer_icon_menu">
                <div class="footer_media_icon">
                    <ul class="circle">
                        <li><a href="#none"><img src="${cpath }/IKEA_image/facebook.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/insta.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/youtube.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/kakao.svg"></a></li>
                    </ul>
                    <ul class="square">
                        <li><a href="#none"><img src="${cpath }/IKEA_image/visa.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/master-card.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/jcb.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/diners-club.svg"></a></li>
                        <li><a href="#none"><img src="${cpath }/IKEA_image/american-express.svg"></a></li>
                    </ul>
                </div>
                <div class="footer_language_icon">
                    <ul>
                        <li><a href="#none"><span></span><span>国の変更</span></a></li>
                        <li><a href="#none"><span>日本語 - Japanese</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="annotation">
                <span>© Inter IKEA Systems B.V 1999-2022</span>
                <div>
                    <ul>
                        <li>プライバシーポリシー</li>
                        <li>利用規約</li>
                        <li>Cookieポリシー</li>
                        <li>Cookie設定</li>
                        <li>特定商取引法に基づく表記</li>
                        <li>古物営業法に基づく表記</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

	<aside class="allmenu_popup">
		<div class="allmenu_popup_container">
			<div class="allmenu_popup_top">
				<div class="allmenu_popup_close">
					<img src="${cpath }/IKEA_image/closepopup.svg">
				</div>
				<div class="allmenu_popup_logo">
					<a href="${cpath }"><img src="${cpath }/IKEA_image/ikea.svg"></a>
				</div>
			</div>
			<div class="allmenu_popupmenu">
				<div class="backspace_popup">
					<img src="${cpath }/IKEA_image/backspace.svg" alt="">
				</div>
				<div class="popupmenu_depth1_wrap">
					<div class="popupmenu_depth1">
						<h1>商品一覧</h1>
						<ul class="popupmenu_depth2">
							<li id="家具" onclick="getSubCategory(event)">家具</li>
							<li id="照明" onclick="getSubCategory(event)">照明</li>
							<li id="収納家具・収納グッズ" onclick="getSubCategory(event)">収納家具・収納グッズ</li>
						</ul>
					</div>
					<div class="popupmenu_depth1"><h1>部屋別</h1></div>
					<div class="popupmenu_depth1"><h1>お買い得情報</h1></div>
					<div class="eventmenu">
						<ul>
							<li><a href="#none">特集一覧</a></li>
							<li><a href="#none">レストランメニュー</a></li>
						</ul>
						<ul>
							<li><a href="#none">IKEA Familyメンバー特別価格</a></li>
							<li><a href="#none">法人のお客さま</a></li>
							<li><a href="#none">店舗検索</a></li>
							<li><a href="#none">配送サービス</a></li>
							<li><a href="#none">配送状況の確認</a></li>
							<li><a href="#none">お買い物＆サービス</a></li>
						</ul>
					</div>
				</div>
				<div class="popupmenu_depth2_wrap">
					<div class="popupmenu_depth3">
						<div class="popupmenu_depth3_menu">
							<h3>家具</h3>
							<ul id="家具Sub"></ul>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>照明</h3>
							<ul id="照明Sub"></ul>
						</div>
						<div class="popupmenu_depth3_menu">
							<h3>収納家具・収納グッズ</h3>
							<ul id="収納家具・収納グッズSub"></ul>
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