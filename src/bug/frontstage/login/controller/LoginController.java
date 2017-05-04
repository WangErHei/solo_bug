package bug.frontstage.login.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.bug_info.service.imp.SelectActiveBugServiceimp;
import bug.frontstage.bug_info.service.imp.SelectBugInfoimp;
import bug.frontstage.login.model.Buser;
import bug.frontstage.login.service.imp.LoginServiceImp;
import bug.frontstage.login.service.imp.SelectProgramLoginServiceimp;
import bug.frontstage.mytask.service.imp.CountNeedToDoServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowIndexNoticeServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;
import util.BeanUtil;

@Controller
public class LoginController {

	
	
	@RequestMapping("/tologin")
	public String toLogin() {
		return "index";
	}

	@RequestMapping("/tologin1")
	public String toLogin1() {
		return "console";
	}
	
	
	@Autowired(required=false)
	@Qualifier("SelectBugInfoimp")
	private SelectBugInfoimp selectBugInfoimp;
	
	@Autowired(required=false)
	@Qualifier("SelectActiveBugServiceimp")
	private SelectActiveBugServiceimp selectActiveBugServiceimp;
	
	@Autowired(required = false)
	@Qualifier("LoginServiceImp")
	private LoginServiceImp loginServiceImp;

	@Autowired(required = false)
	@Qualifier("SelectProgramLoginServiceimp")
	private SelectProgramLoginServiceimp selectProgramLoginServiceimp;

	@Autowired(required=false)
	@Qualifier("CountNeedToDoServiceImp")
	private CountNeedToDoServiceImp  countNeedToDoServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowIndexNoticeServiceImp")
	private ShowIndexNoticeServiceImp  showIndexNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	//参数传一个实体对象
	@RequestMapping("/login")
	public String Login(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException, ParseException {
		
		loginServiceImp.setPropFlag();
		
		String pagecount="5";
		String currpage="1";
		// 1.先放到作用域session ,之后的作用域不在存放值，有先后顺序
		req.setCharacterEncoding("utf-8");
		resp.setContentType("utf-8");
		HttpSession session = req.getSession();
		Buser flag = (Buser) session.getAttribute("flag");
		if (flag != null) {
			return "work";
		}
		BeanUtil bu = new BeanUtil();
		Buser buser = new Buser();
		buser = bu.getBean(Buser.class, bu.getParams(req));
		int is = loginServiceImp.Login(buser);

		if (is != 0) {
			int id = loginServiceImp.findId(buser);
			buser.setBuser_id(id);
			List<Map<String, Object>> list = loginServiceImp.selectName(id);
			String head = loginServiceImp.selectHead(id);
			session.setAttribute("head", head);
			session.setAttribute("list", list);
			session.setAttribute("flag", buser);
			session.setAttribute("id", id);
			List<Map<String, Object>> list1 = selectProgramLoginServiceimp.selectAllProgram(id);
		
			if (list1.size()>0) {
				String name = (String) list1.get(0).get("pname");
				Object ob =list1.get(0).get("pid");
				int pid= Integer.parseInt(ob.toString());		
				int num= selectActiveBugServiceimp.activeAllNum(pid);
				List<Map<String,Object>> activebug = selectBugInfoimp.activeBug(pid,currpage,pagecount);
				int numNotice = showNoticeServiceImp.allNotifyNum(pid);
				List noticeIndexList = showIndexNoticeServiceImp.showIndexNotice(pid);
				req.getSession().setAttribute("noticeIndexList", noticeIndexList);
				int countNeedToDo = countNeedToDoServiceImp.countNeed(id, pid);
				session.setAttribute("countNeedToDo", countNeedToDo);
				session.setAttribute("activebug", activebug);
				req.getSession().setAttribute("numNotice", numNotice);
				req.getSession().setAttribute("pname", name);		
				req.getSession().setAttribute("pid",pid);
				req.getSession().setAttribute("list1", list1);
				req.getSession().setAttribute("num", num);
				int total = selectBugInfoimp.total(pid);
				int activenum= selectBugInfoimp.activeBugNumber(pid);
			
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
				
			
				return "work";
			} else {
				return "projects";
			}
		} else {
			req.setAttribute("msg", "账户密码错误");
			return "console";
		}

	}

}
