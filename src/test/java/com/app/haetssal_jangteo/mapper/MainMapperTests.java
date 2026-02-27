package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.dto.ItemDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class MainMapperTests {

    @Autowired
    private MainMapper mainMapper;

    @Test
    public void testSelectItemsByRecent() {
        List<ItemDTO> items = mainMapper.selectItemsByRecent(20);
        log.info("최신 상품 개수: {}", items.size());
        items.forEach(item -> {
            log.info("상품 ID: {}, 이름: {}, 가격: {}, 가게: {}, 이미지: {}",
                    item.getId(),
                    item.getItemName(),
                    item.getItemPrice(),
                    item.getStoreName(),
                    item.getItemImageUrl());
        });
    }

    @Test
    public void testSelectItemsByViewCount() {
        List<ItemDTO> items = mainMapper.selectItemsByViewCount(20);
        log.info("조회수 높은 상품 개수: {}", items.size());
        items.forEach(item -> {
            log.info("상품 ID: {}, 이름: {}, 조회수: {}, 가게: {}",
                    item.getId(),
                    item.getItemName(),
                    item.getItemViewCount(),
                    item.getStoreName());
        });
    }
}
