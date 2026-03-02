use haetssal_jangteo;

-- 신고 테스트 데이터 추가
-- 주의: 실제 존재하는 user_id와 item_id를 사용해야 합니다

-- 1. 상품 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (1, 'item', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), NOW());

INSERT INTO tbl_report_item (report_id, item_id, report_reason, report_content)
VALUES (1, (SELECT id FROM tbl_item ORDER BY id LIMIT 1), '부적절한 상품', '이 상품은 판매 금지 품목입니다. 확인 후 조치 바랍니다.');


-- 2. 회원 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (2, 'user', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), NOW());

INSERT INTO tbl_report_user (report_id, user_id, report_reason, report_content)
VALUES (2, (SELECT id FROM tbl_user ORDER BY id LIMIT 1 OFFSET 1), '욕설 및 비방', '해당 회원이 채팅에서 욕설을 사용했습니다.');


-- 3. 추가 상품 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (3, 'item', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), DATE_SUB(NOW(), INTERVAL 1 DAY));

INSERT INTO tbl_report_item (report_id, item_id, report_reason, report_content)
VALUES (3, (SELECT id FROM tbl_item ORDER BY id LIMIT 1 OFFSET 1), '사기 의심', '실제 상품과 다른 이미지를 사용하고 있습니다.');


-- 4. 추가 회원 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (4, 'user', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), DATE_SUB(NOW(), INTERVAL 2 DAY));

INSERT INTO tbl_report_user (report_id, user_id, report_reason, report_content)
VALUES (4, (SELECT id FROM tbl_user ORDER BY id LIMIT 1 OFFSET 2), '스팸 행위', '무분별한 광고 메시지를 보내고 있습니다.');


-- 5. 장터(market) 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (5, 'market', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), DATE_SUB(NOW(), INTERVAL 3 DAY));

INSERT INTO tbl_report_market (report_id, market_id, report_state)
VALUES (5, (SELECT id FROM tbl_market ORDER BY id LIMIT 1), 'pending');



-- 6. 추가 장터(market) 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (6, 'market', (SELECT id FROM tbl_user ORDER BY id LIMIT 1 OFFSET 1), DATE_SUB(NOW(), INTERVAL 4 DAY));

INSERT INTO tbl_report_market (report_id, market_id, report_state)
VALUES (6, (SELECT id FROM tbl_market ORDER BY id LIMIT 1 OFFSET 1), 'pending');


-- 7. 판매자(seller) 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (7, 'seller', (SELECT id FROM tbl_user ORDER BY id LIMIT 1), DATE_SUB(NOW(), INTERVAL 5 DAY));

INSERT INTO tbl_report_seller (report_id, seller_id, report_state)
VALUES (7, (SELECT id FROM tbl_seller ORDER BY id LIMIT 1), 'pending');


-- 8. 추가 판매자(seller) 신고
INSERT INTO tbl_report (id, report_type, report_reporter_id, created_datetime)
VALUES (8, 'seller', (SELECT id FROM tbl_user ORDER BY id LIMIT 1 OFFSET 1), DATE_SUB(NOW(), INTERVAL 6 DAY));

INSERT INTO tbl_report_seller (report_id, seller_id, report_state)
VALUES (8, (SELECT id FROM tbl_seller ORDER BY id LIMIT 1 OFFSET 1), 'approved');

use haetssal_jangteo;

-- 1. 기존 tbl_report_item에서 삭제
DELETE FROM tbl_report_item WHERE report_id = 1;

-- 2. report_type 변경
UPDATE tbl_report
SET report_type = 'seller'
WHERE id = 1;

-- 3. tbl_report_seller에 데이터 추가
INSERT INTO tbl_report_seller (report_id, seller_id, report_state)
VALUES (1, (SELECT id FROM tbl_seller ORDER BY id LIMIT 1), 'pending');
-- 먼저 user를 seller로 등록
INSERT INTO tbl_seller (id, seller_bank_name, seller_depositor, seller_account_number, seller_state)
VALUES ((SELECT id FROM tbl_user ORDER BY id LIMIT 1), '국민은행', '홍길동', '123-456-789012', 'approved');

-- 그 다음 신고 데이터 추가
DELETE FROM tbl_report_seller WHERE report_id = 1;

INSERT INTO tbl_report_seller (report_id, seller_id, report_state)
VALUES (1, (SELECT id FROM tbl_seller ORDER BY id LIMIT 1), 'pending');
