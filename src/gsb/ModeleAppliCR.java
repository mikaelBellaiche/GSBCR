package gsb;

import com.mysql.jdbc.Statement;

import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ModeleAppliCR {
	
	private List<Visiteur> visiteurs = new ArrayList<Visiteur>() ;
	private List<CompteRendu> comptesRendus = new ArrayList<CompteRendu>() ;
	private List<Praticien> praticiensHesitants = new ArrayList<Praticien>() ;
	private CompteRendu compteRenduSelectionne;
	private ResultSet result;
	private Connection co;
	private Statement stat ;
	private PreparedStatement pstmt;
	private List<CompteRendu> compteRendus;
	private String mois ;
	private String annee ;
	private String matricule ;
	
	public ModeleAppliCR(){
		super() ;
	}
	
	/** Obtenir la liste des visiteurs
	 * 
	 * @return La liste des visiteurs
	 */
	public List<Visiteur> getVisiteurs(){
		System.out.println("[ModeleAppliCR::getVisiteurs()]") ;
		String requete = "select VIS_MATRICULE,VIS_NOM,VIS_PRENOM FROM VISITEUR;";
		
		try{
			co = ConnexionBD.getConnexion();
			stat = (Statement) co.createStatement();
			result = stat.executeQuery(requete);
			System.out.println("[ModeleAppliCR::getVisiteurs()]");
			
			
			
				while(result.next()){
										
					Visiteur visiteur = new Visiteur(result.getString("VIS_MATRICULE"),
							                         result.getString("VIS_NOM"),
							                         result.getString("VIS_PRENOM")) ;
					visiteurs.add(visiteur);
				}
			}
			catch(Exception e){
				System.out.println("Erreur à  la formation de la formation de la liste des visiteurs : "+e.getMessage());
			}
		
			return visiteurs ;
		
	}
	
//	/** Chercher un visiteur
//	*
//	* @param matricule Matricule du visiteur 
//	* @return Le visiteur recherch�
//	*/
//	public Visiteur findVisiteur(String matricule){
//		Visiteur visiteur = null;
//		for(Visiteur unVisiteur : visiteurs){
//			if(matricule == unVisiteur.getMatVisiteur()){
//				visiteur = unVisiteur;
//			}
//		}
//		return visiteur;
//	}
//	
//	/** Chercher un praticien
//	*
//	* @param matricule Num�ro du praticien 
//	* @return Le praticien recherch�
//	*/
//	public Praticien findPraticien(int praNum){
//		Praticien praticien = null;
//		for(Praticien unPraticien : praticiensHesitants){
//			if(praNum == unPraticien.getNumero()){
//				praticien = unPraticien;
//			}
//		}
//		return praticien;
//	}
	
//	/** Rechercher un compte-rendu
//	*
//	* @param visMatricule Matricule du visiteur
//	* @param numCR Num�ro du compte-rendu
//	* @return Le compte-rendu recherch�
//	*/
//	public CompteRendu findCompteRendu(String visMatricule, int numCompteRendu){
//		for(CompteRendu unCompteRendu : comptesRendus){
//			if(visMatricule == unCompteRendu.getNomVis() && numCompteRendu == unCompteRendu.getNumero()){
//				this.compteRenduSelectionne = unCompteRendu;
//			}
//		}
//		return compteRenduSelectionne;
//	}

	/** Obtenir la liste des comptes rendus
	 * 
	 * @param mois Mois du compte rendu
	 * @param annee Année du compte rendu
	 * @param matricule Le matricule 
	 * @return La liste des comptes rendus
	 */
	public List<CompteRendu> getComptesRendus(String mois, String annee, String matricule){
		System.out.println("[ModeleAppliCR::getComptesRendus()]");
		
		int parseIntMois = Integer.parseInt(mois);
		int parseIntAnnee = Integer.parseInt(annee);
		
		String query = "SELECT RAP_NUM, PRA_NOM, PRA_PRENOM, PRA_VILLE, RAP_DATE, RAP_DATE_REDAC, RAP_BILAN, RAP_LU"
				     + "FROM (PRATICIEN , RAPPORT_VISITE WHERE PRATICIEN.PRA_NUM = RAPPORT_VISITE.PRA_NUM) INNER JOIN VISITEUR ON VISITEUR.VIS_MATRICULE = RAPPORT_VISITE.VIS_MATRICULE "
				     + "AND RAPPORT_VISITE.VIS_MATRICULE = ? "
				     + "AND YEAR(RAP_DATE_REDAC)=? "
				     + "AND MONTH(RAP_DATE_REDAC)=? "
				     + "ORDER BY RAP_DATE_REDAC ASC;";
		
		
			try {
					co = ConnexionBD.getConnexion();
					pstmt = (PreparedStatement) co.prepareStatement(query);
					
					pstmt.setString(1,matricule);
					pstmt.setInt(2,parseIntAnnee);
					pstmt.setInt(3,parseIntMois);
					result = pstmt.executeQuery();
					
					try{
						
					
						while (result.next()) {
							
							CompteRendu compteRendu = new CompteRendu(result.getInt("RAP_NUM"),
									  result.getDate("RAPPORT_VISITE.RAP_DATE_REDAC"), 
									  result.getDate("RAPPORT_VISITE.RAP_DATE"),
									  result.getString("RAPPORT_VISITE.RAP_BILAN"),
									  result.getString("PRATICIEN.PRA_NOM"),
									  result.getString("PRATICIEN.PRA_PRENOM"),
									  result.getString("PRATICIEN.PRA_VILLE"),
									  matricule,
									  result.getByte("RAPPORT_VISITE.RAP_LU"));
							
							
							comptesRendus.add(compteRendu);
							
							
						}
					}
					catch(Exception e){
						e.printStackTrace();	
					}	
				}
				catch(Exception e){
					e.printStackTrace();
				}
				
		return comptesRendus ;
	}
	
	/** Obtenir la liste des comptes-rendus
	*
	* @return la liste des comptes-rendus
	*/
	public List<CompteRendu> getComptesRendus() {
		return comptesRendus;
	}		
	
	/** Obtenir la liste des praticiens
	 * 
	 * @return la liste des praticiens
	 */
	public List<Praticien> getPraticiensHesitants(){
		System.out.println("[ModeleAppliCR::getPraticiensHesitants()]");
		List<Praticien> praticiensHesitants = new ArrayList<Praticien>() ;
		
		String query = "SELECT PRATICIEN.PRA_NOM, PRATICIEN.PRA_PRENOM, PRATICIEN.PRA_VILLE, PRATICIEN.PRA_COEFNOTORIETE, RAPPORT_VISITE.PRA_NUM, RAPPORT_VISITE.RAP_COEFCONFIANCE, RAPPORT_VISITE.RAP_DATE, RAPPORT_VISITE.RAP_NUM "
					 + "FROM PRATICIEN, RAPPORT_VISITE "
					 + "WHERE RAPPORT_VISITE.PRA_NUM = PRATICIEN.PRA_NUM "
					 + "AND PRATICIEN.PRA_NUM IN "
					 + "(SELECT RAPPORT_VISITE.PRA_NUM "
					 + "FROM RAPPORT_VISITE "
					 + "WHERE RAPPORT_VISITE.RAP_COEFCONFIANCE < 10)";
		
//		String query = "SELECT * from PRATICIEN inner join RAPPORT_VISITE on RAPPORT_VISITE.PRA_NUM= PRATICIEN.PRA_NUM where RAP_COEFCONFIANCE < 5;";

		try{
			co = ConnexionBD.getConnexion();
			Statement stat = (Statement) co.createStatement(); 
			ResultSet resultat = stat.executeQuery(query);
			while(resultat.next()){
				

				
				int numero = resultat.getInt("RAPPORT_VISITE.PRA_NUM");
				String nom = resultat.getString("PRATICIEN.PRA_NOM") ;
				String prenom = resultat.getString("PRATICIEN.PRA_PRENOM") ;
				String ville = resultat.getString("PRATICIEN.PRA_VILLE");
				float coefnotoriete = resultat.getFloat("PRATICIEN.PRA_COEFNOTORIETE");
				float coefconfiance = resultat.getFloat("RAPPORT_VISITE.RAP_COEFCONFIANCE");
				Date dateVisite = resultat.getDate("RAPPORT_VISITE.RAP_DATE");
				
				
				this.praticiensHesitants.add(new Praticien(numero, nom, prenom, ville, coefnotoriete,
						                                   coefconfiance, dateVisite));
			}

		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		return praticiensHesitants ;
	}
	
	/** Modifier l'�tat du compte-rendu 
	 * 
	 * @param numero Le num�ro du compte-rendu
	 */
	public void setLu(int numero){
//		String requete ="UPDATE rapport_visite SET RAP_LU = 'Oui' WHERE RAP_NUM = ?;";
		
		String requete ="UPDATE RAPPORT_VISITE SET RAP_LU = 1 WHERE RAP_NUM = ?;";
		
		try {
			co = ConnexionBD.getConnexion() ;
			PreparedStatement pstmt = (PreparedStatement) co.prepareStatement(requete);
			pstmt.setInt(1,numero);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.err.println(e.getMessage());
		}
	}
	
//	/** Obtenir le compte-rendu s�lectionn�
//	* @return Le compte-rendu s�lectionn�
//	*/
//	public CompteRendu getCompteRenduSelectionne() {
//		return compteRenduSelectionne;
//	}
//	
//	/** Modifier le compte-rendu s�lectionn�
//	* @param compteRenduSelectionne Le compte-rendu 
//	*/
//	public void setCompteRenduSelectionne(CompteRendu compteRenduSelectionne) {
//		this.compteRenduSelectionne = compteRenduSelectionne;
//	}
//	
//	/** Sélectionner un compte rendu
//	 * 
//	 * @param anneeSelected Année du compte rendu sélectionné
//	 * @param moisSelected Mois du ducompte rendu sélectionné
//	 * @param visiteurSelected Visiteur du compte rendu sélectionné
//	 */
//	public void choisirCompteRendu(String anneeSelected, String moisSelected, String visiteurSelected) {
//		System.out.println("[ModeleAppliCR::choisirCompteRendu()]");
//		String requete = "SELECT PRATICIEN.PRA_NOM, PRATICIEN.PRA_VILLE, RAPPORT_VISITE.RAP_DATE, "
//				       + "RAPPORT_VISITE.RAP_DATE_REDAC, RAPPORT_VISITE.RAP_BILAN, RAPPORT_VISITE.RAP_MOTIF, "
//				       + "RAPPORT_VISITE.VIS_MATRICULE , RAPPORT_VISITE.RAP_NUM "
//				       + "FROM RAPPORT_VISITE, PRATICIEN "
//				       + "WHERE RAPPORT_VISITE.PRA_NUM=PRATICIEN.PRA_NUM AND YEAR(RAP_DATE)= ? "
//				       + "AND MONTH(RAP_DATE)= ? AND VIS_MATRICULE= ?";
//		try {
//			Connection connexion = ConnexionBD.getConnexion();
//			PreparedStatement pstmt = (PreparedStatement) connexion.prepareStatement(requete);
//			ResultSet resultat = pstmt.executeQuery();
//
//			pstmt.setString(1, anneeSelected);
//			pstmt.setString(2, moisSelected);
//			pstmt.setString(3, visiteurSelected);
//
//			while (resultat.next()) {
//				int numero = resultat.getInt("RAP_NUM");
//				String nomVis = resultat.getString("RAPPORT_VISITE.VIS_MATRICULE");
//				String nomPra = resultat.getString("PRATICIEN.PRA_NOM");
//				String villePra = resultat.getString("PRATICIEN.PRA_VILLE") ;
//				Date dateVisite = resultat.getDate("RAPPORT_VISITE.RAP_DATE") ;
//				Date dateRedac = resultat.getDate("RAPPORT_VISITE.RAP_DATE_REDAC") ;
//				String bilan = resultat.getString("RAPPORT_VISITE.RAP_BILAN");
//				String motif = resultat.getString("RAPPORT_VISITE.RAP_MOTIF");
//				boolean read = resultat.getBoolean("RAPPORT_VISITE.RAP_LU");
//				this.comptesRendus.add(new CompteRendu(numero, dateRedac, dateVisite, bilan, motif, 
//						                               nomPra, villePra, nomVis, read)) ;
//			}
//		}
//		catch (Exception ex) {
//			ex.printStackTrace();
//		}
//	}
	
//	/** Mettre le compte rendu "consulté"
//	 * 
//	 * @param numCompteRendu Le numéro du compte rendu
//	 */
//	public void setRead(int numCompteRendu) {
//		String requete = "UPDATE RAPPORT_VISITE "
//					   + "SET RAP_LU = 1 "
//					   + "WHERE RAP_NUM = ? ;";
//		try{
//			Connection connexion = ConnexionBD.getConnexion() ; 
//			PreparedStatement pstat = (PreparedStatement) connexion.prepareStatement(requete);
//			pstat.setInt(1,numCompteRendu);
//			int resultat = pstat.executeUpdate();
//		}
//		catch(Exception ex){
//			ex.printStackTrace();			
//		}
//	}


}
