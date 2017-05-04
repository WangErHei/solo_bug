package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IShowNameService;
@Service("ShowNameServiceImp")
public class ShowNameServiceImp implements IShowNameService {

	@Autowired
	private PersonalDao dao;
	
	@Override
	public String showName(int bid) {
		
		return dao.showName(bid);
	}

}
