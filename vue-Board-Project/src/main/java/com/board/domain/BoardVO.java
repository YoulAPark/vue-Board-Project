package com.board.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

public class BoardVO {
	
	private int no; 			// boardNo
	private String title;		// boardTitle
	private String Content;		// boardContent
	private Timestamp date;		
	private String writer;
	private int imgFile;
	private String readCount;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getImgFile() {
		return imgFile;
	}
	public void setImgFile(int imgFile) {
		this.imgFile = imgFile;
	}
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", Content=" + Content + ", date=" + date + ", writer="
				+ writer + ", imgFile=" + imgFile + ", readCount=" + readCount + "]";
	}	

}
