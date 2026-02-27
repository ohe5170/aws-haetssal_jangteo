package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.common.enumeration.StoreState;
import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.domain.StoreVO;
import com.app.haetssal_jangteo.dto.StoreDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class AdminStoreMapperTests {

    @Autowired
    private AdminStoreMapper adminStoreMapper;

    @Test
    public void testSelectAllStores() {
        List<StoreVO> storeList = adminStoreMapper.selectAllStores();
        log.info("전체 가게 수: {}", storeList.size());
        storeList.forEach(store -> log.info("가게: {}", store));
    }

    @Test
    public void testSelectAll() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        List<StoreDTO> storeList = adminStoreMapper.selectAll(criteria, search);
        log.info("{}.......", storeList);
    }

    @Test
    public void testSelectTotal() {
        Search search = new Search();
        int total = adminStoreMapper.selectTotal(search);
        log.info("Total: {}", total);
    }

    @Test
    public void testSelectAllWithKeyword() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setKeyword("마트");
        List<StoreDTO> storeList = adminStoreMapper.selectAll(criteria, search);
        log.info("{}.......", storeList);
    }

    @Test
    public void testSelectAllByRegion() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setStoreRegion("서울");
        List<StoreDTO> storeList = adminStoreMapper.selectAll(criteria, search);
        log.info("{}.......", storeList);
    }

    @Test
    public void testSelectAllByState() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setStoreState("open");
        List<StoreDTO> storeList = adminStoreMapper.selectAll(criteria, search);
        log.info("{}.......", storeList);
    }

    @Test
    public void testSelectDistinctRegions() {
        List<String> regions = adminStoreMapper.selectDistinctRegions();
        log.info("{}.......", regions);
    }

    @Test
    public void testUpdate() {
        StoreDTO storeDTO = new StoreDTO();
        storeDTO.setId(1L);
        storeDTO.setStoreName("이가네 과일야채");
        storeDTO.setStoreAddress("서울특별시 강남구");
        storeDTO.setStoreIntro("안녕하세요");
        storeDTO.setStoreState(StoreState.PENDING);
        adminStoreMapper.update(storeDTO);
    }
}
