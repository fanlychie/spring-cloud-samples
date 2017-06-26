package org.fanlychie.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by fanlychie on 2017/6/26.
 */
@RestController
public class PingController {

    @GetMapping("/")
    public String ping() {
        return "Hi";
    }

}