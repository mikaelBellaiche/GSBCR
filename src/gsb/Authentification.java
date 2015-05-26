package gsb;

import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;

public class Authentification {
	
	private static String query = "SELECT DEL_MATRICULE, DEL_MDP FROM delegue_regional WHERE DEL_MATRICULE = ?" ;
	private static boolean connexionOk = false;
	
	/** S'authentifier sur l'application
	 * 
	 * @param login Le login de l'utilisateur
	 * @param mdp Le mot de passe de l'utilisateur
	 * @return L'état de l'authentification
	 */
	public static boolean seConnecter(String login, String mdp){
		System.out.println("[Authentification::seConnecter()]");
		
		
		try {
			 Connection connexion = ConnexionBD.getConnexion();
			 PreparedStatement pstat = (PreparedStatement) connexion.prepareStatement(query);
			 pstat.setString(1,login);
			 ResultSet resultat = pstat.executeQuery();
	
			 while(resultat.next()){

				 if(resultat.getString("DEL_MDP").equals(mdp)){
						connexionOk = true;
						 System.out.println("Authentification réussi");
					}
					
				 
				 else {
					 System.out.println("Echec !");
				 }
			 }
		
		}
		catch(Exception e){
			System.out.println("Erreur traitement");
			connexionOk = false ;
		}
		return connexionOk ;
	}
	

}
