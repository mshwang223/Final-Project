package com.spring_boot.FinalProject.controller;

import com.spring_boot.FinalProject.model.CartVO;

import com.spring_boot.FinalProject.model.OrderVO;
import com.spring_boot.FinalProject.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;

@Controller
public class PayController {

    private final OrderService orderService;

    @Autowired
    public PayController(OrderService orderService) {
        this.orderService = orderService;
    }

    // 장바구니 가기
    @RequestMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        String sid = (String) session.getAttribute("sid");
        if (sid == null) {
            return "ACCESS_DENIED";
        }
        List<CartVO> cartList = orderService.selectCartByUserId(sid);
        model.addAttribute("count", cartList.size());
        int sum = cartList.stream().mapToInt(CartVO::getPrice).sum();
        model.addAttribute("totalPrice", new DecimalFormat("#,###").format(sum));
        model.addAttribute("cartList", cartList);
        return "subPage/cart";
    }

    @ResponseBody
    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String pay(HttpSession session, Model model, @RequestBody List<OrderVO> list) {
        String sid = (String) session.getAttribute("sid");
        if (sid == null) {
            return "ACCESS_DENIED";
        }
        list.forEach(i->i.setUserId(sid));

		try {
			orderService.insertOrder(list);
		} catch (Exception e) {
            e.printStackTrace();
			return "error";
		}


        return "success";
    }


}