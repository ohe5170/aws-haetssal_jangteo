package com.app.haetssal_jangteo.mapper;

import com.app.haetssal_jangteo.common.enumeration.State;
import com.app.haetssal_jangteo.common.enumeration.User;
import com.app.haetssal_jangteo.common.pagination.Criteria;
import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class AdminUserMapperTests {

    @Autowired
    private AdminUserMapper adminUserMapper;

    @Test
    public void testSelectAll() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        List<UserDTO> userList = adminUserMapper.selectAll(criteria, search);
        log.info("{}.......", userList);
    }

    @Test
    public void testSelectTotal() {
        Search search = new Search();
        int total = adminUserMapper.selectTotal(search);
        log.info("Total: {}", total);
    }

    @Test
    public void testSelectAllWithKeyword() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setKeyword("홍길동");
        List<UserDTO> userList = adminUserMapper.selectAll(criteria, search);
        log.info("{}.......", userList);
    }

    @Test
    public void testSelectAllByUserType() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setUserType("");
        List<UserDTO> userList = adminUserMapper.selectAll(criteria, search);
        log.info("{}.......", userList);
    }

    @Test
    public void testSelectAllByUserState() {
        Criteria criteria = new Criteria(1, 100);
        Search search = new Search();
        search.setUserState("active");
        List<UserDTO> userList = adminUserMapper.selectAll(criteria, search);
        log.info("{}.......", userList);
    }

    @Test
    public void testUpdate() {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(1L);
        userDTO.setUserName("홍길동");
        userDTO.setUserEmail("test@gmail.com");
        userDTO.setUserPhone("010-1234-5678");
        userDTO.setUserType(User.NORMAL);
        userDTO.setUserState(State.ACTIVE);
        adminUserMapper.update(userDTO);
    }
}
