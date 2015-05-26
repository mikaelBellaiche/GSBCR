package gsb;

import java.sql.SQLException;

public class AppliCR {
	
	/**
	 * @param args
	 */
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println("[AppliCR::main()]");
		
		
		System.out.println("[Création du modèle]");
		ModeleAppliCR modele = new ModeleAppliCR() ;
		
		System.out.println("[Création du controleur]");
		Controleur controleur = new Controleur(modele) ;
		
		System.out.println("[Création de la vue principale]");
		new GuiAppliCR(modele,controleur) ;
		
	}

}
