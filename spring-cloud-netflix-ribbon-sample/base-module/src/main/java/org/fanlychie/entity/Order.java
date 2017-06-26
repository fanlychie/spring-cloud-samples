package org.fanlychie.entity;

/**
 * Created by fanlychie on 2017/6/25.
 */
public class Order {

    private String no;

    private Integer uid;

    private String productName;

    private Double totalFee;

    public Order(String no, Integer uid, String productName, Double totalFee) {
        this.no = no;
        this.uid = uid;
        this.totalFee = totalFee;
        this.productName = productName;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

}