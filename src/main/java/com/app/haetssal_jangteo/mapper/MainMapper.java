package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.dto.ItemDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainMapper {
    // 최신 순으로 상품 조회
    List<ItemDTO> selectItemsByRecent(@Param("limit") int limit);

    // 조회수 높은 순으로 상품 조회
    List<ItemDTO> selectItemsByViewCount(@Param("limit") int limit);
}
