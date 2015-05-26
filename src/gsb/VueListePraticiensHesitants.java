package gsb;

import java.awt.Dimension;

import javax.swing.Box;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class VueListePraticiensHesitants extends JPanel {
	
	private static final long serialVersionUID = 1L;
	private Controleur controleur ;
	private ModeleAppliCR modele ;
	private JTable tPraticiensHesitants ;
	private ModeleListePraticiensHesitants modeleTableauPraticiensHesitants ;
	
	/** Créer la vue de la liste des praticiens hesitants
	 * 
	 * @param modele
	 * @param controleur
	 */
	public VueListePraticiensHesitants(ModeleAppliCR modele, Controleur controleur) {
		super();
		System.out.println("[VueListePraticiensHesitants::VueListePraticiensHesitants()]");
		this.controleur = controleur;
		this.modele = modele;
		
		Box boxPrincipal = Box.createVerticalBox() ;
		Box boxEtiquette = Box.createHorizontalBox() ;
		Box boxTableau = Box.createHorizontalBox() ;
		
		boxEtiquette.add(new JLabel("Praticiens :")) ;
		boxEtiquette.add(Box.createHorizontalGlue()) ;
		
		modeleTableauPraticiensHesitants = new ModeleListePraticiensHesitants(modele, controleur) ;
		tPraticiensHesitants = new JTable(modeleTableauPraticiensHesitants) ;
		tPraticiensHesitants.setRowHeight(30) ;
		
		JScrollPane spPraticiensHesitants = new JScrollPane(tPraticiensHesitants) ;
		spPraticiensHesitants.setPreferredSize(new Dimension(1090,420)) ;
		
		boxTableau.add(spPraticiensHesitants) ;
		
		boxPrincipal.add(boxEtiquette) ;
		boxPrincipal.add(boxTableau) ;
		
		this.add(boxPrincipal) ;
		this.appliquerRendu();
		
		tPraticiensHesitants.setAutoCreateRowSorter(true);
	}

	/** Obtenir le controleur
	 * 
	 * @return Le controleur
	 */
	public Controleur getControleur() {
		System.out.println("[VueListePraticiensHesitants::getControleur()]");
		return controleur;
	}

	/** Modifier le controleur
	 * 
	 * @param controleur Le nouveau controleur
	 */
	public void setControleur(Controleur controleur) {
		System.out.println("[VueListePraticiensHesitants::setControleur()]");
		this.controleur = controleur;
	}

	/** Obtenir le modèle principal
	 * 
	 * @return Le modèle principal
	 */
	public ModeleAppliCR getModele() {
		System.out.println("[VueListePraticiensHesitants::getModele()]");
		return modele;
	}

	/** Modifier le modèle principal
	 * 
	 * @param modele Le nouveau modèle principal
	 */
	public void setModele(ModeleAppliCR modele) {
		System.out.println("[VueListePraticiensHesitants::setModele()]");
		this.modele = modele;
	}
	
	/** Appliquer les modifications sur le tableau de la liste des praticiens
	 * 
	 */
	private void appliquerRendu(){
		System.out.println("[VueListePraticiens::appliquerRendu()]") ;
		this.tPraticiensHesitants.setDefaultRenderer(Object.class,new RenduPraticiensHesitants()) ;
	}

	/** Actualiser la vue de la liste des praticiens
	 * 
	 */
	public void actualier(){
		System.out.println("[VuePraticiensHesitants::actualiser()]") ;
		modeleTableauPraticiensHesitants = new ModeleListePraticiensHesitants(modele, controleur) ;
		tPraticiensHesitants.setModel(modeleTableauPraticiensHesitants) ;
		this.appliquerRendu() ;
	}

}