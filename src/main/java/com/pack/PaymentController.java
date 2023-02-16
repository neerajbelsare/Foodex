/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class PaymentController
{
     @RequestMapping(value="/payment")
    public String Homecontroller()
    {
        return "Payments";
    }
    
  @Autowired
  private RazorpayClient razorpayClient;

  @PostMapping("/createOrder")
  public Map<String, String> createOrder(@RequestParam("amount") int amount) throws RazorpayException {
 
    JSONObject orderRequest = new JSONObject();
    orderRequest.put("amount", amount);
    orderRequest.put("currency", "INR");
    orderRequest.put("payment_capture", 1);

    Order order = razorpayClient.orders.create(orderRequest);

   
    Map<String, String> response = new HashMap<>();
    response.put("orderId", (String) order.get("id"));
    response.put("amount", String.valueOf(order.get("amount")));
    response.put("currency", (String) order.get("currency"));
    response.put("name", "FOODEX");
    response.put("description", "FOOD CHARGES");
 

    return response;
  }
}