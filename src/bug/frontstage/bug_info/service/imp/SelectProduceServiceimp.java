package bug.frontstage.bug_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.SelectProduceService;

@Service("SelectProduceServiceimp")
public class SelectProduceServiceimp  implements   SelectProduceService{

	@Autowired
	private Bug bug;
	
	@Override
	public List<Map<String, Object>> selectProduce(int pid) {
		List<Map<String, Object>> listpro =   bug.selectAllProduce(pid);
		return listpro;
	}

}
