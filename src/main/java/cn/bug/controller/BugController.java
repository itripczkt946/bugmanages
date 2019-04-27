package cn.bug.controller;

import cn.bug.entity.BugDetail;
import cn.bug.entity.BugProject;
import cn.bug.service.BugService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/bug")
public class BugController {

    @Resource
    private BugService bugService;

    //@RequestParam是用于接收从页面上面传递过来的参数
    @RequestMapping("/buglist")
    public String buglist(@RequestParam(value="projectId",required = false) Integer projectId, Model model){
        //按条件查询bug列表信息，这后跳转bug列表页面。
        List<BugProject> bugProjectList = bugService.queryAllBugPro();  //查询所有bug项目
        //按项目id查询bug详情列表信息
        List<BugDetail> bugDetailList = bugService.queryAllBugList(projectId);

        model.addAttribute("bugProjectList", bugProjectList); //保证到model中，用于在页面上面显示出来
        model.addAttribute("bugDetailList", bugDetailList);
        return "bug_list";  //返回逻辑视图名
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {  //跳转到新增页面
        //按条件查询bug列表信息，这后跳转bug列表页面。
        List<BugProject> bugProjectList = bugService.queryAllBugPro();  //查询所有bug项目
        model.addAttribute("bugProjectList", bugProjectList);
        return "add";
    }

    @RequestMapping("/test")
    public void test(){}

    @RequestMapping("/saveAdd")
    public String saveAdd(BugDetail bugDetail) {
        int result = bugService.addBug(bugDetail);
        if (result > 0) {
            return "redirect:/bug/buglist";  //新增成功刷新bug列表页面
        } else {
            return "redirect:/bug/toAdd";  //新增失败又跳回新增页面。
         }
    }
}
