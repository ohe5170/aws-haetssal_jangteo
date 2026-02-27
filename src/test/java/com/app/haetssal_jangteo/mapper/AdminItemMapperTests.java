package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.common.enumeration.State;
import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.domain.ItemVO;
import com.app.haetssal_jangteo.dto.ItemDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class AdminItemMapperTests {

    @Autowired
    private AdminItemMapper adminItemMapper;

    @Test
    public void testSelectAll() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        List<ItemDTO> itemList = adminItemMapper.selectAll(criteria, search);
        log.info("{}.......", itemList);
    }

    @Test
    public void testSelectTotal() {
        Search search = new Search();
        int total = adminItemMapper.selectTotal(search);
        log.info("Total: {}", total);
    }

    @Test
    public void testSelectAllWithKeyword() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setKeyword("배");
        List<ItemDTO> itemList = adminItemMapper.selectAll(criteria, search);
        log.info("{}.......", itemList);
    }

    @Test
    public void testSelectAllByCategoryId() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setCategoryId("축산물");
        List<ItemDTO> itemList = adminItemMapper.selectAll(criteria, search);
        log.info("{}.......", itemList);
    }

    @Test
    public void testSelectAllByItemState() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setItemState("active");
        List<ItemDTO> itemList = adminItemMapper.selectAll(criteria, search);
        log.info("{}.......", itemList);
    }

    @Test
    public void testSelectDistinctCategories() {
        List<String> categories = adminItemMapper.selectDistinctCategories();
        log.info("{}.......", categories);
    }

    @Test
    public void testUpdate() {
        ItemVO itemVO = ItemVO.builder()
                .id(1L)
                .itemName("수정된 상품명")
                .itemPrice("25000")
                .itemType("normal")
                .itemState(State.ACTIVE)
                .build();
        adminItemMapper.update(itemVO);
    }
}
