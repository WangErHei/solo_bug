package bug.frontstage.personal_center.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.personal_center.service.imp.JudgePassServiceImp;
import bug.frontstage.personal_center.service.imp.SelectAllServiceImp;
import bug.frontstage.personal_center.service.imp.UpdatePassServiceImp;


@Controller
public class UpdatePassController {

	@Autowired(required=false)
	@Qualifier("JudgePassServiceImp")
	private JudgePassServiceImp  judgePassServiceImp;
	
	@Autowired(required=false)
	@Qualifier("UpdatePassServiceImp")
	private UpdatePassServiceImp  updatePassServiceImp;
	
	
	@RequestMapping("/updatePass")
	public String  UpdateBuserPass(HttpServletRequest req,int id){
		String oldPass = req.getParameter("old");
     	String newpass= req.getParameter("new");
		String pass = req.getParameter("newAgain");
		
		if(judgePassServiceImp.isPass(id, oldPass)){
			if(newpass.equals(pass)){
			updatePassServiceImp.updatePass(id, pass);
			req.setAttribute("msg", "修改成功!");
			}
			else{
				req.setAttribute("msg", "两次密码输入不一致，请再次确认!");
			}
			return "projects";
		}else{
			req.setAttribute("msg", "用户密码错误！");
			return "projects";
		}
		
		
	}
	
}
