package bug.register.service.imp;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.login.model.Buser;
import bug.register.dao.Register;

import bug.register.service.RegisterService;

@Service("RegisterServiceImp")
public class RegisterServiceImp implements RegisterService {

	
	@Autowired
	private Register register;
	
	@Override
	public boolean  register(Buser buser) {
		boolean flag=true;
		int i  =  register.register(buser);
		if(i<=0){
			flag=false;
		}
		return flag;
	}
	public int findId(Buser buser) {
		int i =  register.getId(buser);
		return i;
	}

	public  boolean isExit(String  buser_email){
		return register.isExit(buser_email);
	}
	@Override
	public boolean Exit(String buser_name) {
	return register.Exit(buser_name);
	}
	
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
	
	public boolean isPass(String pass){
	return 	register.isPass(pass);		
	}
	
}
