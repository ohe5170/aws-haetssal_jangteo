//package com.app.haetssal_jangteo.mapper;
//
//import com.app.haetssal_jangteo.common.enumeration.StoreState;
//import com.app.haetssal_jangteo.dto.StoreDTO;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//@Slf4j
//public class AdminStoreMapperTests {
//
//    @Autowired
//    private AdminStoreMapper adminStoreMapper;
//
//    @Test
//    public void testUpdateStoreState() {
//        // Given
//        StoreDTO storeDTO = adminStoreMapper.selectById(1L);
//        log.info("수정 전 가게 상태: {}", storeDTO);
//
//        // When
//        storeDTO.setStoreState(StoreState.OPEN);
//        storeDTO.setStoreName("식후경");
//        storeDTO.setStoreAddress("경기 양평");
//        adminStoreMapper.update(storeDTO);
//
//        // Then
//        StoreDTO updatedStore = adminStoreMapper.selectById(1L);
//        log.info("수정 후 가게 상태: {}", updatedStore);
//        log.info("storeState: {}", updatedStore.getStoreState());
//    }
//}
