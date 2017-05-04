package bug.frontstage.mytask.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.mytask.dao.MyTaskDao;
import bug.frontstage.mytask.service.ICountNeedToDoService;
@Service("CountNeedToDoServiceImp")
public class CountNeedToDoServiceImp implements ICountNeedToDoService {

	@Autowired
	private MyTaskDao dao;
	@Override
	public int countNeed(int bid, int pid) {
		
		return dao.countNeedToDo(bid, pid);
	}

}
