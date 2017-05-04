package bug.frontstage.bug_info.controller;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectBugInfoimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowIndexNoticeServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.project_info.service.imp.AddProgramServiceimp;



@Controller
public class BugInfoController {
	@Autowired
	@Qualifier("AddProgramServiceimp")
	private AddProgramServiceimp  addProgramServiceimp;
	
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired(required=false)
	@Qualifier("SelectBugInfoimp")
	private SelectBugInfoimp selectBugInfoimp;

	@Autowired(required=false)
	@Qualifier("ShowIndexNoticeServiceImp")
	private ShowIndexNoticeServiceImp  showIndexNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	@RequestMapping("/bugInfo")
	public  String  selectActive(HttpServletRequest  req,int bid,int pid) throws ParseException{
	
		String currpage="1";
		String everycount="5";
		List<Map<String, Object>> activebug = selectActiveBugServiceimp.activeBug(pid,currpage, everycount);
		int total = selectBugInfoimp.total(pid);
		int activenum= selectBugInfoimp.activeBugNumber(pid);
		int num = selectActiveBugServiceimp.activeAllNum(pid);
		int waitnum = selectBugInfoimp.waitBugNumber(pid);
		int refusenum = selectBugInfoimp.refuseBugNumber(pid);
		int donenum  = selectBugInfoimp.doneBugNumber(pid);
		int pushnum = selectBugInfoimp.pushBugNumber(pid);
		int closenum = selectBugInfoimp.closeBugNumber(pid);
		int mebernum =selectBugInfoimp.member(pid);
		int producenum = selectBugInfoimp.produce(pid);
		int notstate = selectBugInfoimp.notState(pid);
		int task = selectBugInfoimp.task(pid);
		int need = selectBugInfoimp.need(pid);
		int type1 = selectBugInfoimp.type1(pid);
		int type2 = selectBugInfoimp.type2(pid);
		int type3 = selectBugInfoimp.type3(pid);
		int type4 = selectBugInfoimp.type4(pid);
		long days= selectBugInfoimp.day(pid);
		List<Map<String,Object>> notify = selectBugInfoimp.notify(pid);
		int numNotice = showNoticeServiceImp.allNotifyNum(pid);
		req.getSession().setAttribute("numNotice", numNotice);
		req.getSession().setAttribute("total", total);
		req.getSession().setAttribute("num", num);
		req.getSession().setAttribute("activenum", activenum);
		req.getSession().setAttribute("waitnum", waitnum);
		req.getSession().setAttribute("refusenum", refusenum);
		req.getSession().setAttribute("donenum", donenum);
		req.getSession().setAttribute("pushnum", pushnum);
		req.getSession().setAttribute("closenum", closenum);
		req.getSession().setAttribute("mebernum", mebernum);
		req.getSession().setAttribute("producenum", producenum);
		req.getSession().setAttribute("activebug", activebug);
		req.getSession().setAttribute("notify", notify);
		req.getSession().setAttribute("notstate", notstate);
		req.getSession().setAttribute("task", task);
		req.getSession().setAttribute("need", need);
		req.getSession().setAttribute("type1", type1);
		req.getSession().setAttribute("type2", type2);
		req.getSession().setAttribute("type3", type3);
		req.getSession().setAttribute("type4", type4);
		req.getSession().setAttribute("days", days);
		
		List noticeIndexList = showIndexNoticeServiceImp.showIndexNotice(pid);
		req.getSession().setAttribute("noticeIndexList", noticeIndexList);
		int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
		req.getSession().setAttribute("countNeedToDo", countNeedToDo);
		return "work";
	}
	;
}
