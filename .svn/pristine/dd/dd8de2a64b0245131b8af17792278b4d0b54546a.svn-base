package bug.frontstage.personal_center.service.imp;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IUpdateHeadService;
@Service("UpdateHeadServiceImp")
public class UpdateHeadServiceImp implements IUpdateHeadService {

	@Autowired
	private PersonalDao dao;
	
	@Override
	public void updateHead(int id, Blob head) {
		
		dao.updateHead(id, head);

	}

}
