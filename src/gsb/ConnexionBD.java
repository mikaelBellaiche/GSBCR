package gsb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionBD {
	
	private static final String url = "jdbc:mysql://localhost/gsbcrslam?useUnicode=yes&characterEncoding=UTF-8" ;
//	private static final String url = "jdbc:mysql://localhost/GsbCRSlam?useUnicode=yes&characterEncoding=UTF-8" ;

//	private static final String url = "jdbc:mysql://192.168.104.240:3306/GsbCRSlam";
	private static final String user = "root" ;
	private static final String password = "azerty" ;
	private static Connection connexion = null ;
	
	/** Connexion à la base de données
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private ConnexionBD() throws ClassNotFoundException, SQLException {
		System.out.println("[ConnexionBD::ConnexionBD()]");
		Class.forName("com.mysql.jdbc.Driver") ;
		connexion = DriverManager.getConnection(url,user,password) ;
	}
	
	/** Connexion à la base de donnée
	 * 
	 * @return L'état de la connexion
	 * @throws ClassNotFoundException Exception
	 * @throws SQLException Exception
	 */
	public static Connection getConnexion() throws ClassNotFoundException, SQLException{
		System.out.println("[ConnexionBD::getConnexion()]");
		if(connexion == null){
			new ConnexionBD() ;
		}
		return connexion ;
	}

}
