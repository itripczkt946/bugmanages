package cn.bug.service;

import cn.bug.entity.BugDetail;
import cn.bug.entity.BugProject;

import java.util.List;

public interface BugService {

    /**
     * 用于查询所有的bug项目
     */
    List<BugProject> queryAllBugPro();

    List<BugDetail> queryAllBugList(Integer projectId);

    int addBug(BugDetail bugDetail);
}
