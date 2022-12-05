package com.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;

@Mapper
public interface BoardDao {
	
	public List<BoardVO> getBoard(BoardVO vo) throws Exception;
	
	public List<BoardVO> getProduct(int no) throws Exception;
	
	public void addBoard(BoardVO board) throws Exception; 
	public void deleteBoard(int no);
	public void updateBoard(BoardVO board);
	public void readCount(BoardVO board);
	
	public List<BoardVO> sortNo(BoardVO board) throws Exception;
}
