package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping;

import com.board.domain.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/product-list") // jsp에서 Controller로 넘어올 떄의 location 경로
	public String listBoard(Model model, BoardVO board) throws Exception {
		List<BoardVO> list = boardService.getBoard(board);
		model.addAttribute("list", list);
		return "/board/listBoard"; // 메서드 종료 이후 넘어갈 jsp의 name
	}
	
	@RequestMapping("/board/product-Board")
	public String addBoardPage() throws Exception {
		return "/board/addBoard";
	}
	
	@RequestMapping("updatePage/{no}")
	public String updatePage(Model model, @PathVariable("no") int no/*@RequestParam("no") int no*/) throws Exception {
		List<BoardVO> list = boardService.getProduct(no);
		model.addAttribute("list", list);
		return "/board/addBoard";
	}
	
	@RequestMapping("/board/updateBoard")
	public String updateBoard(@RequestBody BoardVO board) throws Exception {
		boardService.updateBoard(board);
		return "/board/listBoard";
	}

}
