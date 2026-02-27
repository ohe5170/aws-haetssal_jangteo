package com.app.haetssal_jangteo.repository;

import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.domain.StoreVO;
import com.app.haetssal_jangteo.dto.ItemDTO;
import com.app.haetssal_jangteo.dto.StoreDTO;
import com.app.haetssal_jangteo.dto.UserDTO;
import com.app.haetssal_jangteo.mapper.AdminHomeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminHomeDAO {
    private final AdminHomeMapper adminHomeMapper;

    //    상품 전체 조회
    public List<ItemDTO> selectItemAll() {
        return adminHomeMapper.selectItemAll();
    }

    //   가게 전체 조회
    public List<StoreDTO> findAllStores() {
        return adminHomeMapper.selectStoreAll();
    }

    //   회원 전체 조회
    public List<UserDTO> findUserAll() {
        return adminHomeMapper.selectUserAll();
    }

    //   오늘 판매된 상품 수
    public int getTodaySalesCount() {
        return adminHomeMapper.selectTodaySalesCount();
    }

    //   누적 가입자 수
    public int getTotalUserCount() {
        return adminHomeMapper.selectTotalUserCount();
    }

    //   오늘 접수된 신고 수
    public int getTodayReportCount() {
        return adminHomeMapper.selectTodayReportCount();
    }
}
