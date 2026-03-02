use haetssal_jangteo;

-- 가락시장 확인
SELECT * FROM tbl_market WHERE market_name LIKE '%가락%';

-- 모든 market 조회
SELECT * FROM tbl_market;

-- market 신고 데이터 확인
SELECT rm.report_id, rm.market_id, rm.report_state,
       m.market_name, m.market_region
FROM tbl_report_market rm
LEFT JOIN tbl_market m ON rm.market_id = m.id;

-- report와 함께 확인
SELECT r.id, r.report_type, r.created_datetime,
       rm.market_id, rm.report_state,
       m.market_name, m.market_region
FROM tbl_report r
LEFT JOIN tbl_report_market rm ON r.id = rm.report_id
LEFT JOIN tbl_market m ON rm.market_id = m.id
WHERE r.report_type = 'market'
ORDER BY r.id DESC;
