package com.app.haetssal_jangteo.controller.main;

import com.app.haetssal_jangteo.dto.HomeWithPagingDTO;
import com.app.haetssal_jangteo.service.main.MainService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {
    private final MainService mainService;

    @GetMapping("/header")
    public String header() {
        return "main/header";
    }

    @GetMapping({"/home"})
    public String home(Model model) {
        HomeWithPagingDTO homeWithPagingDTO = mainService.getHomeData();
        model.addAttribute("items", homeWithPagingDTO.getItems());
        model.addAttribute("popularItems", mainService.getPopularItems(20));
        model.addAttribute("topicItems", mainService.getTopicItems(8));
        model.addAttribute("categoryItems", mainService.getCategoryItems(6));
        model.addAttribute("categoryItems2", mainService.getCategoryItems2(6));
        return "main/home";
    }
}
