package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoard(BoardVO vo) throws Exception;
	
	public List<BoardVO> getProduct(int no) throws Exception;
	
	public void addBoard(BoardVO board) throws Exception;
	public void deleteBoard(int no) throws Exception;
	public void updateBoard(BoardVO board) throws Exception;

}
