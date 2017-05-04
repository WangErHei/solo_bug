package bug.frontstage.bug_info.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectBugInfoimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowIndexNoticeServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;

@Controller
public class ChangeController {

	
	@Autowired(required=false)
	@Qualifier("SelectBugInfoimp")
	private SelectBugInfoimp selectBugInfoimp;
	
	@Autowired
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired(required=false)
	@Qualifier("ShowIndexNoticeServiceImp")
	private ShowIndexNoticeServiceImp  showIndexNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	@RequestMapping("/change")
	public   String change(HttpServletRequest  req,HttpServletResponse  resp,int bid) throws UnsupportedEncodingException, ParseException   {
		String currpage="1";
		String pagecount="5";
	String p_id = req.getParameter("pid");
	int pid = Integer.parseInt(p_id);
	String pname= req.getParameter("pname");
	int num = selectActiveBugServiceimp.activeAllNum(pid);
	int total = selectBugInfoimp.total(pid);
	int activenum= selectActiveBugServiceimp.activeNum(pid);
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
	int numNotice = showNoticeServiceImp.allNotifyNum(pid);
	req.getSession().setAttribute("numNotice", numNotice);
	List<Map<String,Object>> activebug = selectBugInfoimp.activeBug(pid,currpage,pagecount);
	List<Map<String,Object>> notify = selectBugInfoimp.notify(pid);
	req.getSession().setAttribute("total", total);
	req.getSession().setAttribute("num", num);
	req.getSession().setAttribute("waitnum", waitnum);
	req.getSession().setAttribute("refusenum", refusenum);
	req.getSession().setAttribute("activenum", activenum);
	req.getSession().setAttribute("donenum", donenum);
	req.getSession().setAttribute("pushnum", pushnum);
	req.getSession().setAttribute("closenum", closenum);
	req.getSession().setAttribute("mebernum", mebernum);
	req.getSession().setAttribute("producenum", producenum);
	req.getSession().setAttribute("notify", notify);
	req.getSession().setAttribute("notstate", notstate);
	req.getSession().setAttribute("task", task);
	req.getSession().setAttribute("need", need);
	req.getSession().setAttribute("type1", type1);
	req.getSession().setAttribute("type2", type2);
	req.getSession().setAttribute("type3", type3);
	req.getSession().setAttribute("type4", type4);
	req.getSession().setAttribute("days", days);
	req.getSession().setAttribute("num", num);
	req.getSession().setAttribute("pid", pid);
	req.getSession().setAttribute("pname", pname);
	
	List noticeIndexList = showIndexNoticeServiceImp.showIndexNotice(pid);
	req.getSession().setAttribute("noticeIndexList", noticeIndexList);
	int countNeedToDo = countNeedToDoServiceImp.countNeed(bid, pid);
	req.getSession().setAttribute("activebug", activebug);
	req.getSession().setAttribute("countNeedToDo", countNeedToDo);
	return "work";
}
}