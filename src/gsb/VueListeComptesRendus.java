package gsb;

import java.awt.Dimension;
import java.util.ArrayList;
import java.util.List;

import javax.swing.Box;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class VueListeComptesRendus extends JPanel {

	private static final long serialVersionUID = 1L;
	private Controleur controleur ;
	private ModeleAppliCR modele ;
	private ModeleListeCompteRendus modeleTableauCompteRendus ;
	private JTable tCompteRendus ;
	
	private List<String> matriculeVis = new ArrayList<String>() ;
	
	private String moisSelected ;
	private String anneeSelected ;
	private String visiteurSelected ;
	
	/** Création de la vue de la liste des comptes rendus
	 * 
	 * @param modele Le modèle
	 * @param controleur Le controleur
	 */
	public VueListeComptesRendus(ModeleAppliCR modele, Controleur controleur) {
		super();
		System.out.println("[VueListeComptesRendus::VueListeComptesRendus()]");
		this.controleur = controleur;
		this.modele = modele;
		
		Box boxPrincipal = Box.createVerticalBox() ;
		Box boxEtiquette = Box.createHorizontalBox() ;
		Box boxEtiquette1 = Box.createHorizontalBox() ;
		Box boxEtiquette2 = Box.createHorizontalBox() ;
		Box boxTableau = Box.createHorizontalBox() ;
		
		boxEtiquette.add(new JLabel("Rapports de visite")) ;
		
		boxEtiquette.add(Box.createHorizontalGlue()) ;
		boxEtiquette1.add(Box.createHorizontalGlue()) ;
		boxEtiquette2.add(Box.createHorizontalGlue()) ;
		
		modeleTableauCompteRendus = new ModeleListeCompteRendus(modele,controleur) ;
		tCompteRendus = new JTable(modeleTableauCompteRendus) ;
		tCompteRendus.setRowHeight(30) ;
		
		this.appliquerRendu() ;
		
		JScrollPane spCompteRendus = new JScrollPane(tCompteRendus) ;
		spCompteRendus.setPreferredSize(new Dimension(1090,420)) ;
		
		boxTableau.add(spCompteRendus) ;
		
		boxPrincipal.add(boxEtiquette) ;
		boxPrincipal.add(boxEtiquette1) ;
		boxPrincipal.add(boxEtiquette2) ;
		boxPrincipal.add(boxTableau) ;
		
		this.add(boxPrincipal) ;
	}

	/** Obtenir le controleur
	 * 
	 * @return Le controleur
	 */
	public Controleur getControleur() {
		System.out.println("[VueListeComptesRendus::getControleur()]");
		return controleur;
	}

	/** Modifier le controleur
	 * 
	 * @param controleur Le nouveau controleur
	 */
	public void setControleur(Controleur controleur) {
		System.out.println("[VueListeComptesRendus::setControleur()]");
		this.controleur = controleur;
	}

	/** Obtenir le modèle principal
	 * 
	 * @return Le modèle principal
	 */
	public ModeleAppliCR getModele() {
		System.out.println("[VueListeComptesRendus::getModele()]");
		return modele;
	}

	/** Modifier le modèle principal
	 * 
	 * @param modele Le nouveau modèle principal
	 */
	public void setModele(ModeleAppliCR modele) {
		System.out.println("[VueListeComptesRendus::setModele()]");
		this.modele = modele;
	}
	
	/** Appliquer les modifications sur le tableau des comptes rendus
	 * 
	 */
	private void appliquerRendu(){
		System.out.println("[VueListeCompteRendus::appliquerRendu()]") ;
		this.tCompteRendus.getColumn("Selectionner").setCellRenderer(new RenduBoutonCompteRendus()) ;
		this.tCompteRendus.getColumn("Selectionner").setCellEditor(new EditeurBoutonCompteRendus(new JCheckBox())) ;
		}
	
	/** Acutaliser le vue de la liste des comptes rendus
	 * 
	 */
	public void actualiser(){
		System.out.println("[VueListeCompteRendus::actualiser()]") ;
		modeleTableauCompteRendus = new ModeleListeCompteRendus(modele,controleur) ;
		tCompteRendus.setModel(modeleTableauCompteRendus) ;
		this.appliquerRendu();
	}
	
}
