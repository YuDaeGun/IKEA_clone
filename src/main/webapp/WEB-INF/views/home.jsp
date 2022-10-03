<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
   
    <main>
        <article id="leng">
            <section class="home_sect1">
                <div class="sect1_title">
                    <div class="sect1_title_info">
                        <h2 class="sect_h2">IKEA Familyメンバー特別価格</h2>
                        <span>IKEA Familyメンバーの皆さまへの感謝の気持ちとして、今月のおすすめ特別価格商品をご紹介。</span>
                    </div>
                    <div class="sect1_title_sale">
                        <button class="sect1_title_salebtn"><span>詳しく見る</span></button>
                    </div>
                </div>
                <div class="grid_teaser">
                    <div class="grid_big"><img class="grid_img" src="${cpath }/IKEA_image/sect1_main.avif"></div>
                    <div class="grid_small"><img class="grid_img" src="${cpath }/IKEA_image/sect1_center1.avif"></div>
                    <div class="grid_middle"><img class="grid_img" src="${cpath }/IKEA_image/sect1_right1.avif"></div>
                    <div class="grid_middle2"><img class="grid_img" src="${cpath }/IKEA_image/sect1_center2.avif"></div>
                    <div class="grid_small2"><img class="grid_img" src="${cpath }/IKEA_image/sect1_right2.avif"></div>
                </div>
            </section>
            
            <section class="home_sect2">
                <div class="sect2_main">
                    <div class="swiper sect2_teaser">
                        <div class="swiper-wrapper">
                            <div class="sect2_slide swiper-slide">
                                <div class="sect2_teaser_container"> 
                                    <div class="sect2_teaser_img">
                                        <img src="${cpath }/IKEA_image/sect2_first.avif">
                                    </div>
                                    <div class="sect2_content_main base01">
                                        <div class="sect2_content">
                                            <div class="sect2_teaser_content">
                                                <h2 class="sect2_h2">IKEA Familyメンバー限定</h2>
                                                <span class="sect2_subcontent">TRÅDFRI/トロードフリ スマートLED電球 2つ購入で10%off</span>
                                            </div>
                                            <div class="sect2_arrow">
                                                <img src="${cpath }/IKEA_image/arrow.svg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sect2-slide swiper-slide">
                                <div class="sect2_teaser_container">
                                    <div class="sect2_teaser_img">
                                        <img src="${cpath }/IKEA_image/sect2_sec.avif">
                                    </div>
                                    <div class="sect2_content_main base02">
                                        <div class="sect2_content">
                                            <div class="sect2_teaser_content">
                                                <h2 class="sect2_h2">ゲーミング環境をアップグレードしよう</h2>
                                                <span class="sect2_subcontent">性能がさらに向上したSTYRSPEL/スティルスペル ゲーミングチェアをご紹介します。熱戦中も涼しく快適に過ごせるチェアです。</span>
                                            </div>
                                            <div class="sect2_arrow">
                                                <img src="${cpath }/IKEA_image/arrow.svg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sect2-slide swiper-slide">
                                <div class="sect2_teaser_container">
                                    <div class="sect2_teaser_img">
                                        <img src="${cpath }/IKEA_image/sect2_third.avif">
                                    </div>
                                    <div class="sect2_content_main base03">
                                        <div class="sect2_content">
                                            <div class="sect2_teaser_content">
                                                <h2 class="sect2_h2">ものに居場所を</h2>
                                                <span class="sect2_subcontent">毎日のかたづけを楽にするコツ。それは洋服や仕事道具、子どものおもちゃなどに最適な定位置をつくってあげること。自分と家族の時間が増えればもっと豊かに、もっと自分らしく。毎日を楽しもう。</span>
                                            </div>
                                            <div class="sect2_arrow">
                                                <img src="${cpath }/IKEA_image/arrow.svg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sect2-slide swiper-slide">
                                <div class="sect2_teaser_container">
                                    <div class="sect2_teaser_img">
                                        <img src="${cpath }/IKEA_image/sect2_four.avif">
                                    </div>
                                    <div class="sect2_content_main base04">
                                        <div class="sect2_content">
                                            <div class="sect2_teaser_content">
                                                <h2 class="sect2_h2">特集一覧</h2>
                                                <span class="sect2_subcontent">季節のアイデア、整理整頓や家具選びのコツなど、暮らしをよくするヒントをご紹介します。</span>
                                            </div>
                                            <div class="sect2_arrow">
                                                <img src="${cpath }/IKEA_image/arrow.svg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
                        <div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
                     	<div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </section>
            
            <section class="home_sect6">
                <div class="sect6_title">
                    <h2>人気のカテゴリを見てみよう</h2>
                </div>
                <div class="swiper sect6_slide">
                    <div class="swiper-wrapper">
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_ベッド"><img src="${cpath }/IKEA_image/ベッド.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_ソファ"><img src="${cpath }/IKEA_image/ソファ.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/家具_椅子・チェア"><img src="${cpath }/IKEA_image/椅子・チェア.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_棚・ラック"><img src="${cpath }/IKEA_image/棚・ラック.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_チェスト・引き出し収納"><img src="${cpath }/IKEA_image/チェスト・引き出し収納.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/収納家具・収納グッズ_テレビ台・テレビボード"><img src="${cpath }/IKEA_image/テレビ台・テレビボード.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/照明_照明器具・ランプ"><img src="${cpath }/IKEA_image/照明器具・ランプ.png"></a></div>
                        <div class="sect6-slide swiper-slide"><a href="${cpath }/product/categoryView/照明_イルミネーションライト"><img src="${cpath }/IKEA_image/イルミネーションライト.png"></a></div>
                    </div>
                    <div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
                    <div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
                    <div class="swiper-scrollbar"></div>
                </div>
            </section>

            <section class="home_sect3">
                <div class="sect3_title">
                    <h2>イケアの新商品</h2>
                </div>
                <div class="sect3_product"></div>
                <div class="sect3_main">
                    <div class="swiper sect3_teaser">
						<div class="swiper-wrapper">
							<c:forEach var="p" items="${newProducts }">
								<div class="sect3_slide swiper-slide">
									<div class="sect3_teaser_container">
										<div class="sect3_teaser_img">
											<img src="${cpath }/IKEA_productImage/${p.image_filename1 }">
											<a href="${cpath }/product/view/${p.product_idx }">
												<img id="hover_img" class="sect3_banner2" src="${cpath }/IKEA_productImage/${p.image_filename2 }">
											</a>
										</div>
										<div class="sect3_teaser_content">
											<div class="sect3_product_name">
												<h3>${p.product_name }</h3>
											</div>
											<div class="sect3_product_desc">
												<span>${p.product_desc }, ${p.product_length } x ${p.product_width }cm</span>
											</div>
											<div class="sect3_product_price">
												<span>￦</span><h2><fmt:formatNumber value="${p.product_price }"/></h2>
											</div>
											<div class="sect3_product_star">
												<span id="rating">
									            	<img src="${cpath }/IKEA_image/${p.product_star >= 1 ? 'star.jpg' : p.product_star >= 0.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
									            	<img src="${cpath }/IKEA_image/${p.product_star >= 2 ? 'star.jpg' : p.product_star >= 1.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
									            	<img src="${cpath }/IKEA_image/${p.product_star >= 3 ? 'star.jpg' : p.product_star >= 2.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
									            	<img src="${cpath }/IKEA_image/${p.product_star >= 4 ? 'star.jpg' : p.product_star >= 3.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
									            	<img src="${cpath }/IKEA_image/${p.product_star >= 5 ? 'star.jpg' : p.product_star >= 4.5 ? 'halfstar.jpg' : 'nostar.jpg'}">
												</span>
												<span>(${p.product_star })</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
		                    </div>
							<div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
		                    <div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
							<div class="swiper-scrollbar"></div>
		                </div>
					</div>
            </section>

            <section class="home_sect1">
                <div class="sect1_title">
                    <div class="sect1_title_info">
                        <h2 class="sect_h2">KRÖSAMOS/クローサモス コレクション</h2>
                        <span>食品をおいしく保存したり、食事の時間を記憶に残るものにしたり、旬の風味を楽しむのにぴったりのコレクションです。</span>
                    </div>
                    <div class="sect1_title_sale">
                        <button class="sect1_title_salebtn"><span>KRÖSAMOS/クローサモス コレクションを見る</span></button>
                    </div>
                </div>
                <div class="grid_teaser">
                    <div class="grid_big"><img class="grid_img" src="${cpath }/IKEA_image/sect5_main.avif"></div>
                    <div class="grid_small"><img class="grid_img" src="${cpath }/IKEA_image/sect5_cen1.avif"></div>
                    <div class="grid_middle"><img class="grid_img" src="${cpath }/IKEA_image/sect5_right1.avif"></div>
                    <div class="grid_middle2"><img class="grid_img" src="${cpath }/IKEA_image/sect5_cen2.avif"></div>
                    <div class="grid_small2"><img class="grid_img" src="${cpath }/IKEA_image/sect5_right2.avif"></div>
                </div>
            </section>

            <section class="home_sect8_service">
                <div class="sect8_title">
                    <h2>イケアの便利なサービス</h2>
                </div>
                <div class="sect8_icon">
                    <div class="swiper sect8_slide">
                        <div class="swiper-wrapper">
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/truckicon.webp">
                                <span class="sect8-slide_icon">配送サービス</span>
                            </div>
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/gasStation.webp">
                                <span class="sect8-slide_icon">受取りサービス</span>
                            </div>
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/Drill.webp">
                                <span class="sect8-slide_icon">組立て・ソーイングサービス</span>
                            </div>
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/phone.webp">
                                <span class="sect8-slide_icon">プランニングサービス</span>
                            </div> 
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/kitchen.png">
                                <span class="sect8-slide_icon">キッチン関連サービス</span>
                            </div>
                            <div class="sect8-slide swiper-slide">
                                <img src="${cpath }/IKEA_image/accounting.png">
                                <span class="sect8-slide_icon">分割払いサービス</span>
                            </div>
                            <div class="sect8-slide swiper-slide">
                                <span class="sect8-slide_icon">すべて見る</span>
                            </div>
                        </div>
                        <div class="swiper-button-next"><img src="${cpath }/IKEA_image/rightArrow.png"></div>
                        <div class="swiper-button-prev"><img src="${cpath }/IKEA_image/leftArrow.png"></div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </section>

            <section class="home_sect7">
                <div class="sect7_teaser">
                    <div class="sect7_teaser_first"><img src="${cpath }/IKEA_image/85c7f831ea3a5fc3d6e350ff6e3d7899.avif"></div>
                    <div class="sect7_teaser_second"><img src="${cpath }/IKEA_image/f33146c55fba6dd20e19b09b4c5e9e24.avif"></div>
                </div>
                <div class="sect7_teaser">
                    <div class="sect7_teaser_first"><img src="${cpath }/IKEA_image/d0c2660f68ffaa4440cd88df4f37548b.avif"></div>
                    <div class="sect7_teaser_second"><img src="${cpath }/IKEA_image/e66b7b22a207df1d61f9459e8681c844.jpg"></div>
                </div>
            </section>
            
        </article>
    </main>
    
	<script src="${cpath }/resources/js/newProductList.js"></script>
	
<%@ include file="footer.jsp" %>