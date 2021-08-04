package com.twoweeks.spring.board.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twoweeks.spring.board.freeboard.model.dao.FreeBoardDao;
import com.twoweeks.spring.board.freeboard.model.vo.FreeBoard;
import com.twoweeks.spring.board.freeboard.model.vo.PostAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private FreeBoardDao dao;
	
	@Autowired
	private SqlSession session;

	
	

	@Override
	public List<FreeBoard> list(FreeBoard fb) {
		return dao.list(session, fb);
	}


	@Override
	public List<FreeBoard> listAll(int cPage, int numPerpage) {
		return dao.listAll(session, cPage, numPerpage);
	}


	@Override
	public int totalBoardCount() {
		return dao.totalBoardCount(session);
	}

	
	/*
	 * @Override public int create(FreeBoard freeBoard) throws Exception { return
	 * dao.create(freeBoard); }
	 * 
	 * @Override public FreeBoard read(int post_Sq) throws Exception { return
	 * dao.read(post_Sq); }
	 * 
	 * @Override public void update(FreeBoard freeBoard) throws Exception {
	 * dao.update(freeBoard); }
	 * 
	 * @Override public void delete(int post_Sq) throws Exception {
	 * dao.delete(post_Sq); }
	 */


	@Override
	public List<FreeBoard> searchBoard(Map<String,Object> param) {
		return dao.searchBoard(session,param);
	}


	@Override
	public int insertBoard(FreeBoard b) throws Exception {
		try {
			int result = dao.insertBoard(b, session);
			log.debug("게시글 번호 : " + b.getPost_Sq());
			int boardNo=b.getPost_Sq();
			if(result>0) {
				List<PostAttachment> attachments = b.getAttachments();
				if(attachments.size()>0) {
					for(PostAttachment a : b.getAttachments()) {
						a.setPost_Sq(boardNo); //Board객체에 저장된 게시글 번호를 PostAttachment 객체에 넣어준다.
						dao.insertAttachment(a, session);
					}
			}else if (result > 0) return 1;  //첨부파일이 없을 경우
			else return 0; //첨부파일 실패
		}else return 0; //게시글 등록이 안되었다면
		
	}catch(RuntimeException e) {
		throw new Exception("등록실패");
	}
		return 1;
	}


	@Override
	public FreeBoard read(int bno) {
		return dao.read(session, bno);
	}
	
	
	
}