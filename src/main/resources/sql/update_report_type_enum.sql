use haetssal_jangteo;

-- tbl_report 테이블의 report_type enum 수정
-- 'report' -> 'item', 'user' 추가

ALTER TABLE tbl_report
MODIFY COLUMN report_type enum('market', 'seller', 'item', 'user') default 'item';

-- 기존 'report' 값을 'item' 또는 'user'로 변경 (필요한 경우)
-- 상품 신고는 'item'으로
UPDATE tbl_report r
INNER JOIN tbl_report_item ri ON r.id = ri.report_id
SET r.report_type = 'item'
WHERE r.report_type = 'report';

-- 회원 신고는 'user'로
UPDATE tbl_report r
INNER JOIN tbl_report_user ru ON r.id = ru.report_id
SET r.report_type = 'user'
WHERE r.report_type = 'report';
