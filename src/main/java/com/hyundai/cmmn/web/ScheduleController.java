package com.hyundai.cmmn.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hyundai.admin.limitInfo.service.LimitInfoService;

@Controller
public class ScheduleController {

	/** LimitInfoService */
	@Resource(name = "limitInfoService")
	private LimitInfoService limitInfoService;

	public void schduledJop() throws Exception{
    	checkinglimitRequest();
    }

    private void checkinglimitRequest() throws Exception{
    	limitInfoService.checkLimitRequest();;
    }
}
