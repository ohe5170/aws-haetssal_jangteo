-- 테스트용 상품 데이터 추가
-- 기존 상품이 있다면 모두 ACTIVE 상태로 변경
UPDATE tbl_item SET item_state = 'ACTIVE' WHERE item_state IS NULL;


-- 추가 테스트 상품 데이터 (상점 ID와 카테고리 ID는 실제 데이터에 맞게 조정)
INSERT INTO tbl_item (item_store_id, item_category_id, item_name, item_price, item_stock, item_delivery_fee, item_content, item_view_count, item_state)
SELECT
    (SELECT MIN(id) FROM tbl_store),
    (SELECT MIN(id) FROM tbl_category),
    CONCAT('테스트 상품 ', n),
    FLOOR(1000 + RAND() * 50000),
    FLOOR(10 + RAND() * 100),
    CASE WHEN RAND() > 0.5 THEN 0 ELSE 3000 END,
    CONCAT('테스트 상품 ', n, '의 상세 설명.'),
    FLOOR(RAND() * 1000),
    'ACTIVE'
FROM (
    SELECT 1 as n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL
    SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL
    SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) numbers
WHERE NOT EXISTS (SELECT 1 FROM tbl_item LIMIT 10);

-- 확인
SELECT COUNT(*) as total_items FROM tbl_item;
SELECT COUNT(*) as active_items FROM tbl_item WHERE item_state = 'ACTIVE' OR item_state IS NULL;

UPDATE tbl_item SET item_state = 'ACTIVE' WHERE item_state IS NULL;
UPDATE tbl_item SET item_view_count = FLOOR(RAND() * 1000) WHERE item_view_count IS NULL OR item_view_count = 0;

-- 기존 상품을 ACTIVE 상태로 변경
UPDATE tbl_item SET item_state = 'ACTIVE' WHERE item_state IS NULL;

-- 조회수를 랜덤값으로 설정
UPDATE tbl_item SET item_view_count = FLOOR(RAND() * 1000) WHERE item_view_count IS NULL OR item_view_count = 0;

-- 상품 데이터 확인
SELECT COUNT(*) FROM tbl_item WHERE item_state = 'ACTIVE' OR item_state IS NULL;

-- 상품이 없다면 테스트 데이터 삽입


