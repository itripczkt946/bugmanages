package cn.bug.service.impl;

import cn.bug.dao.BugMapper;
import cn.bug.entity.BugDetail;
import cn.bug.entity.BugProject;
import cn.bug.service.BugService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("bugService")
public class BugServiceImpl implements BugService {

    @Resource
    private BugMapper bugMapper;

    @Override
    public List<BugProject> queryAllBugPro() {
        return bugMapper.queryAllBugPro();
    }

    @Override
    public List<BugDetail> queryAllBugList(Integer projectId) {
        return bugMapper.queryAllBugList(projectId);
    }

    @Override
    public int addBug(BugDetail bugDetail) {
        return bugMapper.addBug(bugDetail);
    }

}
