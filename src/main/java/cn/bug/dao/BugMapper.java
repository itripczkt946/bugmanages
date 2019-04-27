package cn.bug.dao;

import cn.bug.entity.BugDetail;
import cn.bug.entity.BugProject;
import org.apache.ibatis.annotations.Param;
import redis.clients.jedis.DebugParams;

import java.util.List;

//dao层的接口
public interface BugMapper {

    /**
     * 用于查询所有的bug项目
     */
    List<BugProject> queryAllBugPro();

    /**
     * 根据项目编号查询bug项目的详情列表信息(按报告时间降序排列)。
     * @param projectId 项目编号
     * @return 返回详情列表信息
     */
    List<BugDetail> queryAllBugList(@Param("projectId") Integer projectId);

    int addBug(BugDetail bugDetail);
}
