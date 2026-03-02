//package com.app.haetssal_jangteo.mapper;
//
//import com.app.haetssal_jangteo.common.pagination.Criteria;
//import com.app.haetssal_jangteo.common.search.Search;
//import com.app.haetssal_jangteo.dto.*;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//
//@SpringBootTest
//@Slf4j
//public class AdminReportMapperTests {
//
//    @Autowired
//    private AdminReportMapper adminReportMapper;
//
//    @Test
//    public void testSelectAll() {
//        Criteria criteria = new Criteria(1, 100);
//        Search search = new Search();
//        List<ReportDTO> reportList = adminReportMapper.selectAll(criteria, search);
//        log.info("{}.......", reportList);
//    }
//
//    @Test
//    public void testSelectTotal() {
//        Search search = new Search();
//        int total = adminReportMapper.selectTotal(search);
//        log.info("Total: {}", total);
//    }
//
//    @Test
//    public void testSelectAllByType() {
//        Criteria criteria = new Criteria(1, 100);
//        Search search = new Search();
//        search.setType("item");
//        List<ReportDTO> reportList = adminReportMapper.selectAll(criteria, search);
//        log.info("{}.......", reportList);
//    }
//
//    @Test
//    public void testSelectItemReportById() {
//        ReportItemDTO reportItem = adminReportMapper.selectItemReportById(1L);
//        log.info("{}.......", reportItem);
//    }
//
//    @Test
//    public void testSelectUserReportById() {
//        ReportUserDTO reportUser = adminReportMapper.selectUserReportById(1L);
//        log.info("{}.......", reportUser);
//    }
//
//    @Test
//    public void testSelectMarketReportById() {
//        ReportMarketDTO reportMarket = adminReportMapper.selectMarketReportById(1L);
//        log.info("{}.......", reportMarket);
//    }
//
//    @Test
//    public void testSelectSellerReportById() {
//        ReportSellerDTO reportSeller = adminReportMapper.selectSellerReportById(1L);
//        log.info("{}.......", reportSeller);
//    }
//}
