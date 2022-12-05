package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.BoardVO;
import com.board.service.BoardService;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	
	@PostMapping("/json/addBoard")
	public boolean addBoard(@RequestBody BoardVO board) throws Exception {
		boardService.addBoard(board);
		return true;
	}
	
	@GetMapping("/json/deleteBoard/{no}")
	public boolean deleteBoard(@PathVariable("no") int no) throws Exception {
		boardService.deleteBoard(no);
		return true;
	}

	@GetMapping("/json/getProduct/{no}")
	public boolean getProduct(@PathVariable("no") int no, @RequestBody BoardVO board) throws Exception {
		System.out.println("여기옴");
		boardService.getProduct(no);
		return true;
	}
	
	@PostMapping("/json/updateBoard")
	public boolean updateBoard(@RequestBody BoardVO board) throws Exception {
		boardService.updateBoard(board);
		return true;
	}
	
	@PostMapping("/json/readCount")
	public boolean readCount(@RequestBody BoardVO board) throws Exception {
		boardService.readCount(board);
		return true;
	}
	
//	@GetMapping("/json/sortNo")
//	public boolean sortNo(BoardVO board, Model model) throws Exception {
//		List<BoardVO> list = boardService.sortNo(board);
//		model.addAttribute("list", list);
//		System.out.println("list : "+list);
//		return true;
//	}
	
	@GetMapping("/json/sortNo")
	public List<BoardVO> sortNo(BoardVO board, Model model) throws Exception {
		List<BoardVO> list = boardService.sortNo(board);
		model.addAttribute("list", list);
		return list;
	}
	
	
}
