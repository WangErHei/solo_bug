package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IUpdateMailService;
@Service("UpdateMailServiceImp")
public class UpdateMailServiceImp implements IUpdateMailService {

	@Autowired
	private PersonalDao dao;
	
	@Override
	public void updateMail(int id, String mail) {
		
		dao.updateMail(id, mail);
	}

//判断邮箱格式
	public boolean good(String email){
		String format = "^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*$";
		if (email.matches(format))
	    { 
	     return true;// 邮箱名合法，返回true 
	    }
	   else
	    {
	     return false;// 邮箱名不合法，返回false
	    }
	}     
	
//判断邮箱是否存在
	public boolean isEmial(String buser_email){
		return dao.isExit(buser_email);
	}
	
//判断用户名是否存在
	public boolean isName(String name){
		return dao.equals(name);
	}
	
	
}
