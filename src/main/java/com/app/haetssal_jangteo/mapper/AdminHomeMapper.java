package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.dto.ItemDTO;
import com.app.haetssal_jangteo.dto.StoreDTO;
import com.app.haetssal_jangteo.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminHomeMapper {
    //    회원 목록
    public List<UserDTO> selectUserAll();

    //    가게 목록
    public List<StoreDTO> selectStoreAll();

    //    상품 목록
    public List<ItemDTO> selectItemAll();

    //    오늘 판매된 상품 수
    public int selectTodaySalesCount();

    //    누적 가입자 수
    public int selectTotalUserCount();

    //    오늘 접수된 신고 수
    public int selectTodayReportCount();
}
