package bug.frontstage.personal_center.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.personal_center.service.imp.SelectAllServiceImp;
import bug.frontstage.personal_center.service.imp.UpdateNameServiceImp;


@Controller
public class UpdateNameController {

	@Autowired(required=false)
	@Qualifier("UpdateNameServiceImp")
	private UpdateNameServiceImp  updateNameServiceImp;
	
	@Autowired(required=false)
	@Qualifier("SelectAllServiceImp")
	private SelectAllServiceImp  selectAllServiceImp;
	
	@RequestMapping("/updateName")
	public String  UpdateBuserName(HttpServletRequest req,int id){
		String name = req.getParameter("name");
		boolean flag = updateNameServiceImp.isName(name);
		if(flag){
			updateNameServiceImp.updateName(id, name);
			List<Map<String,Object>>  list = selectAllServiceImp.selectAll(id);
			req.getSession().setAttribute("list", list);
			req.setAttribute("bmsg", "修改成功!");
			return "projects";
		}
		else{
			req.setAttribute("bmsg", "用户名已被使用,请重新填写!");
			return "projects";
		}
	}
}
