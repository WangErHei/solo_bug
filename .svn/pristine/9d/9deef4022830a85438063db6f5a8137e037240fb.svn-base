package bug.frontstage.mytask.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.mytask.dao.MyTaskDao;
import bug.frontstage.mytask.service.IAssignOthersServce;
@Service("AssignOthersServiceImp")
public class AssignOthersServiceImp implements IAssignOthersServce {

	@Autowired
	private MyTaskDao dao;
	@Override
	public List assignOthers(int bid, int pid,String currpage,String everycount) {
		return dao.assignOthers(bid, pid, currpage, everycount);
		
	}

	public int countAssignOthers(int bid, int pid){
		return dao.countAssignOthers(bid, pid);
	}
}
