package com.app.haetssal_jangteo.controller.admin;

import com.app.haetssal_jangteo.common.search.Search;
import com.app.haetssal_jangteo.dto.*;
import com.app.haetssal_jangteo.mapper.CategoryMapper;
import com.app.haetssal_jangteo.service.admin.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final CategoryMapper categoryMapper;

    @GetMapping
    public String admin() {
        return "redirect:/admin/home";
    }

    @GetMapping("/items")
    public String items(@RequestParam(defaultValue = "1") int page, Search search, Model model) {
        ItemWithPagingDTO itemWithPagingDTO = adminService.list(page, search);
        model.addAttribute("itemWithPagingDTO", itemWithPagingDTO);
        model.addAttribute("search", search);
        model.addAttribute("categories", categoryMapper.selectCateAll());
        return "admin/items";
    }

    @GetMapping("/stores")
    public String stores(@RequestParam(defaultValue = "1") int page, Search search, Model model) {
        StoreWithPagingDTO storeWithPagingDTO = adminService.storeList(page, search);
        model.addAttribute("storeWithPagingDTO", storeWithPagingDTO);
        model.addAttribute("search", search);
        // 고정된 지역 목록
        model.addAttribute("regions", java.util.Arrays.asList(
            "서울", "경기", "인천", "강원", "충북", "충남", "대전",
            "경북", "경남", "부산", "울산", "대구", "전북", "전남", "광주"
        ));
        return "admin/stores";

    }

    @GetMapping("/users")
    public String users(@RequestParam(defaultValue = "1") int page, Search search, Model model) {
        UserWithPagingDTO userWithPagingDTO = adminService.userList(page, search);
        model.addAttribute("userWithPagingDTO", userWithPagingDTO);
        model.addAttribute("search", search);
        return "admin/users";
    }

    @GetMapping("/reports")
    public String reports(@RequestParam(defaultValue = "1") int page, Search search, Model model) {
        ReportWithPagingDTO reportWithPagingDTO = adminService.reportList(page, search);
        model.addAttribute("reportWithPagingDTO", reportWithPagingDTO);
        model.addAttribute("search", search);
        model.addAttribute("marketReports", adminService.getMarketReports());
        model.addAttribute("sellerReports", adminService.getSellerReports());
        return "admin/reports";
    }

    @GetMapping("/home")
    public String home(Model model) {
        HomeWithPagingDTO homeWithPagingDTO = adminService.getHomeData();
        model.addAttribute("users", homeWithPagingDTO.getUsers());
        model.addAttribute("stores", homeWithPagingDTO.getStores());
        model.addAttribute("items", homeWithPagingDTO.getItems());
        model.addAttribute("todaySalesCount", homeWithPagingDTO.getTodaySalesCount());
        model.addAttribute("totalUserCount", homeWithPagingDTO.getTotalUserCount());
        model.addAttribute("todayReportCount", homeWithPagingDTO.getTodayReportCount());
        return "admin/home";
    }

}
