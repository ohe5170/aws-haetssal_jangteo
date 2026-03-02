-- 모든 가게의 store_category_id를 1로 설정
UPDATE tbl_store
SET store_category_id = 1
WHERE store_category_id IS NULL;

-- 또는 특정 가게만 설정하려면:
-- UPDATE tbl_store
-- SET store_category_id = 1
-- WHERE id = 1;

-- 실행 후 확인
SELECT id, store_name, store_category_id, store_state
FROM tbl_store;
