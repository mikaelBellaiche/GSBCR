package gsb;



import java.util.Date;
import java.util.List;

import javax.swing.table.AbstractTableModel;

public class ModeleListePraticiensHesitants extends AbstractTableModel{
	
	private static final long serialVersionUID = 1L;
	private List<Praticien> praticiensHesitants ;
	private final String[] entetes = {"Numero","Nom","Pr�nom","Ville", "Coefficient de notoriete", "Coefficient de confiance","Date de visite"} ;
	private ModeleAppliCR modele;
	private Controleur controleur;
	
	public ModeleListePraticiensHesitants(ModeleAppliCR modele, Controleur controleur) {
		super();
		System.out.println("[ModeleListePraticiensHesitants::ModeleListePraticiensHesitants()]");
		this.modele = modele;
		this.controleur = controleur;
		praticiensHesitants = modele.getPraticiensHesitants() ;
	}
	
	/** Obtenir le modèle
	 * 
	 * @return le modèle
	 */
	public ModeleAppliCR getModele(){
		System.out.println("[ModeleListePraticiensHesitants::getModele()]");
		return modele ;
	}
	
	/** Obtenir le controleur
	 * 
	 * @return Le controleur
	 */
	public Controleur getControleur() {
		System.out.println("[ModeleListePraticiensHesitants::getControleur]");
		return controleur;
	}
	
	/** Modifier le controleur
	 * 
	 * @param controleur Le controleur
	 */
	public void setControleur(Controleur controleur) {
		System.out.println("[ModeleListePraticiensHesitants::setControleur()]");
		this.controleur = controleur;
	}
	
	/** Obtenir le numéro du praticien
	 * 
	 * @param row L'indice de la ligne
	 * @return Le numéro des praticiens
	 */
	public int getNumero(int row){
		return praticiensHesitants.get(row).getNumero();
	
	}
	
	/** Obtenir le nom du praticien
	 * 
	 * @param row L'indice de la ligne
	 * @return Le nom des praticiens
	 */
	public String getNom(int row){
		return praticiensHesitants.get(row).getNom();
	}
	
	/** Obtenir le pr�nom du praticien
	 * 
	 * @param row L'indice de la ligne
	 * @return Le pr�nom des praticiens
	 */
	public String getPrenom(int row){
		return praticiensHesitants.get(row).getPrenom();
	}
	
	/** Obtenir la ville des praticiens
	 * 
	 * @param row L'indice de la lighne
	 * @return la ville des praticiens
	 */
	public String getVille(int row){
		return praticiensHesitants.get(row).getVille();
	}
	
	/** Obtenir le coéfficient de notoriété des praticiens
	 * 
	 * @param row L'indice de la ligne
	 * @return La ville des praticiens
	 */
	public double getCoefnotoriete(int row) {
		return praticiensHesitants.get(row).getCoefnotoriete();
	}
	
	/** Obtenir la liste des coéfficients de confiances de praticiens
	 * 
	 * @param row L'indice de la ligne
	 * @return Le coeeficient de notoriete des praticiens
	 */
	public float getCoefconfiance(int row) {
		return praticiensHesitants.get(row).getCoefconfiance();
	}
	
	/** Obtenir la liste des dates de visite des praticiens
	 * 
	 * @param row
	 * @return
	 */
	public Date getDateVisite(int row) {
		return praticiensHesitants.get(row).getDateVisite();
	}
	
	public int getRowCount() {
		return praticiensHesitants.size();
	}
	
	public int getColumnCount() {
		return entetes.length;
	}
	
	public String getColumnName(int column){
		return entetes[column] ;
	}
	
	
	public Object getValueAt(int row, int column) {
		switch(column){
			case 0 :
				return praticiensHesitants.get(row).getNumero() ;
			case 1 :
				return praticiensHesitants.get(row).getNom() ;
			case 2 :
				return praticiensHesitants.get(row).getPrenom();
			case 3 :
				return praticiensHesitants.get(row).getVille() ;
			case 4 :
				return praticiensHesitants.get(row).getCoefnotoriete();
			case 5 :
				return praticiensHesitants.get(row).getCoefconfiance();
			case 6 :
				return praticiensHesitants.get(row).getDateVisite() ;
			default :
				return null ;
		}
	}

}
