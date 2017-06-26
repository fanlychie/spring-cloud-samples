package org.fanlychie.controller;

import org.fanlychie.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

/**
 * Created by fanlychie on 2017/6/20.
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/orders/{uid:[1-9]\\d+}")
    public List<Order> orders(@PathVariable Integer uid) {
        return restTemplate.getForObject(String.format("http://order-service/order/find/%d", uid), List.class);
    }

}