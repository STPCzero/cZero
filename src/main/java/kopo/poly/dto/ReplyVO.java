package kopo.poly.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {
    private String rno;//댓글번호
    private String bno;//페이지번호

    private String reply;
    private String replyer;
    private String replyDate;
    private String updateDate;

    private String rrno;//댓글 순서 번호
    private String derno;//대댓글 순서 번호
}