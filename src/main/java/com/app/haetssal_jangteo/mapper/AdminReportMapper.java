package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminReportMapper {
    // 전체 신고 목록 조회
    List<ReportDTO> selectAll(@Param("criteria") Criteria criteria, @Param("search") Search search);

    // 전체 개수
    int selectTotal(@Param("search") Search search);

    // 상품 신고 상세 조회
    ReportItemDTO selectItemReportById(@Param("reportId") Long reportId);

    // 회원 신고 상세 조회
    ReportUserDTO selectUserReportById(@Param("reportId") Long reportId);

    // 마켓 신고 상세 조회
    ReportMarketDTO selectMarketReportById(@Param("reportId") Long reportId);

    // 판매자 신고 상세 조회
    ReportSellerDTO selectSellerReportById(@Param("reportId") Long reportId);

    // 신고 상태 업데이트
    void updateReportState(@Param("reportId") Long reportId, @Param("state") String state);
}
