package com.app.haetssal_jangteo.repository;

import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.dto.ReportDTO;
import com.app.haetssal_jangteo.dto.ReportMarketDTO;
import com.app.haetssal_jangteo.dto.ReportSellerDTO;
import com.app.haetssal_jangteo.mapper.AdminReportMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminReportDAO {
    private final AdminReportMapper adminReportMapper;

    public int findTotal(Search search) {
        return adminReportMapper.selectTotal(search);
    }

    public List<ReportDTO> findAll(Criteria criteria, Search search) {
        return adminReportMapper.selectAll(criteria, search);
    }

    public void updateReportState(Long id, String state) {
        adminReportMapper.updateReportState(id, state);
    }

    public List<ReportMarketDTO> findMarketReports() {
        return adminReportMapper.selectMarketReports();
    }

    public List<ReportSellerDTO> findSellerReports() {
        return adminReportMapper.selectSellerReports();
    }
}
