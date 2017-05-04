package bug.frontstage.program.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bug.frontstage.program.service.imp.CreateProgramSeviceimp;
import bug.frontstage.program.service.imp.MemberShipServiceimp;


@Controller
public class MemberShipController {

	@Autowired
	@Qualifier("CreateProgramSeviceimp")
	private CreateProgramSeviceimp createProgramSeviceimp;

	@Autowired
	@Qualifier("MemberShipServiceimp")
	private MemberShipServiceimp memberShipServiceimp;

	@RequestMapping("/addMember")
	@ResponseBody
	public List<Map<String, Object>> addMember(HttpServletRequest req, HttpServletResponse resp, int pid)
			throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		String email = req.getParameter("buser_email");
		String be = email.replace("'", "");
		boolean flag = memberShipServiceimp.isExit(be);
		boolean flag1 = memberShipServiceimp.good(email);
		if ( flag1) {
			if (flag) {
				boolean flag2 = memberShipServiceimp.isPrograamEmail(pid, be);
				if(flag2){
				int bid = memberShipServiceimp.buserId(be);
				memberShipServiceimp.insertProgramUser(pid, bid);
				memberShipServiceimp.insertUserRole(pid, bid);
				list = memberShipServiceimp.selectAllMember(pid);
				return list;}
				else{
					list = memberShipServiceimp.selectAllMember(pid);
					map.put("msg", "该成员已添加，不可重复添加!");
					list.add(map);
				}
			} else {
				memberShipServiceimp.registr(be);
				int bid = memberShipServiceimp.buserId(be);
				memberShipServiceimp.insertProgramUser(pid, bid);
				memberShipServiceimp.insertUserRole(pid, bid);
				list = memberShipServiceimp.selectAllMember(pid);
				return list;
			}
			     
		} else {
			list = memberShipServiceimp.selectAllMember(pid);
			map.put("msg", "添加成员信息有误!");
			list.add(map);
		}
		return list;
	}
}
