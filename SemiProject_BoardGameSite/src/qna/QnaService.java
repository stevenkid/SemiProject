package qna;

import java.util.List;

import dto.QnaDto;

public class QnaService {

	public List<QnaDto> getQnaList() {
		
		QnaDao dao = QnaDao.getInstance();
		List<QnaDto> list = dao.getQnaList();
		
		return list;
	}

	public boolean setQnaWrite(QnaDto dto) {
		
		QnaDao dao = QnaDao.getInstance();
		boolean isS = dao.setQnaWrite(dto);
		
		return isS;
	}
}
