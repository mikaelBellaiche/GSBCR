package gsb;

import java.sql.Date;
import java.util.List;

import javax.swing.JButton;
import javax.swing.table.AbstractTableModel;

public class ModeleListeCompteRendus extends AbstractTableModel{
	
	private static final long serialVersionUID = 1L;
	private List<CompteRendu> comptesRendus ;
	private final String[] entetes = {"Date de redaction","Date de visite","Nom du praticien","Pr�nom du praticien","Ville du praticien","Consulte","Selectionner"} ;
	private ModeleAppliCR modele ;
	private Controleur controleur;
	
	/** Cr�er le mod�le de la liste des clients
	*
	* @param modele Le mod�le de l'application
	*/
	public ModeleListeCompteRendus(ModeleAppliCR modele, Controleur controleur){
		super() ;
		System.out.println("[ModeleListeCompteRendus::ModeleListeCompteRendus()]") ;
		this.modele = modele ;
		this.controleur = controleur ;
		comptesRendus = modele.getComptesRendus();
	}
	
	/** Obtenir le modèle
	 * 
	 * @return Le modèle
	 */
	public ModeleAppliCR getModele(){
		System.out.println("[ModeleListeCompteRendus::getModele()]");
		return modele ;
	}
	
	/** Obtenir le modèle
	 * 
	 * @return le modèle
	 */
	public Controleur getControleur(){
		System.out.println("[ModeleListeCompteRendus::getControleur()]");
		return controleur;
	}
	
	/** Obtenir le num�ro du rapport 
    *
    * @return le num�ro du rapport
    */
	 public int getNumero(int row) {
	        return comptesRendus.get(row).getNumero();
	 }
	
	/** Obtenir le nom du visiteur du compte rendu sélectionné
	 * 
	 * @param row La ligne
	 * @return Le compte rendu du visiteur
	 */
	public String getMatriculeVis(int row){
		return comptesRendus.get(row).getMatriculeVis();
	}
	
	/** ??
	 * 
	 * @param row La ligne
	 * @return ??
	 */
	public String getNom(int row){
		return comptesRendus.get(row).getNomPra();
	}
	
	/** Obtenir la ville
	 *  
	 * @param row La Ligne
	 * @return La ville du compte rendu
	 */
	public String getVille(int row){
		return comptesRendus.get(row).getVillePra();
	}
	
	/** Obtenir le bilan du compte rendu sélectionné
	 * 
	 * @param row La ligne
	 * @return Le bilan du compte rendu
	 */
	public String getBilan(int row){
		return comptesRendus.get(row).getBilan();
	}
	
	
	public String getPrenomPra(int row){
		return comptesRendus.get(row).getPrenomPra();
	}


	/** Modifier l'�tat du rapport
    *
    * @param read l'�tat du rapport
    */
	 public void setLu(String lu){
		 lu = lu;
	 }
	
	/** Le nombre de colonne
	 * 
	 */
    public int getColumnCount() {
        return entetes.length;
    }
 
    /** Le nombre de ligne
     * 
     */
    public int getRowCount() {
        return comptesRendus.size();
    }
 
    /** Le nom des colonnes
     * 
     */
    public String getColumnName(int column) {
        return entetes[column];
    }
    
    
    public Class getColumnClass(int row){
        switch(row){
	    	case 0 :
	    		return Date.class ;
	    	case 1 :
	    		return Date.class ;
	    	case 2 :
	    		return String.class ;
	    	case 3 :
	    		return String.class ;
	    	case 4 :
	    		return String.class ;
	    	case 5 :
	    		return Byte.class ;
	    	case 6 :
	    		return JButton.class ;
	    	default :
	    		return Object.class ;
    	}
    }
    
    public Object getValueAt(int row, int column) {
        switch (column) {
        case 0:
            return comptesRendus.get(row).getDateRedac();
        case 1:
            return comptesRendus.get(row).getDateVisite();
        case 2:
        	return comptesRendus.get(row).getNomPra();
        case 3:
        	return comptesRendus.get(row).getPrenomPra();
        case 4:
             return comptesRendus.get(row).getVillePra();
        case 5:
           	return comptesRendus.get(row).getLu();
        case 6:
        	return "Consulte";        		
        default:
            return null;
        }
    }
    
    public boolean isCellEditable(int row, int column){
    	switch(column){
    		case 6 :
    			return true;
    		default :
    			return false;
    	}
    }

    /** Obtenir la date de rédaction
     *  
     * @param row La ligne
     * @return La date de rédaction du compte rendu
     */
	public Date getDateRedac(int row) {
		return comptesRendus.get(row).getDateRedac();
	}

	/** Obtenir la date de visite
	 * 
	 * @param row La ligne
	 * @return la date de visite du compte rendu
	 */
	public Date getDateVisite(int row) {
		return comptesRendus.get(row).getDateVisite();		
		
	}


}
