package member;

import dto.MemberDto;

public class MemberService {

	MemberDao dao = MemberDao.getInstance();
	
	public boolean addMember(MemberDto dto) {
		
		return dao.addMember(dto);
	}
	
	
}
