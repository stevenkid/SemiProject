package member;

import dto.MemberDto;

public class MemberService {

	MemberDao dao = MemberDao.getInstance();
	
	public boolean addMember(MemberDto dto) {
		
		return dao.addMember(dto);
	}
	
	
	public MemberDto login(String id, String pw) {
		
		return dao.login(id, pw);
	}
	
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}
}
