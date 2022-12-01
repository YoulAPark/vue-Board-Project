package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// logger 확인 할 경우 사용
	//	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/")
	public String main() throws Exception {
		return "main";
	}
	
}
