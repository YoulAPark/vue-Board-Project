package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.BoardVO;
import com.board.service.BoardService;
import com.fasterxml.jackson.annotation.JsonSubTypes;

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
	
	@GetMapping("/json/sortNo")
	public boolean sortNo(BoardVO board) throws Exception {
		System.out.println("boardVO 진입완료");
		boardService.sortNo(board);
		return true;
	}
	
	
}
