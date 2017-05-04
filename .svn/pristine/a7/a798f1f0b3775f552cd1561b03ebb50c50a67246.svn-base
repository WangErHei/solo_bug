package bug.frontstage.mytask.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.mytask.dao.MyTaskDao;
import bug.frontstage.mytask.service.IMyAllTaskService;
@Service("MyAllTaskServiceImp")
public class MyAllTaskServiceImp implements IMyAllTaskService {

	@Autowired
	private MyTaskDao dao;
	@Override
	public List myAll(int bid, int pid,String currpage,String everycount) {
		return dao.myAllTask(bid, pid, currpage, everycount);
	}

	public int countMyAllTask(int bid, int pid){
		return dao.countMyAllTask(bid, pid);
	}
}
