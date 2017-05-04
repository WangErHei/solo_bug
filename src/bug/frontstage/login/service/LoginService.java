package bug.frontstage.login.service;

import java.util.List;
import java.util.Map;

import bug.frontstage.login.model.Buser;

public interface LoginService {
	public int Login(Buser buser);
	public int findId(Buser buser);
	public List<Map<String,Object>> selectName(int i);
}
