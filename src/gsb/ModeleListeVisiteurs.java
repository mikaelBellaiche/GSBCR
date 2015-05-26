package gsb;

import java.util.List;

import javax.swing.JButton;
import javax.swing.table.AbstractTableModel;

public class ModeleListeVisiteurs extends AbstractTableModel{
	
	private List<Visiteur> visiteurs ;
	private final String[] entetes = { "Matricule", "Nom", "Prenom","Selectionner" };
	private ModeleAppliCR modele ;
	private Controleur controleur ;
	
	/** Cr�er le mod�le de la liste des clients
	*
	* @param modele Le mod�le de l'application
	*/
	public ModeleListeVisiteurs(ModeleAppliCR modele, Controleur controleur) {
		super() ;
		System.out.println("[ModeleListeVisiteurs::ModeleListeVisiteurs()]") ;
		this.modele = modele ;
		this.controleur = controleur ;
		visiteurs = modele.getVisiteurs() ;
	}
	
	/** Obtenir le modèle
	 * 
	 * @return le modèle
	 */
	public ModeleAppliCR getModele(){
		System.out.println("[ModeleListeVisiteurs::getModele()]");
		return modele ;
	}
	
	/** Obtenir le controleur
	 * 
	 * @return le controleur
	 */
	public Controleur getControleur(){
		System.out.println("[ModeleListeVisiteurs::getControleur()]");
		return controleur;
	}
	
	/** Obtenir le matricule des visiteurs
	 * 
	 * @param row La ligne
	 * @return Le matricule
	 */
	public String getMatVisiteur(int row){
		return visiteurs.get(row).getMatVisiteur();
	}
	
	/** Obtenir le nom des visiteurs
	 * 
	 * @param row La ligne
	 * @return Le nom
	 */
	public String getNom(int row){
		return visiteurs.get(row).getNom();
	}
	
	/** Obtenir le prénom des visiteurs
	 * 
	 * @param row la ligne
	 * @return le prénom
	 */
	public String getPrenom(int row){
		return visiteurs.get(row).getPrenom();
	}

	@Override
    public int getColumnCount() {
        return entetes.length;
    }
 
    @Override
    public int getRowCount() {
        return visiteurs.size();
    }
 
    @Override
    public String getColumnName(int column) {
        return entetes[column];
    }
    
    public Class getColumnClass(int column){
        switch(column){
	    	case 0 :
	    		return String.class ;
	    	case 1 :
	    		return String.class ;
	    	case 2 :
	    		return String.class ;
	    	case 3 :
	    		return JButton.class ;
	    	default :
	    		return Object.class ;
    	}
    } 
    
    @Override
    public Object getValueAt(int row, int column) {
        switch (column) {
        case 0:
            return visiteurs.get(row).getMatVisiteur();
        case 1:
            return visiteurs.get(row).getNom();
        case 2:
            return visiteurs.get(row).getPrenom();
        case 3:
        	return "Selectionner";
        default:
            return null;
        }
    }
    
    public boolean isCellEditable(int row, int column){
    	switch(column){
    		case 3 :
    			return true;
    		default :
    			return false;
    	}
    }

}
