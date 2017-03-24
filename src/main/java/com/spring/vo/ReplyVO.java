package com.spring.vo;

import java.util.Date;

public class ReplyVO {
	private int rebid;
	private int bid;
	private String replyContent;
	private String replyer;
	private Date regdate;
	private Date updateDate;
	
	public int getRebid() {
		return rebid;
	}
	public void setRebid(int rebid) {
		this.rebid = rebid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "replyVO [rebid=" + rebid + ", bid=" + bid + ", replyContent="
				+ replyContent + ", replyer=" + replyer + ", regdate="
				+ regdate + ", updateDate=" + updateDate + "]";
	}
	
	
}
