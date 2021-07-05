package com.koreait.myproject.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GalleryComment {
	private long cno;
	private String id;
	private String content;
	private Date postdate;
	private String ip;

	
}
