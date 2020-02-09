package reservation;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.ReservationDto;

public class RevDao implements Serializable{
	
	private static RevDao dao = new RevDao();
	
	private RevDao() {
	}
	
	public static RevDao getInstance() {
		return dao;
	}
	
}
