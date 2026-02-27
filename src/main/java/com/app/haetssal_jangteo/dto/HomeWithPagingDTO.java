package com.app.haetssal_jangteo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class HomeWithPagingDTO {
    private List<ItemDTO> items;
    private List<StoreDTO> stores;
    private List<UserDTO> users;
    private int todaySalesCount;
    private int totalUserCount;
    private int todayReportCount;
}
