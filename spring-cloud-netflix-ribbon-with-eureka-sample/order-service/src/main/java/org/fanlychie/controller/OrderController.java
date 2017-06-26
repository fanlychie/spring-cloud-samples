package org.fanlychie.controller;

import org.fanlychie.data.OrderRepository;
import org.fanlychie.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by fanlychie on 2017/6/20.
 */
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/find/{uid:[1-9]\\d+}")
    public List<Order> findByUid(@PathVariable Integer uid) {
        System.out.println("------------------------------------------------");
        System.out.println("------------------ 方法被调用 ------------------");
        System.out.println("------------------------------------------------");
        return orderRepository.findByUid(uid);
    }

}