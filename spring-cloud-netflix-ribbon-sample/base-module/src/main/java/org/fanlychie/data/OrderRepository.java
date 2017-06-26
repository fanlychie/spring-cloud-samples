package org.fanlychie.data;

import org.fanlychie.entity.Order;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 简单模拟生产环境的 JPA, 简化样例
 * Created by fanlychie on 2017/6/25.
 */
@Component
public class OrderRepository {

    private static final List<Order> ORDERS = new ArrayList<>();

    static {
        ORDERS.add(new Order("201706220000001", 1001, "商品A", 108.D));
        ORDERS.add(new Order("201706220000003", 1003, "商品B", 128.D));
        ORDERS.add(new Order("201706220000005", 1001, "商品C", 158.D));
        ORDERS.add(new Order("201706220000007", 1005, "商品D", 168.D));
    }

    public List<Order> findByUid(Integer uid) {
        List<Order> orders = new ArrayList<>();
        ORDERS.stream().filter(o -> o.getUid().equals(uid)).forEach(o -> orders.add(o));
        return orders;
    }

}