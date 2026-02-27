package com.app.haetssal_jangteo.repository;

import com.app.haetssal_jangteo.dto.ItemDTO;
import com.app.haetssal_jangteo.mapper.MainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MainDAO {
    private final MainMapper mainMapper;

    // 최신 순으로 상품 목록
    public List<ItemDTO> findItemsByRecent(int limit) {
        return mainMapper.selectItemsByRecent(limit);
    }

    // 조회수 높은 순으로 상품 목록
    public List<ItemDTO> findItemsByViewCount(int limit) {
        return mainMapper.selectItemsByViewCount(limit);
    }
}
