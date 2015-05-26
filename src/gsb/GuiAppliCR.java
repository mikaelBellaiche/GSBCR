package gsb;

import java.awt.CardLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class GuiAppliCR extends JFrame implements ActionListener{
	
	private static final long serialVersionUID = 1L;

	private ModeleAppliCR modele ;
	private Controleur controleur ;
		
	private JMenuItem itemSeConnecter ;
	private JMenuItem itemSeDeconnecter ;
	private JMenuItem itemQuitter ;
	private JMenuItem itemVisualiserVisiteurs ;
	private JMenuItem itemVisualiserPraticiensHesitants ;
//	private JMenuItem itemVisualiserCompteRendus ;
	
	private JMenu menuComptesRendus ;
	
	
	private  JTextField matField;
	private JPasswordField mdpField;
	private JLabel matLabel;
	private JLabel mdpLabel;
	private JLabel infoLabel;
		
	private VueAccueil vueAccueil ;
	private VueListeVisiteurs vueListeVisiteurs ;
	private VueListeComptesRendus vueListeComptesRendus ;
//	private VueListeCompteRenduSelectionne vueListeCompteRenduSelectionne;
	private VueListePraticiensHesitants vueListePraticiensHesitants ;
	
	private CardLayout vues ;
	private Container conteneur ;
	
	/** Créer la vue principale
	 * 
	 * @param modele le modele
	 * @param controleur le controleur
	 */
	public GuiAppliCR(ModeleAppliCR modele, Controleur controleur) {
		super();
		System.out.println("[GuiAppliCR::GuiAppliCR()]");
		
		this.modele = modele;
		this.controleur = controleur ;
		
		this.controleur.setVuePrincipale(this);
		
		this.setTitle("GSB / Appli-CR") ;
		
		
		this.setSize(1120,520) ;
		this.setLocationRelativeTo(null) ;
		this.setDefaultCloseOperation(EXIT_ON_CLOSE) ;
		
		
		this.vues = new CardLayout(2,2) ;
		this.conteneur = this.getContentPane() ;
		this.conteneur.setLayout(this.vues) ;
		
		
		vueAccueil = new VueAccueil() ;
		vueListeVisiteurs = new VueListeVisiteurs(modele,controleur) ;
		vueListeComptesRendus = new VueListeComptesRendus(modele,controleur) ;
//		vueListeCompteRenduSelectionne = new VueListeCompteRenduSelectionne(modele,controleur);
		vueListePraticiensHesitants = new VueListePraticiensHesitants(modele,controleur) ;
		
		this.conteneur.add(vueAccueil,"Accueil") ;
		this.conteneur.add(vueListeVisiteurs,"Liste visiteurs") ;
		this.conteneur.add(vueListeComptesRendus,"Liste comptes-rendus") ;
//		this.conteneur.add(vueListeCompteRenduSelectionne,"Le compte rendu");
		this.conteneur.add(vueListePraticiensHesitants,"Liste praticiens hesitants") ;
		
		this.vues.show(this.conteneur, "Accueil");
		
		
		
		this.creerBarreMenus() ;
		this.setVisible(true) ;
		
		this.itemSeDeconnecter.setEnabled(false) ;
		this.menuComptesRendus.setEnabled(false) ;
		
	}
	
	/** Obtenir le modele
	 * 
	 * @return le modele
	 */
	public ModeleAppliCR getModele() {
		System.out.println("[GuiAppliCR::getModele()]");
		return modele;
	}
	
	/** Modifier le modele
	 * 
	 * @param modele le modele
	 */
	public void setModele(ModeleAppliCR modele) {
		System.out.println("[GuiAppliCR::setModele()]");
		this.modele = modele;
	}
	
	/** Obtenir le controleur
	 * 
	 * @return le controleur
	 */
	public Controleur getControleur() {
		System.out.println("[GuiAppliCR::getControleur()]");
		return controleur;
	}
	
	/** Modifier le controleur
	 * 
	 * @param controleur le controleur
	 */
	public void setControleur(Controleur controleur) {
		System.out.println("[GuiAppliCR::setControleur()]");
		this.controleur = controleur;
	}
	
	/** Créer la barre de menus
	 * 
	 */
	private void creerBarreMenus(){
		System.out.println("[GuiAppliCR::creerBarreMenus()]");
		
		JMenuBar barreMenus = new JMenuBar() ;
		
		JMenu menuFichier = new JMenu("Fichier") ;
		
		this.itemSeConnecter = new JMenuItem("Se connecter") ;
		this.itemSeConnecter.addActionListener(this) ;
		menuFichier.add(this.itemSeConnecter) ;
		
		this.itemSeDeconnecter = new JMenuItem("Se deconnecter") ;
		this.itemSeDeconnecter.addActionListener(this) ;
		menuFichier.add(this.itemSeDeconnecter) ;
		
		this.itemQuitter = new JMenuItem("Quitter") ;
		this.itemQuitter.addActionListener(this) ;
		menuFichier.add(this.itemQuitter) ;
		
		this.menuComptesRendus = new JMenu("Comptes-Rendus") ;
		
		this.itemVisualiserVisiteurs = new JMenuItem("Liste des visiteurs") ;
		this.itemVisualiserVisiteurs.addActionListener(this) ;
		this.menuComptesRendus.add(this.itemVisualiserVisiteurs) ;
		
		this.itemVisualiserPraticiensHesitants = new JMenuItem("Liste des praticiens hesitants") ;
		this.itemVisualiserPraticiensHesitants.addActionListener(this) ;
		this.menuComptesRendus.add(this.itemVisualiserPraticiensHesitants) ;
		
//		this.itemVisualiserCompteRendus = new JMenuItem("Liste comptes-rendus") ;
//		this.itemVisualiserCompteRendus.addActionListener(this) ;
//		this.menuComptesRendus.add(this.itemVisualiserCompteRendus) ;
		
		
		barreMenus.add(menuFichier) ;
		barreMenus.add(this.menuComptesRendus) ;
		
		this.setJMenuBar(barreMenus) ;
	}
	
	/** Permet de changer de vue
	 * 
	 * @param nomVue Le nom de la vue
	 */
	public void changerDeVue(String nomVue){
		System.out.println("[GuiAppliCR::changerDeVue()]");
		
		if(nomVue.equals("Accueil")){
			this.vues.show(this.conteneur,"Accueil") ;
		}
		else if(nomVue.equals("Se connecter")){
			this.vues.show(this.conteneur,"Accueil") ;
			matLabel = new JLabel("Matricule : ");
			matField= new JTextField();
			mdpLabel= new JLabel("Mot de passe : ");
			mdpField = new JPasswordField();
			mdpField.setEchoChar('*');
			infoLabel = new JLabel("Saisir votre identifiant et mot de passe :");
			
			Object[] infos = new Object[]{infoLabel, matLabel, matField, mdpLabel, mdpField};
			
			int reponse = JOptionPane.showOptionDialog(this,infos,"Identification", JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE, null, null, null);
			
			if(reponse == JOptionPane.OK_OPTION){
				if(matField.getText().isEmpty() || mdpField.getText().isEmpty()){

					JOptionPane.showMessageDialog(null, "Veuillez remplir tous les champs svp.", "Saisir votre login et mot de passe ", JOptionPane.ERROR_MESSAGE);
				}
				boolean connexionOk = this.controleur.tenterConnexion(matField.getText(), new String(mdpField.getPassword()));
				if(connexionOk){
					Authentification.seConnecter(matField.getText(), mdpField.getText());
					JOptionPane.showMessageDialog(this, "Bienvenue "+matField.getText());
					this.itemSeDeconnecter.setEnabled(true) ;
					this.itemSeConnecter.setEnabled(false) ;
					this.menuComptesRendus.setEnabled(true) ;
				}
			
				else {
					JOptionPane.showMessageDialog(this, "Connexion refusee");
					this.controleur.seConnecter();
				}
			}
			
			if(reponse == JOptionPane.CANCEL_OPTION){	
				this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			}
			this.vues.show(this.conteneur,"Accueil");
		}
		
		else if(nomVue.equals("Se deconnecter")){
			int reponse = JOptionPane.showConfirmDialog(null,"Voulez-vous mettre fin a la session ?","Fin de session",JOptionPane.YES_NO_OPTION) ;
			if(reponse == JOptionPane.YES_OPTION){
				this.itemSeDeconnecter.setEnabled(false) ;
				this.itemSeConnecter.setEnabled(true) ;
				this.menuComptesRendus.setEnabled(false) ;
				this.vues.show(this.conteneur,"Accueil") ;
			}
		}
		
		else if(nomVue.equals("Quitter")){
			int reponse = JOptionPane.showConfirmDialog(null,"Voulez-vous vraiment quitter l'application ?","Quitter l'application",JOptionPane.YES_NO_OPTION) ;
			if(reponse == JOptionPane.YES_OPTION){
				this.controleur.quitter() ;
			}
		}
		
		else if(nomVue.equals("Liste visiteurs")){
			this.vueListeVisiteurs.actualiser();
			this.vues.show(this.conteneur,nomVue) ;
		}
		
		else if(nomVue.equals("Liste comptes-rendus")){
			this.vueListeComptesRendus.actualiser();	
			this.vues.show(this.conteneur,nomVue) ;
			}
		
		else if (nomVue.equals("Liste praticiens hesitants")){
			this.vueListePraticiensHesitants.actualier();
			this.vues.show(this.conteneur,nomVue) ;
		}
//		else if(nomVue.equals("Le compte rendu")){
//			this.vueListeCompteRenduSelectionne.actualiser();
//			this.vues.show(this.conteneur,nomVue) ;
//			
//		}
	}
	
	@Override
	public void actionPerformed(ActionEvent evenement){
		System.out.println("----------------------------------------") ;
		System.out.println("[GuiAppliCR::actionPerformed()]") ;
		
		Object sourceEvt = evenement.getSource() ;
		
		if(sourceEvt == this.itemSeConnecter){
			this.controleur.seConnecter() ;
		}
		if(sourceEvt == this.itemSeDeconnecter){
			this.controleur.seDeconnecter() ;
		}
		if(sourceEvt == this.itemQuitter){
			this.controleur.quitterApplication() ;
		}
		else if(sourceEvt == this.itemVisualiserVisiteurs){
			this.controleur.visualiserVisiteurs() ;
		}
		else if(sourceEvt == this.itemVisualiserPraticiensHesitants){
			this.controleur.visualiserPraticiensHesitants() ;
		}
//		else if(sourceEvt == this.itemVisualiserCompteRendus){
//			this.controleur.visualiserComptesRendus(); 
//		}
	}

}
