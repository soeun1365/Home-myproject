package com.koreait.myproject.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GalleryBoard {
	private long gno;
	private String id;
	private String title;
	private String content;
	private Date postdate;
	private Date lastmodidate;
	private String ip;
	private int lookcount;
	private String image;
	
}
