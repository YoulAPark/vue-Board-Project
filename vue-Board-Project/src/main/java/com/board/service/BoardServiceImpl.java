package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dao.BoardDao;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	public List<BoardVO> getBoard(BoardVO vo) throws Exception {
		return boardDao.getBoard(vo);
	}
	
	public List<BoardVO> getProduct(int no) throws Exception {
		return boardDao.getProduct(no);
	}
	
	public void addBoard(BoardVO board) throws Exception {
		boardDao.addBoard(board);
	}
	
	public void deleteBoard(int no) {
		boardDao.deleteBoard(no);
	}
	
	public void updateBoard(BoardVO board) {
		boardDao.updateBoard(board);
	}

}
