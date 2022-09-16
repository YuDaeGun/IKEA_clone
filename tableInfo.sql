DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE IMAGE_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE REFUND_SEQ;
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE PRODUCT_SEQ;

DROP TABLE PRODUCT_CATEGORY;
DROP TABLE PRODUCT_REVIEW;
DROP TABLE PRODUCT_IMAGE;
DROP TABLE CART;
DROP TABLE WISHLIST;
DROP TABLE REFUND;
DROP TABLE ORDERS;
DROP TABLE MEMBER;
DROP TABLE PRODUCT;

CREATE SEQUENCE REVIEW_SEQ          START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE IMAGE_SEQ           START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE CART_SEQ            START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE WISHLIST_SEQ        START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE REFUND_SEQ          START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE ORDERS_SEQ          START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE MEMBER_SEQ          START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;
CREATE SEQUENCE PRODUCT_SEQ         START WITH 1 MAXVALUE 999999999 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE TABLE PRODUCT (
    PRODUCT_IDX             NUMBER          DEFAULT PRODUCT_SEQ.NEXTVAL PRIMARY KEY,    -- 상품 인덱스
    PRODUCT_LARGECATEGORY   VARCHAR2(40)    NOT NULL,   -- 대분류 카테고리
    PRODUCT_MEDIUMCATEGORY  VARCHAR2(40)    NOT NULL,   -- 중분류 카테고리
    PRODUCT_SMALLCATEGORY   VARCHAR2(40)    NOT NULL,   -- 소분류 카테고리
    PRODUCT_NAME            VARCHAR2(100)   NOT NULL,   -- 상품명
    PRODUCT_DESC            VARCHAR2(500),   			-- 상품 상세구성 설명 EX) 침대프레임+침대헤드2
    PRODUCT_SUMMARY         VARCHAR2(1000),             -- 제품 간단 설명
    PRODUCT_DETAILS         VARCHAR2(2000),             -- 제품 상세 설명
    PRODUCT_LENGTH          NUMBER, -- 상품 길이(cm) (미입력 시 -> 0)
    PRODUCT_WIDTH           NUMBER, -- 상품 너비(cm)
    PRODUCT_HEIGHT          NUMBER, -- 상품 높이(cm)
    PRODUCT_STAR			NUMBER, -- 별점평균
    PRODUCT_COLOR           VARCHAR2(50),               -- 상품 색상
    PRODUCT_PRICE           NUMBER          NOT NULL,   -- 상품 가격
    PRODUCT_STOCK           NUMBER          NOT NULL,   -- 상품 재고
    PRODUCT_REGDATE         DATE            DEFAULT SYSDATE     -- 상품 등록일
);

CREATE TABLE MEMBER (
    MEMBER_IDX              NUMBER          DEFAULT MEMBER_SEQ.NEXTVAL PRIMARY KEY,     -- 고객 인덱스
    MEMBER_EMAIL            VARCHAR2(40)    UNIQUE NOT NULL,  -- ID역할
    MEMBER_PW               VARCHAR2(200)   NOT NULL,
    MEMBER_NAME             VARCHAR2(20)    NOT NULL,
    MEMBER_BIRTH            DATE            NOT NULL,
    MEMBER_PNUM             VARCHAR2(20)    NOT NULL,   -- 전화번호
    MEMBER_ZIPCODE          VARCHAR2(20)    NOT NULL,   -- 우편번호
    MEMBER_ADDRESS1         VARCHAR2(200)   NOT NULL,   -- 주소 (API이용시 자동으로 담기는 부분)
    MEMBER_ADDRESS2         VARCHAR2(100),              -- 상세주소와 참고사항
    MEMBER_GENDER           CHAR(1)         CHECK(MEMBER_GENDER IN ('M', 'F', 'X')), -- 성별('M' = 남, 'F' = 여, 'X' = 응답거부) 
    MEMBER_ISDELETED        CHAR(1)         DEFAULT 'N' CHECK(MEMBER_ISDELETED IN ('Y', 'N')), -- 'Y' -> 삭제됨
    MEMBER_REGDATE          DATE            DEFAULT SYSDATE   -- 회원 가입일
);

CREATE TABLE PRODUCT_CATEGORY (
    CATEGORY_NAME       VARCHAR2(40)    NOT NULL,		-- 카테고리명
    CATEGORY_REF        VARCHAR2(40)					-- 상위 카테고리
);

CREATE TABLE PRODUCT_REVIEW (
    REVIEW_IDX              NUMBER          DEFAULT REVIEW_SEQ.NEXTVAL PRIMARY KEY,     -- 상품 리뷰 인덱스
    REVIEW_PI               NUMBER          NOT NULL,   -- FK : 상품 인덱스
    REVIEW_WRITER           VARCHAR2(20)    NOT NULL,   -- 리뷰 작성자
    REVIEW_TITLE            VARCHAR2(50)    NOT NULL,	-- 리뷰 제목
    REVIEW_POINT_ASSEMBLY   NUMBER          DEFAULT -1,   -- 평가 1 : 손쉬운 조립 / 설  (해당 항목에 대한 평가가 없을 시 -1 EX) 식물은 조립에 대한 평가가 없다)
    REVIEW_POINT_COSPER     NUMBER          DEFAULT -1,   -- 평가 2 : 제품 가성비
    REVIEW_POINT_QUALITY    NUMBER          DEFAULT -1,   -- 평가 3 : 제품 품질
    REVIEW_POINT_SHAPE      NUMBER          DEFAULT -1,   -- 평가 4 : 제품 외관
    REVIEW_POINT_FUNCTION   NUMBER          DEFAULT -1,   -- 평가 5 : 제품 기능
    REVIEW_CONTENT          VARCHAR2(2000)  NOT NULL,     -- 리뷰 내용
    REVIEW_RECOMMEND        CHAR(1)         CHECK(REVIEW_RECOMMEND IN ('Y', 'N', 'X')) NOT NULL,	-- 추천 하시겠습니까? ('Y' = 네, 'N' = 아니오, 'X' = 응답없음)
    REVIEW_REGDATE          DATE            DEFAULT SYSDATE,     -- 리뷰 작성일
    
    CONSTRAINT REVIEW_PRODUCT_FK FOREIGN KEY(REVIEW_PI) REFERENCES PRODUCT(PRODUCT_IDX) ON DELETE CASCADE
);

CREATE TABLE PRODUCT_IMAGE (
    IMAGE_IDX               NUMBER          DEFAULT IMAGE_SEQ.NEXTVAL PRIMARY KEY,  -- 상품 이미지 인덱스
    IMAGE_PI                NUMBER          NOT NULL,   -- FK : 상품 인덱스
    IMAGE_FILENAME1         VARCHAR2(100)   NOT NULL,   -- 이미지 파일명 (날짜 + UUID난수)
    IMAGE_FILENAME2         VARCHAR2(100),              -- 마우스 오버시 출력 할 이미지 파일명
    IMAGE_ISTHUMBNAIL       CHAR(1)         CHECK(IMAGE_ISTHUMBNAIL IN ('Y', 'N')) NOT NULL,  -- 대표 이미지인가? ('Y' OR 'N') 
    IMAGE_REGDATE           DATE            DEFAULT SYSDATE,     -- 이미지 등록일
    
    CONSTRAINT IMAGE_PRODUCT_FK FOREIGN KEY(IMAGE_PI) REFERENCES PRODUCT(PRODUCT_IDX) ON DELETE CASCADE
);

CREATE TABLE CART (
    CART_IDX                NUMBER          DEFAULT CART_SEQ.NEXTVAL PRIMARY KEY,   -- 카트(에 담은 상품) 인덱스
    CART_PI                 NUMBER          NOT NULL,   -- FK : 상품 인덱스
    CART_MI                 NUMBER          NOT NULL,   -- FK : 고객 인덱스
    CART_COUNT              NUMBER          NOT NULL,   -- 해당 상품 수량
    CART_REGDATE            DATE            DEFAULT SYSDATE,    -- 카트에 상품을 추가한 날
    
    CONSTRAINT CART_PRODUCT_FK FOREIGN KEY(CART_PI) REFERENCES PRODUCT(PRODUCT_IDX) ON DELETE CASCADE,
    CONSTRAINT CART_MEMBER_FK FOREIGN KEY(CART_MI) REFERENCES MEMBER(MEMBER_IDX) ON DELETE CASCADE
);

CREATE TABLE WISHLIST (
    WISHLIST_IDX            NUMBER          DEFAULT WISHLIST_SEQ.NEXTVAL PRIMARY KEY,   -- 위시리스트(에 담은 상품) 인덱스
    WISHLIST_PI             NUMBER          NOT NULL,   -- FK : 상품 인덱스
    WISHLIST_MI             NUMBER          NOT NULL,   -- FK : 고객 인덱스
    WISHLIST_COUNT          NUMBER          NOT NULL,   -- 해당 상품 수량
    WISHLIST_REGDATE        DATE            DEFAULT SYSDATE,    -- 위시리스트에 상품을 추가한 날
    
    CONSTRAINT WISHLIST_PRODUCT_FK FOREIGN KEY(WISHLIST_PI) REFERENCES PRODUCT(PRODUCT_IDX) ON DELETE CASCADE,
    CONSTRAINT WISHLIST_MEMBER_FK FOREIGN KEY(WISHLIST_MI) REFERENCES MEMBER(MEMBER_IDX) ON DELETE CASCADE
);

CREATE TABLE ORDERS (
    ORDERS_IDX              NUMBER          DEFAULT ORDERS_SEQ.NEXTVAL PRIMARY KEY,     -- 주문(된 상품) 인덱스
    ORDERS_PI               NUMBER          NOT NULL,   -- FK : 상품 인덱스
    ORDERS_MI               NUMBER          NOT NULL,   -- FK : 고객 인덱스
    ORDERS_QUANTITY         NUMBER          NOT NULL,   -- 해당 상품 주문 수량
    ORDERS_STATUS           VARCHAR2(50),               -- 주문상태
    ORDERS_REGDATE          DATE            DEFAULT SYSDATE,    -- 주문 날짜
    
    CONSTRAINT ORDERS_PRODUCT_FK FOREIGN KEY(ORDERS_PI) REFERENCES PRODUCT(PRODUCT_IDX) ON DELETE CASCADE,
    CONSTRAINT ORDERS_MEMBER_FK FOREIGN KEY(ORDERS_MI) REFERENCES MEMBER(MEMBER_IDX) ON DELETE CASCADE
);

CREATE TABLE REFUND (
    REFUND_IDX              NUMBER          DEFAULT REFUND_SEQ.NEXTVAL PRIMARY KEY,     -- 환불(신청된 상품) 인덱스
    REFUND_OI               NUMBER          NOT NULL,   -- FK : 주문(된 상품) 인덱스
    REFUND_REASON           VARCHAR2(2000)  NOT NULL,   -- 환불 사유
    REFUND_IMAGENAME        VARCHAR2(50),               -- 환불 신청 시 첨부한 이미지명
    REFUND_REGDATE          DATE            DEFAULT SYSDATE,    -- 환불 신청 날짜
    
    CONSTRAINT REFUND_ORDERS_FK FOREIGN KEY(REFUND_OI) REFERENCES ORDERS(ORDERS_IDX) ON DELETE CASCADE
);

COMMIT;

-- 카테고리
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES ('가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES ('침대/매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES ('조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES ('수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME) VALUES ('러그/매트/데크');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('게임용가구', '가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('게임용책상', '게임용가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('게임용의자', '게임용가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('게이밍액세서리', '게임용가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('게임용책상/의자 세트', '게임용가구');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대', '가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('더블/퀸/킹 침대', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('소파베드', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납형침대', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('디반침대', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('싱글/수퍼싱글+ 침대', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('간이침대/데이베드', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('쿠션형 침대', '침대');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('어린이 침대', '침대');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('소파', '가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('소파베드', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('패브릭소파', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('모듈식소파', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('풋스툴/발받침대', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('소파/암체어용 커퍼', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('천연/인조가죽 소파', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('야외용 소파', '소파');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('긴의자/카우치', '소파');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('식탁/책상', '가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('책상/컴퓨터책상', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대협탁', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('커피테이블/보조테이블', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('식탁세트', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('식탁', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('기저귀교환대', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('화장대', '식탁/책상');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('어린이테이블', '식탁/책상');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납장/장식장', '가구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('거실수납시스템', '수납장/장식장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('거실장/찬장', '수납장/장식장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('장식장', '수납장/장식장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납장', '수납장/장식장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납유닛/수납장', '수납장/장식장');


INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대', '침대/매트리스');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침구', '침대/매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침구', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('쿠션/쿠션커버', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('이불', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('담요/스로우', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('베드스프레드/스로우', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('매트리스/베개보호패드', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('베개', '침구');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대 헤드보드 커버', '침구');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('매트리스', '침대/매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('스프링 매트리스', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('폼/라텍스 매트리스', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('매트리스/베개보호패드', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('매트리스토퍼', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('어린이 매트리스', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('일체형 매트리스 베이스', '매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('영유아 매트리스', '매트리스');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대수납', '침대/매트리스');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('침대수납', '침대수납');


INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('일반 조명', '조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('탁상스탠드', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('플로어스탠드', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('전등갓/본체/코드', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('LED 조명', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('천장조명', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('작업등', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('벽부착등', '일반 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('어린이 조명', '일반 조명');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('장식 조명', '조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('장식용 펜던트 조명', '장식 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('LED 양초', '장식 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('테이블 조명 장식', '장식 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('LED 랜턴', '장식 조명');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('스트링 라이트', '장식 조명');


INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납장/장식장', '수납/정리');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('옷장', '수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('맞춤형 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('여닫이 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('미닫이 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('오픈형 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('현관 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('어린이 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('거울 옷장', '옷장');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('독립형 옷장', '옷장');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('소형 수납/정리', '수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수납형/바구니', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('서류/미디어정리용품', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('식품보관/정리', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('의류정리용품', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('욕실 용품', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('휴지통/봉투', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('후크/옷걸이', '소형 수납/정리');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('전선정리/관련용품', '소형 수납/정리');


INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('러그', '러그/매트/데크');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('러그L/M', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('장식보/러그S', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('수제 러그', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('야외용 러그', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('도어매트', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('양가죽/소가죽', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('미끄럼방지/깔개', '러그');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('원형러그', '러그');

INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('도어매트', '러그/매트/데크');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NAME, CATEGORY_REF) VALUES ('도어매트', '도어매트');

COMMIT;
