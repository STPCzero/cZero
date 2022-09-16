package kopo.poly.service.impl;

import kopo.poly.service.INoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("NoticeService")

public class NoticeService implements INoticeService {

    private final INoticeService noticeMapper;

    @Autowired
    public NoticeService(INoticeService noticeMapper) { this.noticeMapper = noticeMapper; }
}
