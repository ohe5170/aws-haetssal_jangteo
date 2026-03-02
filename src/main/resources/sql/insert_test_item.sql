use haetssal_jangteo;

-- 테스트용 상품 등록
INSERT INTO tbl_item (
    item_store_id,
    item_category_id,
    item_name,
    item_type,
    item_stock,
    item_price,
    item_delivery_fee,
    item_content,
    item_state,
    item_view_count
) VALUES (
    1,                              -- item_store_id: 가게 ID (기존 가게 ID 사용)
    1,                              -- item_category_id: 카테고리 ID (기존 카테고리 ID 사용)
    '신선한 사과',                   -- item_name: 상품명
    'normal',                       -- item_type: 일반 상품
    '100',                          -- item_stock: 재고
    '5000',                         -- item_price: 가격
    '3000',                         -- item_delivery_fee: 배송비
    '맛있고 신선한 국내산 사과입니다. 농약을 최소한으로 사용하여 안전하게 재배했습니다.',  -- item_content: 상품 설명
    'active',                       -- item_state: 활성 상태
    0                               -- item_view_count: 조회수 0
);

-- 등록된 상품 확인
SELECT * FROM tbl_item ORDER BY id DESC LIMIT 1;

use haetssal_jangteo;

-- 테이블 구조 확인
DESCRIBE tbl_store;

-- 만약 store_category_id 컬럼이 없다면 추가
ALTER TABLE tbl_store
    ADD COLUMN store_category_id bigint unsigned AFTER store_owner_id;
