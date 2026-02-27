package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.dto.ItemDTO;
import com.app.haetssal_jangteo.dto.StoreDTO;
import com.app.haetssal_jangteo.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class AdminHomeMapperTests {

    @Autowired
    private AdminHomeMapper adminHomeMapper;

    @Test
    public void testSelectUserAll() {
        List<UserDTO> userList = adminHomeMapper.selectUserAll();
        log.info("전체 회원 수: {}", userList.size());
        userList.forEach(user -> log.info("회원: {}", user));
    }

    @Test
    public void testSelectStoreAll() {
        List<StoreDTO> storeList = adminHomeMapper.selectStoreAll();
        log.info("전체 가게 수: {}", storeList.size());
        storeList.forEach(store -> log.info("가게: {}", store));
    }

    @Test
    public void testSelectItemAll() {
        List<ItemDTO> itemList = adminHomeMapper.selectItemAll();
        log.info("전체 상품 수: {}", itemList.size());
        itemList.forEach(item -> log.info("상품: {}", item));
    }
}

