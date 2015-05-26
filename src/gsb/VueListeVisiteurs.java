package gsb;

import java.awt.Dimension;

import javax.swing.Box;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class VueListeVisiteurs extends JPanel {

	private static final long serialVersionUID = 1L;
	private Controleur controleur ;
	private ModeleAppliCR modele ;
	private JTable tVisiteurs ;
	private ModeleListeVisiteurs modeleTableauVisiteurs ;
	
	/** Créer la vue de la liste des visiteurs
	 * 
	 * @param modele le modele
	 * @param controleur le controleur
	 */
	public VueListeVisiteurs(ModeleAppliCR modele, Controleur controleur) {
		super();
		System.out.println("[VueListeVisiteurs::VueListeVisiteurs()]");
		this.controleur = controleur;
		this.modele = modele;
		
		Box boxPrincipal = Box.createVerticalBox() ;
		Box boxEtiquette = Box.createHorizontalBox() ;
		Box boxTableau = Box.createHorizontalBox() ;

		boxEtiquette.add(new JLabel("Visiteurs :")) ;
		boxEtiquette.add(Box.createHorizontalGlue()) ;
		
		modeleTableauVisiteurs = new ModeleListeVisiteurs(modele,controleur) ;
		tVisiteurs = new JTable(modeleTableauVisiteurs) ;
		tVisiteurs.setRowHeight(30) ;
		
		JScrollPane spVisiteurs = new JScrollPane(tVisiteurs) ;
		spVisiteurs.setPreferredSize(new Dimension(1090,420)) ;
		
		boxTableau.add(spVisiteurs) ;
		
		boxPrincipal.add(boxEtiquette) ;
		boxPrincipal.add(boxTableau) ;
		
		this.add(boxPrincipal) ;
		
		
	}
	/** Obtenir le controleur
	 * 
	 * @return le controleur
	 */
	public Controleur getControleur() {
		System.out.println("[VueListeVisiteurs::getControleur()]");
		return controleur;
	}
	
	/** Modifier le controleur
	 * 
	 * @param controleur Le controleur
	 */
	public void setControleur(Controleur controleur) {
		System.out.println("[VueListeVisiteurs::setControleutr()]");
		this.controleur = controleur;
	}
	
	/** Obtenir le modele
	 *  
	 * @return le modele
	 */
	public ModeleAppliCR getModele() {
		System.out.println("[VueListeVisiteurs::getModele()]");
		return modele;
	} 
	
	/** Modifier le modele
	 * 
	 * @param modele le modele
	 */
	public void setModele(ModeleAppliCR modele) {
		System.out.println("[VueListeVisiteurs::setModele()]");
		this.modele = modele;
	}
	
	/** Actualiser le tableau de la liste des visiteurs
	 * 
	 */
	public void actualiser(){
		System.out.println("[VueListeVisiteurs::actualiser()]") ;
		modeleTableauVisiteurs = new ModeleListeVisiteurs(modele,controleur) ;
		tVisiteurs.setModel(modeleTableauVisiteurs) ;
		this.appliquerRendu();
	}
		
	/** Appliquer le nouveau rendu de la liste des visiteurs
	 * 
	 */
	private void appliquerRendu(){
		System.out.println("[VueListeVisiteurs::appliquerRendu()]") ;
		this.tVisiteurs.getColumn("Selectionner").setCellRenderer(new RenduBoutonVisiteur()) ;
		this.tVisiteurs.getColumn("Selectionner").setCellEditor(new EditeurBoutonVisiteur(new JCheckBox())) ;
	}
}