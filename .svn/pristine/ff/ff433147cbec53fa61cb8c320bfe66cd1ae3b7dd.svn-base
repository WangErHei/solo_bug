package bug.frontstage.mytask.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.mytask.dao.MyTaskDao;
import bug.frontstage.mytask.service.INeedToDoService;
@Service("NeedToDoServiceImp")
public class NeedToDoServiceImp implements INeedToDoService {

	@Autowired
	private MyTaskDao dao;
	@Override
	public List<Map<String,Object>> needToDo(int bid, int pid,String currpage,String everycount) {
		return dao.needToDo(bid,pid,currpage,everycount);

	}

	public int countNeedToDo(int bid,int proId){
		return dao.countNeedToDo(bid, proId);
	}
}
