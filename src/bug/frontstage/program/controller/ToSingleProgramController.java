package bug.frontstage.program.controller;

import java.io.UnsupportedEncodingException;
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
import bug.frontstage.login.model.Buser;
import bug.frontstage.login.service.imp.SelectProgramLoginServiceimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowIndexNoticeServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.program.service.imp.SelectProServiceimp;

@Controller
public class ToSingleProgramController {
	@Autowired(required=false)
	@Qualifier("SelectBugInfoimp")
	private SelectBugInfoimp selectBugInfoimp;
	
	@Autowired
	@Qualifier("SelectProServiceimp")
	private SelectProServiceimp selectProServiceimp;
	
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
	@Autowired(required = false)
	@Qualifier("SelectProgramLoginServiceimp")
	private SelectProgramLoginServiceimp selectProgramLoginServiceimp;
	@RequestMapping("/toMyProgram")
   public String  toSingleProgram(HttpServletRequest  req) throws UnsupportedEncodingException, ParseException{
	
		String bid = req.getParameter("bid");
		int buser_id = Integer.parseInt(bid);
		String id  =req.getParameter("pid");
		String pname= req.getParameter("pname");
		String email = req.getParameter("email");
		Buser buser  = new Buser();
	    buser.setBuser_email(email);
		int pid = Integer.parseInt(id);
		String currpage="1";
		String pagecount="5";
		List<Map<String,Object>> activebug = selectBugInfoimp.activeBug(pid,currpage,pagecount);
		List<Map<String,Object>> list1 = selectProServiceimp.selectProgram(buser_id);
		int numNotice = showNoticeServiceImp.allNotifyNum(pid);
		req.getSession().setAttribute("numNotice", numNotice);
		req.getSession().setAttribute("list1", list1);
		req.getSession().setAttribute("pid", pid);
		req.getSession().setAttribute("pname", pname);
		req.getSession().setAttribute("flag", buser);
		int total = selectBugInfoimp.total(pid);
		int activenum = selectBugInfoimp.activeBugNumber(pid);
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
		req.getSession().setAttribute("total", total);
		req.getSession().setAttribute("activenum", activenum);
		req.getSession().setAttribute("waitnum", waitnum);
		req.getSession().setAttribute("refusenum", refusenum);
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
		int num = selectActiveBugServiceimp.activeAllNum(pid);
		req.getSession().setAttribute("num", num);
		req.getSession().setAttribute("activebug", activebug);
		List noticeIndexList = showIndexNoticeServiceImp.showIndexNotice(pid);
		req.getSession().setAttribute("noticeIndexList", noticeIndexList);
		int countNeedToDo = countNeedToDoServiceImp.countNeed(buser_id, pid);
		req.getSession().setAttribute("countNeedToDo", countNeedToDo);
	 	List<Map<String, Object>> list2 = selectProgramLoginServiceimp.selectAllProgram(buser_id);
		req.getSession().setAttribute("list1", list2);
		return "work";
		
		
	}
	
	
}
