package com.app.haetssal_jangteo.service.main;

import com.app.haetssal_jangteo.dto.HomeWithPagingDTO;
import com.app.haetssal_jangteo.dto.ItemDTO;
import com.app.haetssal_jangteo.repository.MainDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class MainService {
    private final MainDAO mainDAO;

    // 홈 페이지 데이터 조회
    public HomeWithPagingDTO getHomeData() {
        HomeWithPagingDTO homeWithPagingDTO = new HomeWithPagingDTO();

        // 최신 상품 조회
        List<ItemDTO> recentItems = mainDAO.findItemsByRecent(20);
        homeWithPagingDTO.setItems(recentItems);

        return homeWithPagingDTO;
    }

    // 인기 상품 목록 조회 (조회수 높은 순)
    public List<ItemDTO> getPopularItems(int limit) {
        return mainDAO.findItemsByViewCount(limit);
    }

    // 최신 순으로 상품 목록 조회
    public List<ItemDTO> getItemsByRecent(int limit) {
        return mainDAO.findItemsByRecent(limit);
    }

    // 조회수 높은 순으로 상품 목록 조회
    public List<ItemDTO> getItemsByViewCount(int limit) {
        return mainDAO.findItemsByViewCount(limit);
    }

    // 주제별 상품 목록 조회 (상품 주제란용)
    public List<ItemDTO> getTopicItems(int limit) {
        // 추천 상품이나 특정 주제의 상품을 조회
        // 임시로 최신 상품으로 대체
        return mainDAO.findItemsByRecent(limit);
    }

    // 카테고리별 상품 목록 조회 (첫 번째)
    public List<ItemDTO> getCategoryItems(int limit) {
        // 특정 카테고리의 상품을 조회
        // 임시로 조회수 높은 상품으로 대체
        return mainDAO.findItemsByViewCount(limit);
    }

    // 카테고리별 상품 목록 조회 (두 번째)
    public List<ItemDTO> getCategoryItems2(int limit) {
        // 다른 카테고리의 상품을 조회
        // 임시로 최신 상품으로 대체
        return mainDAO.findItemsByRecent(limit);
    }
}
