package com.twoweeks.spring.know.model.vo;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KinReply {

	private int reply_Sq;//답글번호
	private int kin_Ref; //게시글참조
	private String reply_Writer; //답글 작성자ID
	private String reply_Content;//답글 본문
	private String reply_Image;// 답글 첨부파일 이미지
	private int reply_Like_Cnt;// 좋아요 개수
	private Date reply_Date; // 답글 작성일 
	
}
